package com.gesoft.util;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import org.apache.ibatis.cache.decorators.FifoCache;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Node;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class SMSUtil {
    
    private final static Logger log = LoggerFactory.getLogger(SMSUtil.class);
    
    private final static String STATUS_SUCC = "Success";//短信发送返回该结果表示成功
    
    public final static int RET_SUCC = 1;//发送短信成功
    public final static int RET_FAIL = 0;//发送短信失败

    private final static String SMS_SERVICE_USERNAME = "jkwl105";//短信服务账号
    private final static String SMS_SERVICE_USERPASS = "zjr86612803";//短信服务密码
    
    //缓存用户验证码及手机号，用来实现简易验证验证码合法性
    private final static Map<String, Long> authCodeMap = new ConcurrentHashMap<String, Long>();
    private final static long EXPIRE_TIME = 10 * 60 * 1000;//验证码失效时间  10分钟
    
    public static void main(String[] args) {
        sendAuthCode("456789", "13770730744");
    }
    
    /**
     * 向用户发送验证码
     * @param authCode
     * @param cellphone
     * @return
     */
    public static int sendAuthCode(String cellphone) {
        return sendAuthCode(SystemUtils.getRandamNumber(6), cellphone);
    }
    
    
    /**
     * 向用户发送验证码
     * @param authCode
     * @param cellphone
     * @return
     */
    public static int sendAuthCode(String authCode, String cellphone) {
        log.info("向手机号：{}，发送验证码:{}", cellphone, authCode);
        String content = String.format("您在自己人健康请求的验证码为：%s，感谢您的注册。如非本人操作，请忽略此短信。【自己人健康】", authCode);
        int ret = sendSMS(content, cellphone);
        if (ret == RET_SUCC) {
            addAuthCodeToMap(cellphone, authCode);
        }
        return ret;
    }
    
    /**
     * 将成功发送的验证码加入缓存map中，供后面验证
     * @param cellphone
     * @param authCode
     */
    private static void addAuthCodeToMap(String cellphone, String authCode) {
        if (!StringUtil.isNullOrEmpty(cellphone) && !StringUtil.isNullOrEmpty(authCode)) {
            authCodeMap.put(cellphone + "_" + authCode, System.currentTimeMillis());
        }
        removeExpiredAuthCode();
    }
    
    /**
     * 检测手机号与验证码是否合法
     * @param cellphone
     * @param authCode
     * @return
     */
    public static boolean isAuthCodeValid(String cellphone, String authCode) {
        if (!StringUtil.isNullOrEmpty(cellphone) && !StringUtil.isNullOrEmpty(authCode)) {
            Long addTime = authCodeMap.get(cellphone + "_" + authCode);
            if (addTime != null && addTime + EXPIRE_TIME > System.currentTimeMillis()) {
                return true;//该手机号与验证码获取的加入map时间在10分钟之内的认为其有效
            }
        }
        return false;
    }
    
    /**
     * 从内存中将失效的验证码删除
     */
    public static void removeExpiredAuthCode() {
        Set<Entry<String, Long>> entrySet = authCodeMap.entrySet();
        if (entrySet != null) {
            long currTime = System.currentTimeMillis();
            List<String> timeoutKeyList = new ArrayList<String>();
            Iterator<Entry<String, Long>> ite = entrySet.iterator();
            while (ite.hasNext()) {
                Entry<String, Long> entry = ite.next();
                if (entry.getValue() + EXPIRE_TIME <= currTime) {
                    timeoutKeyList.add(entry.getKey());
                }
            }
            for (String key : timeoutKeyList) {
                authCodeMap.remove(key);
            }
        }
    }
    
    /**
     * 发送短信
     * @param content
     * @return  1:成功  其他：失败
     */
    private static int sendSMS(String content, String cellPhone) {
        StringBuilder sb = new StringBuilder();
        sb.append("http://sh2.ipyy.com/sms.aspx?action=send&userid=&account=").append(SMS_SERVICE_USERNAME);
        sb.append("&password=").append(SMS_SERVICE_USERPASS);
        sb.append("&mobile=").append(cellPhone);
        sb.append("&content=").append(content);
        sb.append("&sendTime=");
        String ret = HttpUtil.sendPost(sb.toString());
        if (!StringUtil.isNullOrEmpty(ret)) {
            System.out.println(ret);
            try {
                Document document = DocumentHelper.parseText(ret);
                Node statusNode = document.selectSingleNode("//returnsms/returnstatus");
                if (statusNode != null) {
                    String status = statusNode.getText();
                    if (status.equals(STATUS_SUCC)) {
                        return RET_SUCC;
                    } else {
                        Node msgNode = document.selectSingleNode("//returnsms/message");
                        String msg = msgNode != null ? msgNode.getText() : "";
                        log.info("发送短信失败，失败提示:{}", msg);
                    }
                }
            } catch (DocumentException e) {
                log.info("解析短信发送返回失败", e);
            }
        }
        return RET_FAIL;
    }
}
