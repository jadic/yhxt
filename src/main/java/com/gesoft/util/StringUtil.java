package com.gesoft.util;

import java.math.BigDecimal;
import java.nio.charset.Charset;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

/**
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
public class StringUtil
{
    
    /**
     * 检测给定的字符串是否是 null 或 空字符串(length == 0)
     * @param value value
     * @return boolean
     */
    public static boolean isNullOrEmpty(String value)
    {
        return (value == null) || (value.length() == 0);
    }
    
    public static boolean isAllNotNullAndNotEmpty(String ... args) {
        for (String arg : args) {
            if (isNullOrEmpty(arg)) {
                return false;
            }
        }
        return true;
    }
    
    /**
     * 获取有效的字符串值。如果是 null 则返回 ""，否则返回自身
     * 
     * @param value value
     * @return String
     */
    public static String getValidString(String value)
    {
        return isNullOrEmpty(value) ? "" : value;
    }
    
    /**
     * 获取有效的字符串值。如果是 null 则返回 defaultValue，否则返回自身
     * 
     * @param value value
     * @param defaultValue defaultValue
     * @return String
     */
    public static String getValidString(String value, String defaultValue)
    {
        return isNullOrEmpty(value) ? defaultValue : value;
    }
    
  
    
    /**
     * 格式化Double
     * @param value 需要格式化的double值
     * @param decimals 保留的小数位数
     * @return String
     */
    public static String formatDouble(double value, int decimals)
    {
        String strVal = Double.toString(value);
        return formateStr(decimals, strVal);
    }
    
    /**
     * 格式化Float
     * @param value 需要格式化的float值
     * @param decimals 保留的小数位数
     * @return String
     */
    public static String formatFloat(float value, int decimals)
    {
        String strVal = Float.toString(value);
        return formateStr(decimals, strVal);
    }

    public static String formateStr(int decimals, String strVal)
	{
		int pointPos = strVal.indexOf(".");
        if ((pointPos > -1) && (decimals >= 0))
        {
            return strVal.substring(0, pointPos + decimals);
        }
        else
        {
            return strVal;
        }
	}
    
    /**
     * 描述信息：去掉科学计数法
     * 创建时间：2013-08-19 17:52:58
     * @author WCL （ln_admin@yeah.net）
     * @param value
     * @return
     */
    public static String formatDouble2(Double value,int decimals)
	{
    	BigDecimal b = new BigDecimal(value.doubleValue()).setScale(decimals,BigDecimal.ROUND_HALF_DOWN);
    	return b.toString();
	}
    
    
    
    /**
     * 描述信息：维语存库时用
     * 创建时间：2013-07-11 17:11:29
     * @author WCL （ln_admin@yeah.net）
     * @param param
     * @return
     */
    public synchronized static String funStrEncoder(String param)
	{
    	BASE64Encoder encoder = new BASE64Encoder();
    	return encoder.encode(param.getBytes(Charset.forName("UNICODE")));
	}
   
    /**
     * 描述信息：维语取时用
     * 创建时间：2013-07-11 17:11:22
     * @author WCL （ln_admin@yeah.net）
     * @param param
     * @return
     */
    public synchronized static String funStrDecoder(String param)
	{
    	try
		{
    		 BASE64Decoder decoder=new BASE64Decoder();
    		 return new String(decoder.decodeBuffer(param), "UNICODE");
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return "";
	}
    
}
