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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gesoft.model.ActivityModel;
import com.gesoft.model.DoctorModel;
import com.gesoft.model.MsgModel;
import com.gesoft.model.NurseRequestModel;
import com.gesoft.model.QueryModel;
import com.gesoft.model.RelativePhoneModel;
import com.gesoft.model.ServiceModel;
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
			model.setNurseId(getSessionUserId(request, SESSION_KEY_NUID));
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
	 * 描述信息：进入用户基本信息
	 * 创建时间：2015年3月13日 上午5:52:58
	 * @author WCL (ln_admin@yeah.net)
	 * @return
	 */
	@RequestMapping(value="/baseuser.do")
	public ModelAndView toUserBase(QueryModel query, HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView result = new ModelAndView("/nurse/baseinfo/manage_userbase_info");
		try
		{
			query.setUserId(getSessionUserId(request, SESSION_KEY_NUID));
			result.addObject("query", query);
			//加载用户基本信息
			UserModel model  = nSearchService.queryUserBaseInfo(query);
			if (model != null)
			{
				result.addObject("userModel", model);
			}
		}
		catch (Exception e)
		{
			logger.error("NSearchController toUserBase error：", e);
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
			model.setUserId(getSessionUserId(request, SESSION_KEY_NUID));
			if (nSearchService.modifyUserBaseInfo(model) > 0)
			{
				msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
			}
		}
		catch (Exception e)
		{
			logger.error("NSearchController toModifyUserBase error：", e);
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
			model.setUserId(getSessionUserId(request, SESSION_KEY_NUID));
			if (nSearchService.modifyUserDetailInfo(model) > 0)
			{
				msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
			}
		}
		catch (Exception e)
		{
			logger.error("NSearchController toModifyUserDetail error：", e);
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
			model.setUserId(getSessionUserId(request, SESSION_KEY_NUID));
			if (nSearchService.modifyUserWorkInfo(model) > 0)
			{
				msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
			}
		}
		catch (Exception e)
		{
			logger.error("NSearchController toModifyUserWork error：", e);
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
		ModelAndView result = new ModelAndView("/nurse/activity/manage_activity_info");
		try
		{
			query.setNurseId(getSessionUserId(request, SESSION_KEY_NUID));
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
		ModelAndView result = new ModelAndView("/nurse/activity/add_activity_info");
		try
		{
			query.setNurseId(getSessionUserId(request, SESSION_KEY_NUID));
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
			model.setNurseId(getSessionUserId(request, SESSION_KEY_NUID));
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
			model.setNurseId(getSessionUserId(request, SESSION_KEY_NUID));
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
			model.setNurseId(getSessionUserId(request, SESSION_KEY_NUID));
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
	
	
	/**
	 * 描述信息：查询服务数据
	 * 创建时间：2015年3月12日 上午10:27:06
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/service.do")
	public ModelAndView toService(QueryModel query, HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView result = new ModelAndView("/nurse/service/manage_service_info");
		try
		{
			query.setNurseId(getSessionUserId(request, SESSION_KEY_NUID));
			result.addObject("query", query);
			
			//分页加载建议执行结果
			long recordCount = nSearchService.queryServiceInfoCnt(query);
			if(recordCount>0)
			{
				setPageModel(recordCount, query);
				List<ServiceModel> argArgs = nSearchService.queryServiceInfo(query);
				result.addObject("serviceFlys", argArgs);
			}
		}
		catch (Exception e)
		{
			logger.error("NSearchController toService error：", e);
		}
		return result;
	}
	
	/**
	 * 描述信息：进入服务操作界面
	 * 创建时间：2015年3月12日 上午9:24:13
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/mergeService.do")
	public ModelAndView toMergeService(QueryModel query, HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView result = new ModelAndView("/nurse/service/add_service_info");
		try
		{
			query.setNurseId(getSessionUserId(request, SESSION_KEY_NUID));
			result.addObject("query", query);
			if (query.getId() > 0)
			{
				ServiceModel model  = nSearchService.queryServiceInfoById(query);
				result.addObject("service", model);
			}
		}
		catch (Exception e)
		{
			logger.error("NSearchController toMergeService error：", e);
		}
		return result;
	}
	
	
	/**
	 * 描述信息：增加服务信息
	 * 创建时间：2015年3月12日 上午9:22:06
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/addService.do")
	public @ResponseBody MsgModel toAddService(ServiceModel model, HttpServletRequest request, HttpServletResponse response)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			model.setNurseId(getSessionUserId(request, SESSION_KEY_NUID));
			if(nSearchService.addServiceInfo(model) > 0)
			{
				msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
			}
		}
		catch (Exception e)
		{
			logger.error("NSearchController toAddService error：", e);
		}
		return msgModel;
	}
	
	
	/**
	 * 描述信息：修改服务内容
	 * 创建时间：2015年3月12日 上午9:22:46
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/modifyService.do")
	public @ResponseBody MsgModel toModifyService(ServiceModel model, HttpServletRequest request, HttpServletResponse response)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			model.setNurseId(getSessionUserId(request, SESSION_KEY_NUID));
			if(nSearchService.modifyServiceInfo(model) > 0)
			{
				msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
			}
		}
		catch (Exception e)
		{
			logger.error("NSearchController toModifyService error：", e);
		}
		return msgModel;
	}
	
	
	/**
	 * 描述信息：删除服务内容
	 * 创建时间：2015年3月12日 上午9:23:29
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/delService.do")
	public @ResponseBody MsgModel toDelService(ServiceModel model, HttpServletRequest request, HttpServletResponse response)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			model.setNurseId(getSessionUserId(request, SESSION_KEY_NUID));
			if(nSearchService.delServiceInfo(model) > 0)
			{
				msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
			}
		}
		catch (Exception e)
		{
			logger.error("NSearchController toDelService error：", e);
		}
		return msgModel;
	}
	
	
	/**
	 * 描述信息：分页查询签约请求
	 * 创建时间：2015年3月12日 上午10:42:06
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/nurseRequest.do")
	public ModelAndView toNurseRequest(QueryModel query, HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView result = new ModelAndView("/nurse/nurserequest/manage_nurse_request_info");
		try
		{
			query.setNurseId(getSessionUserId(request, SESSION_KEY_NUID));
			result.addObject("query", query);
			
			long recordCount = nSearchService.queryNurseRequestInfoCnt(query);
			if(recordCount>0)
			{
				setPageModel(recordCount, query);
				List<NurseRequestModel> argArgs = nSearchService.queryNurseRequestInfo(query);
				result.addObject("nurseRequestFlys", argArgs);
			}
		}
		catch (Exception e)
		{
			logger.error("NSearchController toNurseRequest error：", e);
		}
		return result;
	}
	
	
	/**
	 * 描述信息：进入处理界面
	 * 创建时间：2015年3月13日 上午10:45:43
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/goRequestDeal.do")
	public ModelAndView toDealNurseRequest(QueryModel query, HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView result = new ModelAndView("/nurse/nurserequest/deal_nurse_request_info");
		try
		{
			query.setUserId(getSessionUserId(request, SESSION_KEY_NUID));
			result.addObject("query", query);
			NurseRequestModel mRetRequest = nSearchService.queryNurseQuestInfo(query);
			if (mRetRequest != null)
			{
				result.addObject("nurseRequest", mRetRequest);
			}
		}
		catch (Exception e)
		{
			logger.error("NSearchController toDealNurseRequest error：", e);
		}
		return result;
	}
	
	
	/**
	 * 描述信息：进入医护人员详细信息界面
	 * 创建时间：2015年3月11日 上午5:09:22
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/userdetail.do")
	public ModelAndView toNurseDetail(QueryModel query, HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView result = new ModelAndView("/nurse/nurserequest/query_user_detail_info");
		try
		{
			query.setUserId(getSessionUserId(request, SESSION_KEY_NUID));
			result.addObject("query", query);
			UserModel mRetUser = nSearchService.queryNurseDetailInfo(query);
			if (mRetUser != null)
			{
				result.addObject("userModel", mRetUser);
			}
		}
		catch (Exception e)
		{
			logger.error("NSearchController toNurseDetail error：", e);
		}
		return result;
	}
	
	
	
	/**
	 * 描述信息：处理签约请求
	 * 创建时间：2015年3月12日 上午10:44:09
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/dealRequest.do")
	public @ResponseBody MsgModel toDealRequest(NurseRequestModel model, HttpServletRequest request, HttpServletResponse response)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			model.setNurseId(getSessionUserId(request, SESSION_KEY_NUID));
			if(nSearchService.dealNurseRequestInfo(model) > 0)
			{
				msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
			}
		}
		catch (Exception e)
		{
			logger.error("NSearchController toDealRequest error：", e);
		}
		return msgModel;
	}
	
	
	/**
	 * 描述信息：进行医生风采界面
	 * 创建时间：2015年3月12日 下午12:03:03
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/doctor.do")
	public ModelAndView toDoctor(QueryModel query, HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView result = new ModelAndView("/nurse/doctor/manage_doctor_info");
		try
		{
			query.setNurseId(getSessionUserId(request, SESSION_KEY_NUID));
			result.addObject("query", query);
			
			long recordCount = nSearchService.queryDoctorInfoCnt(query);
			if(recordCount>0)
			{
				setPageModel(recordCount, query);
				List<DoctorModel> argArgs = nSearchService.queryDoctorInfo(query);
				result.addObject("doctorFlys", argArgs);
			}
		}
		catch (Exception e)
		{
			logger.error("NSearchController toDoctor error：", e);
		}
		return result;
	}
	
	
	/**
	 * 描述信息：医生详情
	 * 创建时间：2015年3月12日 下午12:04:56
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/doctorDetail.do")
	public ModelAndView toDoctorDetail(QueryModel query, HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView result = new ModelAndView("/nurse/doctor/query_doctor_detail_info");
		try
		{
			query.setNurseId(getSessionUserId(request, SESSION_KEY_NUID));
			result.addObject("query", query);
			
			DoctorModel doctorModel = nSearchService.queryDoctorDetailInfo(query);
			if(doctorModel != null)
			{
				result.addObject("doctor", doctorModel);
			}
		}
		catch (Exception e)
		{
			logger.error("NSearchController toDoctorDetail error：", e);
		}
		return result;
	}
}
