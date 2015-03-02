package com.gesoft.util;

/**
 * 描述：用户在线统计, 如果同一用户进行登录，则后登录的踢出新登录的，
 * 		即采用先进选出操作！ 
 * Create time：2010-12-14
 * @author wangcl
 */
import java.util.HashMap;

import javax.servlet.http.HttpSession;

public class OnLineCounter 
{
	private static final HashMap<String, HttpSession> mRetMap = new HashMap<String, HttpSession>();
	
	private OnLineCounter() 
	{
	
	}
	
	/**
	 * 描述：添加用户，并保留session
	 * Create time：2010-12-14
	 * @author wangcl
	 * @param username
	 * @param session
	 */
	public static void addUser(String username, HttpSession session)
	{
		if (username.trim().length() > 0
				&& mRetMap.get(username.trim()) == null)
		{
			mRetMap.put(username.trim(), session);
		}
	}
	
	
	/**
	 * 描述：删除用户
	 * Create time：2010-12-14
	 * @author wangcl
	 * @param username
	 */
	public static void removeUser(String username)
	{
		if (username.trim().length() > 0
				&& mRetMap.get(username.trim()) != null)
		{
			mRetMap.remove(username.trim());
		}
	}
	
	/**
	 * 描述：取所有已登录的用户信息
	 * Create time：2010-12-15
	 * @author wangcl
	 * @return
	 */
	public static HashMap<String, HttpSession> getOnline()
	{
		return mRetMap;
	}

	
	/**
	 * 描述：获取在线用户数
	 * Create time：2010-12-14
	 * @author wangcl
	 * @return
	 */
	public static int getOnlineCnt()
	{
		return mRetMap.size();
	}
}
