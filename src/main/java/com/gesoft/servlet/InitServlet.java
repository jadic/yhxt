/**
 * 文件名称：InitServlet.java
 * 版权所有：Copyright gesoft
 * 创建时间：2015年1月23日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;


/**
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
public class InitServlet extends HttpServlet 
{
	private static final long serialVersionUID = -1473498163708293217L;

	@Override
	public void init() throws ServletException 
	{
		
		System.out.println("===========>>" + getInitParameter("menuFlag"));
		/*System.getProperties().setProperty("socksProxySet", "true");
		//用的代理服务器
		System.getProperties().setProperty("socksProxyHost", "192.168.2.82");
		//代理端口
		System.getProperties().setProperty("socksProxyPort", "808");
		
		System.out.println("========>>   未进代理");
		SystemMenu.getInit().setMinVal(Integer.parseInt(getInitParameter("min")));
		SystemMenu.getInit().setMaxVal(Integer.parseInt(getInitParameter("max")));
		SystemMenu.getInit().setSocketIp(getInitParameter("socketIp"));
		SystemMenu.getInit().setSocketPort(Integer.parseInt(getInitParameter("socketPort")));
		 */
		//new Timer().schedule(new TimerTaskSessionInfo(), 10000, 30000);  
	}
	  
}
