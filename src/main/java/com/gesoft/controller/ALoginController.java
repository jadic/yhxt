/**
 * 文件名称：LoginController.java
 * 版权所有：Copyright gesoft
 * 创建时间：2015年1月30日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gesoft.model.MsgModel;
import com.gesoft.model.OutModel;
import com.gesoft.model.UserModel;
import com.gesoft.service.ALoginLogsService;
import com.gesoft.service.ALoginService;
import com.gesoft.util.OnLineCounter;
import com.gesoft.util.SystemUtils;

/**
 * 用户登录
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
@Controller
public class ALoginController extends BaseController
{
	private static final Logger logger = LoggerFactory.getLogger(ALoginController.class);
	
	@Resource
	private ALoginService loginService;
	
	@Resource
	private ALoginLogsService aLoginLogsService;
	
	/**
	 * 描述信息：用户登录
	 * 创建时间：2015年1月30日 下午6:16:02
	 * @author WCL (ln_admin@yeah.net)
	 * @param user
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/a/login.do", method=RequestMethod.POST)
	public ModelAndView login(UserModel user, ModelMap model, HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView result = new ModelAndView("/admin/login/login");
		HttpSession session = request.getSession();
		try
		{
			if(user != null)
			{
				if (session.getAttribute("rand") != null)
				{
					if (user.getRand().equals(session.getAttribute("rand")))
					{
						UserModel mLoginModel = loginService.login(user);
						if (user.state == GLOBAL_SERVICE_SUCCESS)
						{
							result = new ModelAndView("/admin/common/client_main");
							model.addAttribute("loginUser", mLoginModel);
							
							aLoginLogsService.setUserId(mLoginModel.getUserId());
							aLoginLogsService.setUserName(user.getName());
							aLoginLogsService.setUserIp(request.getRemoteAddr());
							aLoginLogsService.setUserTime(SystemUtils.funFormatterDataInfo(new Date(session.getCreationTime())));
							aLoginLogsService.setSession(session);
							
							//判断用户是否已登录，如果已登录，则注销前一个Session，即先进选出
							aLoginLogsService.hasLogOn();
							
							session = request.getSession(true);
							session.setAttribute("OnLineUser", aLoginLogsService);
							session.setAttribute(SESSION_KEY_ISLOGIN, GLOBAL_YES);
							session.setAttribute(SESSION_KEY_LOGINNAME, mLoginModel.getName());
							session.setAttribute(SESSION_KEY_UID, mLoginModel.getUserId());
						}
						else 
						{
							result.addObject("errorinfo", user.msgValue);
						}	
					}
					else
					{
						result.addObject("errorinfo", "验证码输入不正确！");
					}
				}
			}
			result.addObject("userName", user.getName());
		}
		catch (Exception e)
		{
			logger.error("LoginController login error：", e);
		}
		return result;
	}
	
	/**
	 * 描述信息：用户退出
	 * 创建时间：2015年1月30日 下午6:14:15
	 * @author WCL (ln_admin@yeah.net)
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/a/logout.do")
	public String logout(HttpServletRequest request, HttpServletResponse response)
	{
		try
		{
			HttpSession session = request.getSession();
			session.invalidate();
		}
		catch (Exception e)
		{
			logger.error("LoginController logout error：", e);
		}
		return "/admin/login/login";
	}
	
	
	/**
	 * 描述信息：在线用户
	 * 创建时间：2015年1月31日 下午2:05:53
	 * @author WCL (ln_admin@yeah.net)
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/a/onlinecnt.do", method=RequestMethod.POST)
	public @ResponseBody MsgModel onlinecnt(HttpServletRequest request, HttpServletResponse response)
	{
		MsgModel msgModel = new MsgModel();
		try 
		{
			HttpSession session = request.getSession();
			
			if (session.getAttribute(SESSION_KEY_UID) != null) 
			{
				HashMap<String, HttpSession> mRetMap = OnLineCounter.getOnline();
				if (mRetMap != null && mRetMap.size() > 0) 
				{
					Iterator<Entry<String, HttpSession>> it = mRetMap.entrySet().iterator();
					while (it.hasNext()) 
					{
						Entry<String, HttpSession> entry = it.next();
						HttpSession sessionid = entry.getValue();
						
						/**
						 * 判断用户时否退出系统（当用户为非正常关闭时，根据最后访问系统的时间来判断是否已退出）
						 * session.getCreationTime()获取session的创建时间
						 * session.getLastAccessedTime()获取最后一次操作的时间 
						 * session.getMaxInactiveInterval()获取session的生存时间 
						 **/
						if (SystemUtils.getUserLastAccessedTime(sessionid.getLastAccessedTime())) 
						{
							it.remove();
							sessionid.invalidate();
						}
					}
				}
			}
			msgModel.setSuccess(true);
			msgModel.setMsg(String.valueOf(OnLineCounter.getOnlineCnt()));
		} 
		catch (Exception e) 
		{
			logger.error("LoginController onlinecnt error：", e);
		}
		return msgModel;
	}
	
	
	/**
	 * 描述信息：用户列表
	 * 创建时间：2015年1月31日 下午2:37:01
	 * @author WCL (ln_admin@yeah.net)
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/a/onlineuser.do", method=RequestMethod.POST)
	public @ResponseBody MsgModel onlineuser(HttpServletRequest request, HttpServletResponse response)
	{
		MsgModel msgModel = new MsgModel();
		try 
		{
			HttpSession session = request.getSession();
			/**取在线用户MAP**/
			HashMap<String, HttpSession> mRetMap = OnLineCounter.getOnline();
			if (mRetMap != null && mRetMap.size() > 0) 
			{
				String strUserName = session.getAttribute(SESSION_KEY_LOGINNAME).toString(); 
				List<OutModel> list = new ArrayList<OutModel>();
				Iterator<Entry<String, HttpSession>> it = mRetMap.entrySet().iterator();
				OutModel mOutModel = null;
				while (it.hasNext()) 
				{
					mOutModel = new OutModel();
					Entry<String, HttpSession> entry = it.next();
					
					//登录用户名
					mOutModel.setA(entry.getKey().toString());
					
					//用户登录时间
					mOutModel.setB(SystemUtils.funFormatterDataInfo(new Date(entry.getValue().getCreationTime())));
					
					//登录用户的IP
					mOutModel.setC(((ALoginLogsService)entry.getValue().getAttribute("OnLineUser")).getUserIp());
					
					//是否为当前用户
					mOutModel.setA(entry.getKey().toString());
					if (mOutModel.getA().trim().equals(strUserName.trim())) 
					{
						mOutModel.setA1(1);
					}
					list.add(mOutModel);
				}
				msgModel.setTotal(list.size());
				msgModel.setRows(list);
			}
			msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
		} 
		catch (Exception e) 
		{
			logger.error("LoginController onlineuser error：", e);
		}
		return msgModel;
	}
	
}

