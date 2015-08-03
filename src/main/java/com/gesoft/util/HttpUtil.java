package com.gesoft.util;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class HttpUtil {
    
    private final static Logger log = LoggerFactory.getLogger(HttpUtil.class);
    
    private final static String RET_ERR = "";
    
    public static String sendPost(String httpUrl){
        HttpURLConnection httpConn = null;
        InputStream in = null;
        OutputStream out = null;
        try{
            httpConn = createHttpURLConnection(httpUrl, "POST");

            //getOutputStream会隐含的进行connect(即：httpConn.connect())
            out = httpConn.getOutputStream();
            out.flush(); 
             
            //System.out.println("httpConn.getResponseCode()="+httpConn.getResponseCode());
            if(httpConn.getResponseCode() == HttpURLConnection.HTTP_OK){
                in = httpConn.getInputStream();   //建立连接成功，发送请求并得到响应数据
                return getStreamString(in, httpConn.getContentEncoding(), "UTF-8");
            }
        }catch(Exception e){
            log.info("sendPost err", e);
        }finally{
            try{
                if (out != null) {
                    out.close();
                }
            }catch(IOException e){
                log.info("out.close err", e);
            }
            try{
                if (in != null) {
                    in.close();
                }
            }catch(IOException e){
                log.info("in.close err", e);
            }
            try{
                if(httpConn != null){
                    httpConn.disconnect();
                }
            }catch(Exception e){
                log.info("httpConn.disconnect err", e);
            }
        }
        return RET_ERR;
    }
    
    private static HttpURLConnection createHttpURLConnection(String httpUrl, String requestMethod) throws Exception{
        URL url = new URL(httpUrl);
        HttpURLConnection httpConn = (HttpURLConnection)url.openConnection();
        httpConn.setRequestMethod(requestMethod);
        httpConn.setDoOutput(true);   //设置是否向httpUrlConnection输出，因为post请求，参数要放在http正文内，因此需要设为true, 默认情况下是false;
        httpConn.setDoInput(true);   //设置是否从httpUrlConnection读入，默认情况下是true; 
        httpConn.setUseCaches(false);
        httpConn.setInstanceFollowRedirects(false);
        httpConn.setConnectTimeout(60 * 1000);
        httpConn.setReadTimeout(60 * 1000);
        /**
         * 此处表示客户端想要获取什么样的数据格式： 1.application/xml-->将得到xml格式的数据； 2.application/json-->将得到json格式的数据；
         * 3.text/plain;charset=UTF-8-->将得到String格式的数据；
         */
//        httpConn.addRequestProperty("Content-Type", "application/json");
//        httpConn.addRequestProperty("Accept", "application/json");
//        //httpConn.addRequestProperty("Accept", "*/*");
//        httpConn.addRequestProperty("Accept-Encoding", "gzip,deflate,sdch");
//        httpConn.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.154 Safari/537.36");
        
        return httpConn;
    }
    
    public static String getStreamString(InputStream tInputStream, String contentEncoding, String charsetName){
        if(contentEncoding == null || contentEncoding.toLowerCase().indexOf("gzip") < 0){
            return getStreamString(tInputStream, charsetName);
        }

        java.util.zip.GZIPInputStream gzin = null;
        InputStreamReader isr = null;
        try{
            gzin = new java.util.zip.GZIPInputStream(tInputStream);
            isr = new InputStreamReader(gzin, StringUtil.isNullOrEmpty(charsetName)?"UTF-8":charsetName);
            java.io.BufferedReader br = new java.io.BufferedReader(isr);
            StringBuffer sb = new StringBuffer();
            String tempbf;
            while((tempbf = br.readLine()) != null){
                sb.append(tempbf);
            } 
            return sb.toString();
        }catch(IOException e){
            e.printStackTrace();
        }finally{
            if(gzin != null){
                try{
                    gzin.close();
                }catch(IOException e){
                    e.printStackTrace();
                }
            }

            if(isr != null){
                try{
                    isr.close();
                }catch(IOException e){
                    e.printStackTrace();
                }
            }
        }
        
        return null;
    }

    public static String getStreamString(InputStream tInputStream, String charsetName){
        if(tInputStream != null){
            ByteArrayOutputStream bos = null;
            try{
                bos = new ByteArrayOutputStream();
                byte[] data = new byte[8192];
                int length = 8192;
                while((length = tInputStream.read(data, 0, length)) != -1){
                    bos.write(data, 0, length);
                }
                byte[] content = bos.toByteArray();
                if(StringUtil.isNullOrEmpty(charsetName)){
                    String result = new String(content);
                    return result;
                }else{
                    String result = new String(content, charsetName);
                    return result;
                }

            }catch(IOException e){
                e.printStackTrace();
            }finally{
                if(bos != null){
                    try{
                        bos.close();
                    }catch(IOException e){
                        e.printStackTrace();
                    }
                }
            }

        }
        return null;
    }
}
