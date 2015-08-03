package com.gesoft.util;

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
    private final static String SMS_SERVICE_USERPASS = "jkwl10511";//短信服务密码
    
    public static void main(String[] args) {
        sendAuthCode("456789", "13770730744");
    }
    
    /**
     * 向用户发送验证码
     * @param authCode
     * @param cellPhone
     * @return
     */
    public static int sendAuthCode(String authCode, String cellPhone) {
        log.info("向手机号：{}，发送验证码:{}", cellPhone, authCode);
        String content = String.format("您在自己人健康请求的验证码为：%s，感谢您的注册。如非本人操作，请忽略此短信。【自己人健康】", authCode);
        return sendSMS(content, cellPhone);
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
