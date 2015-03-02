/**
 * 文件名称：ALoginLogsService.java
 * 版权所有：Copyright gesoft
 * 创建时间：2015年1月30日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.service;

import java.text.SimpleDateFormat;
import java.util.GregorianCalendar;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gesoft.dao.AUserDAO;
import com.gesoft.model.LogModel;
import com.gesoft.util.OnLineCounter;
import com.gesoft.util.SystemUtils;

/**
 * 在线用户Model
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
@Service
@Transactional
public class ALoginLogsService implements HttpSessionBindingListener
{
	
	public ALoginLogsService()
	{

	}

	@Resource
	private AUserDAO aUserDAO;
	
	private SimpleDateFormat dateFormatter =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	private HttpSession session;
	private long userId;
	private String userName;
	private String userIp;
	private String userTime;
	
	
	/**
	 * 描述信息：判断当前用户是否登录，如果此用户已有登录，则采用先进选出
	 * 		模式来踢出已登录的用户。
	 * 修改时间：2011-12-21
	 * @author wangcl
	 */
	public void hasLogOn() 
	{
		//取所有用户Map
		HashMap<String, HttpSession> map = OnLineCounter.getOnline();
		
		//判断是否存在，如果存在，则注销前一个
		if (map.get(this.userName.trim()) != null) 
		{
			HttpSession sessionid = map.get(this.userName.trim());
			OnLineCounter.removeUser(this.userName.trim());
			sessionid.invalidate();
		}
	}
	
	
	/**
	 * 描述：绑定用户登录
	 * 修改时间：2011-12-21
	 * @author wangcl
	 */
	public void valueBound(HttpSessionBindingEvent event) 
	{
		try 
		{
			GregorianCalendar gc=new GregorianCalendar();
			StringBuffer strLog = new StringBuffer();
			strLog.append("\n")
				.append("登录时间：" + dateFormatter.format(gc.getTime()) + "\n")
				.append("登录用户名：" + this.userName + "\n")
				.append("登录用户IP：" + this.userIp + "\n");
			SystemUtils.SOUT(strLog.toString());
			OnLineCounter.addUser(this.userName, this.session);
			
			// 插入数据库
			LogModel mLogModel = new LogModel();
			mLogModel.setUserId(this.userId);
			mLogModel.setStime(SystemUtils.getCurrentSystemTime());
			mLogModel.setIp(this.userIp);
			mLogModel.setOperFlag(1);
			aUserDAO.addUserLogsInfo(mLogModel);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}

	
	/**
	 * 描述：绑定用户退出
	 * 修改时间：2011-12-21
	 * @author wangcl
	 */
	public void valueUnbound(HttpSessionBindingEvent event) 
	{
		try 
		{
			GregorianCalendar gc=new GregorianCalendar();
			StringBuffer strLog = new StringBuffer();
			strLog.append("\n")
				.append("退出时间：" + dateFormatter.format(gc.getTime()) + "\n")
				.append("退出用户名：" + this.userName + "\n")
				.append("退出用户IP：" + this.userIp + "\n");
			SystemUtils.SOUT(strLog.toString());
			OnLineCounter.removeUser(this.userName);
			
			// 插入数据库
			LogModel mLogModel = new LogModel();
			mLogModel.setUserId(this.userId);
			mLogModel.setStime(SystemUtils.getCurrentSystemTime());
			mLogModel.setIp(this.userIp);
			mLogModel.setOperFlag(0);
			aUserDAO.addUserLogsInfo(mLogModel);
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}

	public String getUserIp() 
	{
		return userIp;
	}
	public void setUserIp(String userIp) 
	{
		this.userIp = userIp;
	}
	public long getUserId() 
	{
		return userId;
	}
	public void setUserId(long userId) 
	{
		this.userId = userId;
	}
	public String getUserName() 
	{
		return userName;
	}
	public void setUserName(String userName) 
	{
		this.userName = userName;
	}
	public HttpSession getSession() 
	{
		return session;
	}
	public void setSession(HttpSession session) 
	{
		this.session = session;
	}
	public String getUserTime()
	{
		return userTime;
	}
	public void setUserTime(String userTime)
	{
		this.userTime = userTime;
	}
}
