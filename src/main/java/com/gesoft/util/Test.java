/**
 * 文件名称：Test.java
 * 版权所有：Copyright njty
 * 创建时间：2015年2月4日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

/**
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
public class Test
{

	public static void main(String[] args)
	{
		//SystemUtils.SOUT(SystemUtils.getRandamNumber(6));
		//SystemUtils.SOUT(SystemUtils.getCurrentSystemTime("yyyyMMddHHmmssSSS"));

		System.out.println("\0".getBytes()[0]);
		try
		{
			
		}
		catch (Exception e)
		{
			e.printStackTrace();
			System.out.println(e.getStackTrace());
			
			map();
		}
	}

	
	public static void map()
	{
		
		try
		{
			StringBuffer strTemp = new StringBuffer();
			URL url = new URL("http://localhost:8080/yhxt/p/query/post.do");
			
			URLConnection conn = url.openConnection();
		
		    BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
		    String line = null;
		    while ((line = reader.readLine()) != null)
		    	strTemp.append(line);
		    reader.close();
		    
		    System.out.println(strTemp.toString());
		
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}
}
