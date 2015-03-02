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
	 * 描述信息：获取USERID
	 * 创建时间：2015年2月3日 下午10:49:33
	 * @author WCL (ln_admin@yeah.net)
	 * @param request
	 * @return
	 */
	protected long getSessionUserId(HttpServletRequest request)
	{
		long mUserId = 0L;
		HttpSession session = request.getSession();
		try
		{
			if (session.getAttribute(SESSION_KEY_UID) != null)
			{
				mUserId = Long.parseLong(session.getAttribute(SESSION_KEY_UID).toString());
			}
		}
		catch (Exception e)
		{
		}
		return mUserId;
	}
	
}
