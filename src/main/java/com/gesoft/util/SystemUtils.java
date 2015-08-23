/**
 * 文件名称：SystemUtils.java
 * 版权所有：Copyright gesoft
 * 创建时间：2015年1月26日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.util;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

/**
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
public class SystemUtils
{

	/**
	 * 描述信息：获取当前系统时间
	 * 创建时间：2015年1月26日 上午9:12:03
	 * @author WCL (ln_admin@yeah.net)
	 * @return
	 */
	public static String getCurrentSystemTime() 
	{
		return getCurrentSystemTime("yyyy-MM-dd HH:mm:ss");
	}
	
	/**
	 * 描述信息：获取当前系统时间
	 * 创建时间：2015年1月26日 上午9:13:02
	 * @author WCL (ln_admin@yeah.net)
	 * @param format
	 * @return
	 */
	public static String getCurrentSystemTime(String format) 
	{
		SimpleDateFormat dateFormatter =new SimpleDateFormat(format);
		Calendar c = Calendar.getInstance();
		return dateFormatter.format(c.getTime());
	}
	
	
	/**
	 * 描述信息：格式化毫秒值
	 * 创建时间：2015年1月30日 上午11:16:45
	 * @author WCL (ln_admin@yeah.net)
	 * @param stime
	 * @param format
	 * @return
	 */
	public static String funFormatCurrentTimeMillisInfo(long timeStamp, String format)
	{
		String strRet = getCurrentSystemTime();
		try
		{
			SimpleDateFormat formatter = new SimpleDateFormat(format);
			Date date = new Date(timeStamp);
			strRet =  formatter.format(date);
		}
		catch (Exception e)
		{
		}
		return strRet;
	}
	
	/**
	 * 描述信息：把字符串时间格式为Timestamp格式
	 * 创建时间：2015年1月31日 上午9:15:46
	 * @author WCL (ln_admin@yeah.net)
	 * @param strTime
	 * @param format
	 * @return
	 */
	public static Timestamp funTimeStamp(String strTime, String ... format)
	{
		Timestamp ts = null;
		try
		{
			SimpleDateFormat dateFormatter =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			if (format != null && format.length == 1)
			{
				dateFormatter =new SimpleDateFormat(format[0]);
			}
			
			Date date = dateFormatter.parse(strTime);
			ts = Timestamp.valueOf(dateFormatter.format(date));
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return ts;
	}
	
	/**
	 * 描述信息：格式化DATE，转为字符串
	 * 创建时间：2015年1月31日 上午9:17:29
	 * @author WCL (ln_admin@yeah.net)
	 * @param date
	 * @param format
	 * @return
	 */
	public static String funFormatterDataInfo(Date date, String ... format)
	{
		SimpleDateFormat dateFormatter =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if (format != null && format.length == 1)
		{
			dateFormatter =new SimpleDateFormat(format[0]);
		}
		return dateFormatter.format(date);
	}
	
	/**
	 * 描述信息：格式化毫秒值
	 * 创建时间：2015年1月30日 上午11:18:10
	 * @author WCL (ln_admin@yeah.net)
	 * @param timeStamp
	 * @return
	 */
	public static String funFormatCurrentTimeMillisInfo(long timeStamp)
	{
		return funFormatCurrentTimeMillisInfo(timeStamp, "yyyy-MM-dd HH:mm:ss,SSS");
	}
	
	/**
	 * 描述信息：取用户Session最后访问时间与当前系统时间比较
	 * 创建时间：2015年1月31日 下午2:07:42
	 * @author WCL (ln_admin@yeah.net)
	 * @param mUserLastAccessedTime
	 * @return
	 */
	public static boolean getUserLastAccessedTime(long mUserLastAccessedTime) 
	{
		Calendar c = Calendar.getInstance();
		
		//如果大于10分钟，则系统默认为此用户已退出，只是没响应关闭事件
		if ((c.getTimeInMillis() - mUserLastAccessedTime) > (1000 * 60 * 10) ) 
		{
			return true;
		}
		return false;
	}
	
	
	public static void SOUT(String strInfo)
	{
		System.out.println(strInfo);
	}
	
	public static String getRandamNumber(int digit) {
	    StringBuilder ret = new StringBuilder();
	    long val = Math.round(Math.random() * Math.pow(10, digit));
	    ret.append(String.valueOf(val));
	    int valLen = ret.length();
	    for (int i = 0; i < digit - valLen; i ++) {
	        ret.insert(0, "0");
	    }
	    return ret.toString();
	}
	
	
	/**
	 * 描述信息：是否为移动设备
	 * @创建时间：2015年8月12日 下午5:57:51
	 * @author WCL (ln_admin@yeah.net)
	 * @param request
	 * @return
	 */
	public static boolean isMobile(HttpServletRequest request)
	{
		String ua = request.getHeader("User-Agent").toLowerCase();
		System.out.println(ua);
		if (ua.indexOf("ipad") >= 0 
				|| ua.indexOf("iphone") >= 0
				|| ua.indexOf("android") >= 0 )
		{
			return true;
		}
		return false;
	}
	

}
