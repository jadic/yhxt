/**
 * 文件名称：BaseController.java
 * 版权所有：Copyright gesoft
 * 创建时间：2015年1月22日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.controller;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.CustomNumberEditor;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.gesoft.model.BaseModel;
import com.gesoft.model.QueryModel;
import com.gesoft.util.Constants;

/**
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
public class BaseController implements Constants
{

	 protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder)
	 {
		 binder.registerCustomEditor(Short.class, new CustomNumberEditor(Short.class, true));
		 binder.registerCustomEditor(Integer.class, new CustomNumberEditor(Integer.class, true));
		 binder.registerCustomEditor(Long.class, new CustomNumberEditor(Long.class, true));
		 binder.registerCustomEditor(Float.class, new CustomNumberEditor(Float.class, true));
		 binder.registerCustomEditor(Double.class, new CustomNumberEditor(Double.class, true));
		 binder.registerCustomEditor(BigDecimal.class, new CustomNumberEditor(BigDecimal.class, true));
		 binder.registerCustomEditor(BigInteger.class, new CustomNumberEditor(BigInteger.class, true));
		 binder.registerCustomEditor(java.util.Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
	 }
		 
	
	
	/**
	 * 描述信息：
	 * 创建时间：2015年1月29日 上午11:56:47
	 * @author WCL (ln_admin@yeah.net)
	 * @param target
	 * @param source
	 */
	public static void copyProperties(Object target, Object source)
    {
        BeanUtils.copyProperties(target, source);
    }
	
	
	/**
	 * 描述信息：设置分页
	 * 创建时间：2015年1月29日 下午2:47:23
	 * @author WCL (ln_admin@yeah.net)
	 * @param recordCount
	 * @param handerModel
	 */
	protected void setPageModel(long recordCount, QueryModel handerModel) 
	{
		if (handerModel.getPage() <= 0) 
		{
			handerModel.setPage(1);
		}
		
		if (handerModel.getRows() <= 0)
		{
			handerModel.setRows(10);
		}
		
		//计算开始、结束记录数
		handerModel.setStartNum((handerModel.getPage() -1) * handerModel.getRows());
		handerModel.setPageCnt((recordCount - 1) / handerModel.getRows() + 1);
		handerModel.setTotal(recordCount);
	}
	
	/**
	 * 描述信息：判断是否要进行分页查询
	 * 创建时间：2014-01-16 11:38:20
	 * @author WCL （ln_admin@yeah.net）
	 * @return 如果返回flase则不用查总记录数，如果返回true则要查总记录数
	 */
	protected boolean isSearchPageTotal(BaseModel handerModel)
	{
		if (handerModel.getPage() >1 && handerModel.getTotal() > 0)
		{
			return false;
		}
		return true;
	}
	
	
	/**
	 * 描述信息：设置Session中UserId
	 * 创建时间：2015年2月3日 下午10:49:44
	 * @author WCL (ln_admin@yeah.net)
	 * @param handerModel
	 * @param request
	 */
	protected void setSessionUserId(BaseModel handerModel, HttpServletRequest request)
	{
		handerModel.setUserId(getSessionUserId(request));
	}
	
	
	/**
	 * 描述信息：设备Session中UserId
	 * 创建时间：2015年3月3日 下午2:32:24
	 * @author WCL (ln_admin@yeah.net)
	 * @param handerModel
	 */
	protected void setSessionUserId(BaseModel handerModel)
	{
		handerModel.setUserId(getSessionUserId());
	}
	
	
	/**
	 * 描述信息：获取request
	 * 创建时间：2015年2月6日 上午8:41:30
	 * @author WCL (ln_admin@yeah.net)
	 * @return
	 */
	protected HttpServletRequest getRequest()
	{
		HttpServletRequest request = null;
		try
		{
			RequestAttributes requestAttributes = RequestContextHolder.getRequestAttributes();
			request = ((ServletRequestAttributes)requestAttributes).getRequest();
		}
		catch (Exception e)
		{
		}
		return request;
	}
	
	
	/**
	 * 描述信息：获取session
	 * 创建时间：2015年2月6日 上午8:41:41
	 * @author WCL (ln_admin@yeah.net)
	 * @return
	 */
	protected HttpSession getSession()
	{
		
		HttpSession session = null;
		try
		{
			HttpServletRequest request = getRequest();
			if (request != null)
			{
				session = request.getSession();
			}
		}
		catch (Exception e)
		{
			
		}
		return session;
	}
	
	/**
	 * 描述信息：获取UserId
	 * 创建时间：2015年2月6日 上午8:39:32
	 * @author WCL (ln_admin@yeah.net)
	 * @return
	 */
	protected long getSessionUserId()
	{
		return getSessionUserId(SESSION_KEY_UID);
	}
	
	/**
	 * 描述信息：获取UserId
	 * 创建时间：2015年2月6日 上午8:39:32
	 * @author WCL (ln_admin@yeah.net)
	 * @return
	 */
	protected long getSessionUserId(String sessionKey)
	{
		long mUserId = 0L;
		try
		{
			HttpSession session = getSession();
			if (session != null && session.getAttribute(sessionKey) != null)
			{
				mUserId = Long.parseLong(session.getAttribute(sessionKey).toString());
			}
		}
		catch (Exception e)
		{
		}
		return mUserId;
	}
	
	
	/**
	 * 描述信息：获取USERID
	 * 创建时间：2015年2月3日 下午10:49:33
	 * @author WCL (ln_admin@yeah.net)
	 * @param request
	 * @return
	 */
	protected long getSessionUserId(HttpServletRequest request)
	{
		return getSessionUserId(request, SESSION_KEY_UID);
	}
	

	/**
	 * 描述信息：获取用户ID
	 * 创建时间：2015年3月5日 上午9:10:18
	 * @author WCL (ln_admin@yeah.net)
	 * @param request
	 * @param sessionKey
	 * @return
	 */
	protected long getSessionUserId(HttpServletRequest request, String sessionKey)
	{
		long mUserId = 1L;
		if (sessionKey.equals(SESSION_KEY_NUID))
		{
			mUserId = 2L;
		}
		HttpSession session = request.getSession();
		try
		{
			if (session.getAttribute(sessionKey) != null)
			{
				mUserId = Long.parseLong(session.getAttribute(sessionKey).toString());
			}
		}
		catch (Exception e)
		{
		}
		return mUserId;
	}
	
	/**
	 * 描述信息：取用户名
	 * 创建时间：2015年4月9日 上午6:05:58
	 * @author WCL (ln_admin@yeah.net)
	 * @param request
	 * @param sessionKey
	 * @return
	 */
	protected String getSessionUserName(HttpServletRequest request, String sessionKey)
	{
		String strRet = "";
		HttpSession session = request.getSession();
		try
		{
			if (session.getAttribute(sessionKey) != null)
			{
				strRet = session.getAttribute(sessionKey).toString();
			}
		}
		catch (Exception e)
		{
		}
		return strRet;
	}
}
