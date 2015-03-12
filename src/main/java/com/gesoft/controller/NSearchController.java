/**
 * 文件名称：NQueryController.java
 * 版权所有：Copyright njty
 * 创建时间：2015年3月12日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gesoft.model.ActivityModel;
import com.gesoft.model.MsgModel;
import com.gesoft.model.QueryModel;
import com.gesoft.model.RelativePhoneModel;
import com.gesoft.model.UserModel;
import com.gesoft.service.NSearchService;

/**
 * 医护人员平台
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
@Controller
@RequestMapping("/n/search")
public class NSearchController extends BaseController
{
	private static final Logger logger = LoggerFactory.getLogger(NSearchController.class);
	
	@Resource
	private NSearchService nSearchService;
	
	
	
	/**
	 * 描述信息：首页加载用户列表数据，以及消息数，与最近时间
	 * 创建时间：2015年3月12日 上午9:14:15
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/userlist.do")
	public @ResponseBody MsgModel toUserList(RelativePhoneModel model, HttpServletRequest request, HttpServletResponse response)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			model.setUserId(getSessionUserId(request, SESSION_KEY_NUID));
			List<UserModel> argArgs = nSearchService.queryUserListInfo(model);
			if(argArgs.size() > 0)
			{
				msgModel.setTotal(argArgs.size());
				msgModel.setRows(argArgs);
			}
		}
		catch (Exception e)
		{
			logger.error("NSearchController toUserList error：", e);
		}
		return msgModel;
	}
	
	
	/**
	 * 描述信息：活动管理
	 * 创建时间：2015年3月12日 上午9:26:00
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/activity.do")
	public ModelAndView toActivity(QueryModel query, HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView result = new ModelAndView("/patient/healthinfo/manage_relative_phone_info");
		try
		{
			query.setUserId(getSessionUserId(request, SESSION_KEY_NUID));
			result.addObject("query", query);
			
			//分页加载建议执行结果
			long recordCount = nSearchService.queryActivityInfoCnt(query);
			if(recordCount>0)
			{
				setPageModel(recordCount, query);
				List<ActivityModel> argArgs = nSearchService.queryActivityInfo(query);
				result.addObject("activityFlys", argArgs);
			}
		}
		catch (Exception e)
		{
			logger.error("NSearchController toActivity error：", e);
		}
		return result;
	}
	
	/**
	 * 描述信息：进入活动操作界面
	 * 创建时间：2015年3月12日 上午9:24:13
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/mergeActivity.do")
	public ModelAndView toMergeActivity(QueryModel query, HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView result = new ModelAndView("/patient/healthinfo/add_relative_phone_info");
		try
		{
			query.setUserId(getSessionUserId(request, SESSION_KEY_NUID));
			result.addObject("query", query);
			if (query.getId() > 0)
			{
				ActivityModel model  = nSearchService.queryActivityInfoById(query);
				result.addObject("relative", model);
			}
		}
		catch (Exception e)
		{
			logger.error("NSearchController toMergeActivity error：", e);
		}
		return result;
	}
	
	
	/**
	 * 描述信息：增加活动信息
	 * 创建时间：2015年3月12日 上午9:22:06
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/addActivity.do")
	public @ResponseBody MsgModel toAddActivity(ActivityModel model, HttpServletRequest request, HttpServletResponse response)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			model.setUserId(getSessionUserId(request, SESSION_KEY_NUID));
			if(nSearchService.addActivityInfo(model) > 0)
			{
				msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
			}
		}
		catch (Exception e)
		{
			logger.error("NSearchController toAddActivity error：", e);
		}
		return msgModel;
	}
	
	
	/**
	 * 描述信息：修改活动内容
	 * 创建时间：2015年3月12日 上午9:22:46
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/modifyActivity.do")
	public @ResponseBody MsgModel toModifyActivity(ActivityModel model, HttpServletRequest request, HttpServletResponse response)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			model.setUserId(getSessionUserId(request, SESSION_KEY_NUID));
			if(nSearchService.modifyActivityInfo(model) > 0)
			{
				msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
			}
		}
		catch (Exception e)
		{
			logger.error("NSearchController toModifyActivity error：", e);
		}
		return msgModel;
	}
	
	
	/**
	 * 描述信息：删除活动内容
	 * 创建时间：2015年3月12日 上午9:23:29
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/delActivity.do")
	public @ResponseBody MsgModel toDelActivity(ActivityModel model, HttpServletRequest request, HttpServletResponse response)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			model.setUserId(getSessionUserId(request, SESSION_KEY_NUID));
			if(nSearchService.delActivityInfo(model) > 0)
			{
				msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
			}
		}
		catch (Exception e)
		{
			logger.error("NSearchController toDelActivity error：", e);
		}
		return msgModel;
	}
	
	
}
