/**
 * 文件名称：PQueryController.java
 * 版权所有：Copyright njty
 * 创建时间：2015年3月5日
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gesoft.model.DeviceModel;
import com.gesoft.model.HabbitModel;
import com.gesoft.model.MsgModel;
import com.gesoft.model.OutModel;
import com.gesoft.model.QueryModel;
import com.gesoft.model.RelativePhoneModel;
import com.gesoft.model.ServiceModel;
import com.gesoft.model.UserModel;
import com.gesoft.service.PQueryService;
import com.gesoft.util.SystemUtils;

/**
 * 患者数据查询
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
@Controller
@RequestMapping("/p/query")
public class PQueryController extends BaseController
{
	private static final Logger logger = LoggerFactory.getLogger(PQueryController.class);
	
	@Resource
	private PQueryService pQueryService;
	
	/**
	 * 描述信息：查询建议-健康分析
	 * 创建时间：2015年3月5日 上午5:18:15
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/advice.do", method=RequestMethod.GET)
	public ModelAndView toAdvice(QueryModel query, HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView result = new ModelAndView("/patient/healthanalysis/manage_doctor_advice_info");
		try
		{
			query.setUserId(getSessionUserId(request, SESSION_KEY_PUID));
			result.addObject("query", query);
			
			//加载第一条建议数据
			OutModel model = pQueryService.queryAdviceInfo(query);
			if (model != null)
			{
				result.addObject("advice", model);
				
				query.setId(model.getId());
				//分页加载建议执行结果
				long recordCount = pQueryService.queryAdvicePerformaceCnt(query);
				if(recordCount>0)
				{
					setPageModel(recordCount, query);
					List<OutModel> argArgs = pQueryService.queryAdvicePerformace(query);
					result.addObject("adviceFlys", argArgs);
				}
			}
		}
		catch (Exception e)
		{
			logger.error("PQueryController toAdvice error：", e);
		}
		return result;
	}
	
	
	/**
	 * 描述信息：我的服务
	 * 创建时间：2015年3月4日 下午11:15:53
	 * @author WCL (ln_admin@yeah.net)
	 * @return
	 */
	@RequestMapping(value="/service.do")
	public ModelAndView toService(QueryModel query, HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView result = new ModelAndView("/patient/serviceinfo/manage_service_info");
		try
		{
			query.setUserId(getSessionUserId(request, SESSION_KEY_PUID));
			result.addObject("query", query);
			
			//分页加载建议执行结果
			long recordCount = pQueryService.queryServiceInfoCnt(query);
			if(recordCount>0)
			{
				setPageModel(recordCount, query);
				List<ServiceModel> argArgs = pQueryService.queryServiceInfo(query);
				result.addObject("serviceFlys", argArgs);
			}
		}
		catch (Exception e)
		{
			logger.error("PQueryController toService error：", e);
		}
		return result;
	}
	
	
	/**
	 * 描述信息：购买服务
	 * 创建时间：2015年3月8日 上午10:16:20
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/buyService.do", method=RequestMethod.POST)
	public @ResponseBody MsgModel buyservice(ServiceModel model, HttpServletRequest request, HttpServletResponse response)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			model.setUserId(getSessionUserId(request, SESSION_KEY_PUID));
			model.setBuyTime(SystemUtils.getCurrentSystemTime());
			if (pQueryService.modifyBuyServiceInfo(model) > 0)
			{
				msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
			}
		}
		catch (Exception e)
		{
			logger.error("PQueryController toService error：", e);
		}
		return msgModel;
	}
	
	
	/**
	 * 描述信息：购买设备
	 * 创建时间：2015年3月8日 上午10:21:53
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/buyDevice.do", method=RequestMethod.POST)
	public @ResponseBody MsgModel buysdevice(DeviceModel model, HttpServletRequest request, HttpServletResponse response)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			model.setUserId(getSessionUserId(request, SESSION_KEY_PUID));
			model.setBuyTime(SystemUtils.getCurrentSystemTime());
			if (pQueryService.modifyBuyDeviceInfo(model) > 0)
			{
				msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
			}
		}
		catch (Exception e)
		{
			logger.error("PQueryController toService error：", e);
		}
		return msgModel;
	}
	
	/**
	 * 描述信息：我的设备
	 * 创建时间：2015年3月4日 下午11:16:22
	 * @author WCL (ln_admin@yeah.net)
	 * @return
	 */
	@RequestMapping(value="/device.do")
	public ModelAndView toDevice(QueryModel query, HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView result = new ModelAndView("/patient/serviceinfo/manage_device_info");
		try
		{
			query.setUserId(getSessionUserId(request, SESSION_KEY_PUID));
			result.addObject("query", query);
			
			//分页加载建议执行结果
			long recordCount = pQueryService.queryDeviceInfoCnt(query);
			if(recordCount>0)
			{
				setPageModel(recordCount, query);
				List<DeviceModel> argArgs = pQueryService.queryDeviceInfo(query);
				result.addObject("deviceFlys", argArgs);
			}
		}
		catch (Exception e)
		{
			logger.error("PQueryController toDevice error：", e);
		}
		return result;
	}
	
	
	/**
	 * 描述信息：修改密码
	 * 创建时间：2015年3月5日 上午9:44:44
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/updatePwd.do", method=RequestMethod.POST)
	public @ResponseBody MsgModel toModifyPwd(UserModel model, HttpServletRequest request, HttpServletResponse response)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			model.setUserId(getSessionUserId(request, SESSION_KEY_PUID));
			if (pQueryService.modifyUserPwdInfo(model) > 0)
			{
				msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
			}
			else 
			{
				msgModel.setMsg("原始密码修改不正确！");
			}
		}
		catch (Exception e)
		{
			logger.error("PQueryController toModifyPwd error：", e);
		}
		return msgModel;
	}
	
	
	/**
	 * 描述信息：亲情号码
	 * 创建时间：2015年3月8日 下午3:50:03
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/relative.do")
	public ModelAndView toRelativePhone(QueryModel query, HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView result = new ModelAndView("/patient/healthinfo/manage_relative_phone_info");
		try
		{
			query.setUserId(getSessionUserId(request, SESSION_KEY_PUID));
			result.addObject("query", query);
			
			//分页加载建议执行结果
			long recordCount = pQueryService.queryRelativePhoneInfoCnt(query);
			if(recordCount>0)
			{
				setPageModel(recordCount, query);
				List<RelativePhoneModel> argArgs = pQueryService.queryRelativePhoneInfo(query);
				result.addObject("relativeFlys", argArgs);
			}
		}
		catch (Exception e)
		{
			logger.error("PQueryController toRelativePhone error：", e);
		}
		return result;
	}
	
	
	/**
	 * 描述信息：跳进增加与修改亲情号码界面
	 * 创建时间：2015年3月8日 下午4:30:02
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/mergerelative.do")
	public ModelAndView toMergeRelative(QueryModel query, HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView result = new ModelAndView("/patient/healthinfo/add_relative_phone_info");
		try
		{
			query.setUserId(getSessionUserId(request, SESSION_KEY_PUID));
			result.addObject("query", query);
			//修改时加载数据
			if (query.getId() > 0)
			{
				RelativePhoneModel model  = pQueryService.queryRelativePhoneInfoById(query);
				result.addObject("relative", model);
			}
		}
		catch (Exception e)
		{
			logger.error("PQueryController toMergeRelative error：", e);
		}
		return result;
	}
	
	
	/**
	 * 描述信息：增加亲情号码
	 * 创建时间：2015年3月8日 下午4:20:58
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/addrelative.do")
	public @ResponseBody MsgModel toAddRelativePhone(RelativePhoneModel model, HttpServletRequest request, HttpServletResponse response)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			model.setUserId(getSessionUserId(request, SESSION_KEY_PUID));
			if(pQueryService.addRelativePhoneInfo(model) > 0)
			{
				msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
			}
		}
		catch (Exception e)
		{
			logger.error("PQueryController toAddRelativePhone error：", e);
		}
		return msgModel;
	}
	
	/**
	 * 描述信息：修改亲情号码
	 * 创建时间：2015年3月8日 下午4:22:07
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/modifyrelative.do")
	public @ResponseBody MsgModel toModifyRelativePhone(RelativePhoneModel model, HttpServletRequest request, HttpServletResponse response)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			model.setUserId(getSessionUserId(request, SESSION_KEY_PUID));
			if(pQueryService.modifyRelativePhoneInfo(model) > 0)
			{
				msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
			}
		}
		catch (Exception e)
		{
			logger.error("PQueryController toModifyRelativePhone error：", e);
		}
		return msgModel;
	}
	
	
	/**
	 * 描述信息：删除亲情号码
	 * 创建时间：2015年3月8日 下午4:07:11
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/delRelative.do", method=RequestMethod.POST)
	public @ResponseBody MsgModel toDelRelavtivePhone(RelativePhoneModel model, HttpServletRequest request, HttpServletResponse response)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			model.setUserId(getSessionUserId(request, SESSION_KEY_PUID));
			if (pQueryService.delRelativePhoneInfo(model) > 0)
			{
				msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
			}
		}
		catch (Exception e)
		{
			logger.error("PQueryController toDelRelavtivePhone error：", e);
		}
		return msgModel;
	}
	
	
	/**
	 * 描述信息：加载用户基本信息
	 * 创建时间：2015年3月8日 下午6:00:08
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/userbase.do")
	public ModelAndView toUserBase(QueryModel query, HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView result = new ModelAndView("/patient/healthinfo/manage_userbase_info");
		try
		{
			query.setUserId(getSessionUserId(request, SESSION_KEY_PUID));
			result.addObject("query", query);
			//加载用户基本信息
			UserModel model  = pQueryService.queryUserBaseInfo(query);
			if (model != null)
			{
				result.addObject("userModel", model);
			}
		}
		catch (Exception e)
		{
			logger.error("PQueryController toUserBase error：", e);
		}
		return result;
	}
	
	
	/**
	 * 描述信息：修改用户基本信息
	 * 创建时间：2015年3月8日 下午6:04:33
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/modifyUser.do", method=RequestMethod.POST)
	public @ResponseBody MsgModel toModifyUserBase(UserModel model, HttpServletRequest request, HttpServletResponse response)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			model.setUserId(getSessionUserId(request, SESSION_KEY_PUID));
			if (pQueryService.modifyUserBaseInfo(model) > 0)
			{
				msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
			}
		}
		catch (Exception e)
		{
			logger.error("PQueryController toModifyUserBase error：", e);
		}
		return msgModel;
	}
	
	
	/**
	 * 描述信息：修改用户详细信息
	 * 创建时间：2015年3月8日 下午10:23:59
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/modifyUserDetail.do", method=RequestMethod.POST)
	public @ResponseBody MsgModel toModifyUserDetail(UserModel model, HttpServletRequest request, HttpServletResponse response)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			model.setUserId(getSessionUserId(request, SESSION_KEY_PUID));
			if (pQueryService.modifyUserDetailInfo(model) > 0)
			{
				msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
			}
		}
		catch (Exception e)
		{
			logger.error("PQueryController toModifyUserDetail error：", e);
		}
		return msgModel;
	}
	
	
	/**
	 * 描述信息：修改用户工作信息
	 * 创建时间：2015年3月8日 下午10:29:09
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/modifyUserWork.do", method=RequestMethod.POST)
	public @ResponseBody MsgModel toModifyUserWork(UserModel model, HttpServletRequest request, HttpServletResponse response)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			model.setUserId(getSessionUserId(request, SESSION_KEY_PUID));
			if (pQueryService.modifyUserWorkInfo(model) > 0)
			{
				msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
			}
		}
		catch (Exception e)
		{
			logger.error("PQueryController toModifyUserWork error：", e);
		}
		return msgModel;
	}
	
	
	/**
	 * 描述信息：修改生活习惯
	 * 创建时间：2015年3月9日 上午12:16:31
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/modifyHabbit.do", method=RequestMethod.POST)
	public @ResponseBody MsgModel toModifyHabbit(HabbitModel model, HttpServletRequest request, HttpServletResponse response)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			model.setUserId(getSessionUserId(request, SESSION_KEY_PUID));
			if (pQueryService.modifyHabbitInfo(model) > 0)
			{
				msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
			}
		}
		catch (Exception e)
		{
			logger.error("PQueryController toModifyHabbit error：", e);
		}
		return msgModel;
	}
	
	
	/**
	 * 描述信息：加载生活习惯
	 * 创建时间：2015年3月8日 下午6:00:08
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @param request
	 * @param response
	 * @return
	 */

	/**
	 * 描述信息：生活习惯
	 * 创建时间：2015年3月4日 下午10:28:48
	 * @author WCL (ln_admin@yeah.net)
	 * @return
	 */
	@RequestMapping(value="/memberhabit.do")
	public ModelAndView toMemberHabit(QueryModel query, HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView result = new ModelAndView("/patient/healthinfo/manage_memberhabit_info");
		try
		{
			query.setUserId(getSessionUserId(request, SESSION_KEY_PUID));
			//加载用户基本信息
			HabbitModel model  = pQueryService.queryHabbitInfo(query);
			if (model != null)
			{
				result.addObject("habbit", model);
			}
		}
		catch (Exception e)
		{
			logger.error("PQueryController toUserBase error：", e);
		}
		return result;
	}
}
