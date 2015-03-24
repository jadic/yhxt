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
import com.gesoft.model.DiseaseHisModel;
import com.gesoft.model.DoctorAdviceModel;
import com.gesoft.model.DoctorModel;
import com.gesoft.model.GeneticDiseaseModel;
import com.gesoft.model.HabbitModel;
import com.gesoft.model.MessageModel;
import com.gesoft.model.MsgModel;
import com.gesoft.model.NurseRequestModel;
import com.gesoft.model.QueryModel;
import com.gesoft.model.ServiceModel;
import com.gesoft.model.UserModel;
import com.gesoft.service.NSearchService;
import com.gesoft.service.PQueryService;
import com.gesoft.util.SystemUtils;

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
	
	@Resource
	private PQueryService pQueryService;
	
	
	
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
	public @ResponseBody MsgModel toUserList(QueryModel model, HttpServletRequest request, HttpServletResponse response)
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
			if (model.getOperType() == 0)
			{
				model.setUserId(getSessionUserId(request, SESSION_KEY_NUID));
			}
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
			if (model.getOperType() == 0)
			{
				model.setUserId(getSessionUserId(request, SESSION_KEY_NUID));
			}
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
			if (model.getOperType() == 0)
			{
				model.setUserId(getSessionUserId(request, SESSION_KEY_NUID));
			}
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
				result.addObject("activity", model);
			}
		}
		catch (Exception e)
		{
			logger.error("NSearchController toMergeActivity error：", e);
		}
		return result;
	}
	
	
	/**
	 * 描述信息：进入活动信息
	 * 创建时间：2015年3月13日 下午5:20:15
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/activitydetail.do")
	public ModelAndView toActivityDetail(QueryModel query, HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView result = new ModelAndView("/nurse/activity/query_activity_info");
		try
		{
			query.setNurseId(getSessionUserId(request, SESSION_KEY_NUID));
			result.addObject("query", query);
			if (query.getId() > 0)
			{
				ActivityModel model  = nSearchService.queryActivityInfoById(query);
				result.addObject("activity", model);
			}
		}
		catch (Exception e)
		{
			logger.error("NSearchController toActivityDetail error：", e);
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
			model.setType(1);
			model.setCreateTime(SystemUtils.getCurrentSystemTime());
			model.setCreatorId(getSessionUserId(request, SESSION_KEY_NUID));
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
			model.setType(1);
			model.setCreateTime(SystemUtils.getCurrentSystemTime());
			model.setCreatorId(getSessionUserId(request, SESSION_KEY_NUID));
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
	 * 描述信息：服务详细
	 * 创建时间：2015年3月13日 下午5:59:23
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/servicedetail.do")
	public ModelAndView toServiceDetail(QueryModel query, HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView result = new ModelAndView("/nurse/service/query_service_info");
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
			logger.error("NSearchController toServiceDetail error：", e);
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
			model.setType(1);
			model.setCreateTime(SystemUtils.getCurrentSystemTime());
			model.setCreatorId(getSessionUserId(request, SESSION_KEY_NUID));
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
			model.setType(1);
			model.setCreateTime(SystemUtils.getCurrentSystemTime());
			model.setCreatorId(getSessionUserId(request, SESSION_KEY_NUID));
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
	
	/**
	 * 描述信息：进入用户主界面
	 * 创建时间：2015年3月17日 上午4:16:53
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/usermain.do")
	public ModelAndView toUserMain(QueryModel query, HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView result = new ModelAndView("/nurse/userinfo/manage_main_info");
		try
		{
			result.addObject("query", query);
		}
		catch (Exception e)
		{
			logger.error("NSearchController toUserMain error：", e);
		}
		return result;
	}
	
	/**
	 * 描述信息：医嘱
	 * 创建时间：2015年3月17日 上午3:15:42
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/advice.do")
	public ModelAndView toAdvice(QueryModel query, HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView result = new ModelAndView("/nurse/userinfo/manage_advice_info");
		try
		{
			query.setNurseId(getSessionUserId(request, SESSION_KEY_NUID));
			result.addObject("query", query);
			
			long recordCount = nSearchService.queryDoctorAdviceInfoCnt(query);
			if(recordCount>0)
			{
				setPageModel(recordCount, query);
				List<DoctorAdviceModel> argArgs = nSearchService.queryDoctorAdviceInfo(query);
				result.addObject("adviceFlys", argArgs);
			}
			
		}
		catch (Exception e)
		{
			logger.error("NSearchController toAdvice error：", e);
		}
		return result;
	}
	
	
	/**
	 * 描述信息：进入医嘱管理界面
	 * 创建时间：2015年3月17日 上午3:25:49
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/mergeAdvice.do")
	public ModelAndView toMergeAdvice(QueryModel query, HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView result = new ModelAndView("/nurse/userinfo/add_advice_info");
		try
		{
			query.setNurseId(getSessionUserId(request, SESSION_KEY_NUID));
			result.addObject("query", query);
			if (query.getId() > 0)
			{
				DoctorAdviceModel model  = nSearchService.queryDoctorAdviceInfoById(query);
				result.addObject("advice", model);
			}
		}
		catch (Exception e)
		{
			logger.error("NSearchController toMergeAdvice error：", e);
		}
		return result;
	}
	

	/**
	 * 描述信息：显示医嘱详情
	 * 创建时间：2015年3月18日 上午5:52:06
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/showAdvice.do")
	public ModelAndView toShowAdvice(QueryModel query, HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView result = new ModelAndView("/nurse/userinfo/show_advice_info");
		try
		{
			query.setNurseId(getSessionUserId(request, SESSION_KEY_NUID));
			result.addObject("query", query);
			if (query.getId() > 0)
			{
				DoctorAdviceModel model  = nSearchService.queryDoctorAdviceInfoById(query);
				result.addObject("advice", model);
			}
		}
		catch (Exception e)
		{
			logger.error("NSearchController toShowAdvice error：", e);
		}
		return result;
	}
	
	
	/**
	 * 描述信息：增加医嘱
	 * 创建时间：2015年3月17日 上午3:29:01
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/addAdvice.do")
	public @ResponseBody MsgModel toAddAdvice(DoctorAdviceModel model, HttpServletRequest request, HttpServletResponse response)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			model.setNurseId(getSessionUserId(request, SESSION_KEY_NUID));
			if(nSearchService.addDoctorAdviceInfo(model) > 0)
			{
				msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
			}
		}
		catch (Exception e)
		{
			logger.error("NSearchController toAddAdvice error：", e);
		}
		return msgModel;
	}
	
	
	/**
	 * 描述信息：修改医嘱
	 * 创建时间：2015年3月17日 上午3:28:42
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/modifyAdvice.do")
	public @ResponseBody MsgModel toModifyAdvice(DoctorAdviceModel model, HttpServletRequest request, HttpServletResponse response)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			model.setNurseId(getSessionUserId(request, SESSION_KEY_NUID));
			if(nSearchService.modifyDoctorAdviceInfo(model) > 0)
			{
				msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
			}
		}
		catch (Exception e)
		{
			logger.error("NSearchController toModifyAdvice error：", e);
		}
		return msgModel;
	}
	
	
	/**
	 * 描述信息：删除医嘱
	 * 创建时间：2015年3月17日 上午3:28:09
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/delAdvice.do")
	public @ResponseBody MsgModel toDelAdvice(DoctorAdviceModel model, HttpServletRequest request, HttpServletResponse response)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			model.setNurseId(getSessionUserId(request, SESSION_KEY_NUID));
			if(nSearchService.delDoctorAdviceInfo(model) > 0)
			{
				msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
			}
		}
		catch (Exception e)
		{
			logger.error("NSearchController toDelAdvice error：", e);
		}
		return msgModel;
	}
	
	
	/**
	 * 描述信息：健康档案
	 * 创建时间：2015年3月18日 上午6:04:35
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/jkda.do")
	public ModelAndView toJkda(QueryModel query, HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView result = new ModelAndView("/nurse/userinfo/manage_jkda_info");
		try
		{
			query.setNurseId(getSessionUserId(request, SESSION_KEY_NUID));
			result.addObject("query", query);
		}
		catch (Exception e)
		{
			logger.error("NSearchController toJkda error：", e);
		}
		return result;
	}
	
	
	/**
	 * 描述信息：健康档案-用户基本信息
	 * 创建时间：2015年3月18日 上午6:05:42
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/jkdaUserBase.do")
	public ModelAndView toJkdaUserBase(QueryModel query, HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView result = new ModelAndView("/nurse/userinfo/manage_userbase_info");
		try
		{
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
			logger.error("NSearchController toJkdaUserBase error：", e);
		}
		return result;
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
	@RequestMapping(value="/memberhabit.do")
	public ModelAndView toMemberHabit(QueryModel query, HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView result = new ModelAndView("/nurse/userinfo/manage_memberhabit_info");
		try
		{
			result.addObject("query", query);
			//加载用户基本信息
			HabbitModel model  = pQueryService.queryHabbitInfo(query);
			if (model != null)
			{
				result.addObject("habbit", model);
			}
		}
		catch (Exception e)
		{
			logger.error("NSearchController toUserBase error：", e);
		}
		return result;
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
			if (pQueryService.modifyHabbitInfo(model) > 0)
			{
				msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
			}
		}
		catch (Exception e)
		{
			logger.error("NSearchController toModifyHabbit error：", e);
		}
		return msgModel;
	}
	
	
	/**
	 * 描述信息：加载家族遗传史
	 * 创建时间：2015年3月8日 下午6:00:08
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/familydisease.do")
	public ModelAndView toFamilyDisease(QueryModel query, HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView result = new ModelAndView("/nurse/userinfo/manage_familydisease_info");
		try
		{
			result.addObject("query", query);
			GeneticDiseaseModel model  = pQueryService.queryGeneticDiseaseInfo(query);
			if (model != null)
			{
				result.addObject("genetic", model);
			}
		}
		catch (Exception e)
		{
			logger.error("NSearchController toFamilyDisease error：", e);
		}
		return result;
	}
	
	
	/**
	 * 描述信息：修改家族遗传史
	 * 创建时间：2015年3月9日 上午12:16:31
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/modifyFamilyDisease.do", method=RequestMethod.POST)
	public @ResponseBody MsgModel toModifyFamilyDisease(GeneticDiseaseModel model, HttpServletRequest request, HttpServletResponse response)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			if (pQueryService.modifyGeneticDiseaseInfo(model) > 0)
			{
				msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
			}
		}
		catch (Exception e)
		{
			logger.error("NSearchController toModifyFamilyDisease error：", e);
		}
		return msgModel;
	}
	
	
	/**
	 * 描述信息：分页加载疾病史
	 * 创建时间：2015年3月10日 上午8:51:27
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/diseasehis.do")
	public ModelAndView toDiseaseHis(QueryModel query, HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView result = new ModelAndView("/nurse/userinfo/manage_diseasehis_info");
		try
		{
			result.addObject("query", query);
			
			//分页加载建议执行结果
			long recordCount = pQueryService.queryDiseaseHisInfoCnt(query);
			if(recordCount>0)
			{
				setPageModel(recordCount, query);
				List<DiseaseHisModel> argArgs = pQueryService.queryDiseaseHisInfo(query);
				result.addObject("diseaseHisFlys", argArgs);
			}
		}
		catch (Exception e)
		{
			logger.error("NSearchController toDiseaseHis error：", e);
		}
		return result;
	}
	
	
	
	/**
	 * 描述信息：跳转疾病史
	 * 创建时间：2015年3月10日 上午9:44:33
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/mergeDiseaseHis.do")
	public ModelAndView toMergeDiseaseHis(QueryModel query, HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView result = new ModelAndView("/nurse/userinfo/add_diseasehis_info");
		try
		{
			result.addObject("query", query);
			if (query.getId() > 0)
			{
				DiseaseHisModel model  = pQueryService.queryDiseaseHisInfoById(query);
				result.addObject("diseaseHis", model);
			}
		}
		catch (Exception e)
		{
			logger.error("NSearchController toMergeDiseaseHis error：", e);
		}
		return result;
	}
	
	/**
	 * 描述信息：增加疾病史
	 * 创建时间：2015年3月10日 上午8:49:31
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/addDiseaseHis.do", method=RequestMethod.POST)
	public @ResponseBody MsgModel toAddDiseaseHis(DiseaseHisModel model, HttpServletRequest request, HttpServletResponse response)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			if (pQueryService.addDiseaseHisInfo(model) > 0)
			{
				msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
			}
		}
		catch (Exception e)
		{
			logger.error("NSearchController toAddDiseaseHis error：", e);
		}
		return msgModel;
	}
	
	
	/**
	 * 描述信息：修改疾病史
	 * 创建时间：2015年3月10日 上午8:50:43
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/modifyDiseaseHis.do", method=RequestMethod.POST)
	public @ResponseBody MsgModel toModifyDiseaseHis(DiseaseHisModel model, HttpServletRequest request, HttpServletResponse response)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			if (pQueryService.modifyDiseaseHisInfo(model) > 0)
			{
				msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
			}
		}
		catch (Exception e)
		{
			logger.error("NSearchController toModifyDiseaseHis error：", e);
		}
		return msgModel;
	}
	
	
	/**
	 * 描述信息：删除疾病史数据
	 * 创建时间：2015年3月10日 上午9:43:09
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/delDiseaseHis.do", method=RequestMethod.POST)
	public @ResponseBody MsgModel toDelDiseaseHis(DiseaseHisModel model, HttpServletRequest request, HttpServletResponse response)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			if (pQueryService.delDiseaseHisInfo(model) > 0)
			{
				msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
			}
		}
		catch (Exception e)
		{
			logger.error("NSearchController toDelDiseaseHis error：", e);
		}
		return msgModel;
	}
	
	
	/**
	 * 描述信息：首页
	 * 创建时间：2015年3月19日 上午9:24:18
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/home.do")
	public ModelAndView toHome(QueryModel query, HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView result = new ModelAndView("/nurse/home");
		try
		{
			query.setNurseId(getSessionUserId(request, SESSION_KEY_NUID));
			result.addObject("query", query);
			long recordCount = nSearchService.queryMessageInfoCnt(query);
			if(recordCount>0)
			{
				setPageModel(recordCount, query);
				List<MessageModel> argArgs = nSearchService.queryMessageInfo(query);
				result.addObject("messageFlys", argArgs);
			}
		}
		catch (Exception e)
		{
			logger.error("NSearchController toHome error：", e);
		}
		return result;
	}
	
	
	/**
	 * 描述信息：进入请留言界面
	 * 创建时间：2015年3月19日 上午10:08:53
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/goMsg.do")
	public @ResponseBody MsgModel toGoMsg(QueryModel query, HttpServletRequest request, HttpServletResponse response)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			query.setStartTime(SystemUtils.getCurrentSystemTime());
			nSearchService.modifyMessageStatusInfo(query);
			msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
		}
		catch (Exception e)
		{
			logger.error("NSearchController toGoMsg error：", e);
		}
		return msgModel;
	}
	
	
	/**
	 * 描述信息：发送留言
	 * 创建时间：2015年3月19日 上午11:43:32
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/sendMsg.do", method=RequestMethod.POST)
	public @ResponseBody MsgModel toSendMessage(MessageModel model, HttpServletRequest request, HttpServletResponse response)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			model.setSendTime(SystemUtils.getCurrentSystemTime());
			model.setSenderId(getSessionUserId(request, SESSION_KEY_NUID));
			if (pQueryService.addSendMessageInfo(model) > 0)
			{
				msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
			}
		}
		catch (Exception e)
		{
			logger.error("PQueryController toSendMessage error：", e);
		}
		return msgModel;
	}
	
	
	/**
	 * 描述信息：进入留言界面
	 * 创建时间：2015年3月19日 下午2:34:52
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/usermsg.do")
	public @ResponseBody MsgModel toGoUserMsg(QueryModel query, HttpServletRequest request, HttpServletResponse response)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			query.setStartTime(SystemUtils.getCurrentSystemTime());
			query.setNurseId(getSessionUserId(request, SESSION_KEY_NUID));
			
			//加载此用户的未读留言
			List<MessageModel> argFlys = nSearchService.queryMessageUserInfo(query);
			if (argFlys != null && argFlys.size() > 0)
			{
				msgModel.setTotal(argFlys.size());
				msgModel.setRows(argFlys);
				
				// 修改留言
				nSearchService.modifyMessageStatusInfoByUserId(query);
			}
		}
		catch (Exception e)
		{
			logger.error("NSearchController toGoUserMsg error：", e);
		}
		return msgModel;
	}
	
	
	/**
	 * 描述信息：加载用户健康状态
	 * 创建时间：2015年3月20日 上午6:09:30
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/userJkzt.do")
	public ModelAndView toUserJkzt(QueryModel query, HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView result = new ModelAndView("/nurse/userinfo/manage_jkzt_info");
		try
		{
			result.addObject("query", query);
		}
		catch (Exception e)
		{
			logger.error("NSearchController toUserJkzt error：", e);
		}
		return result;
	}
	
	
	/**
	 * 描述信息：加载医生
	 * 创建时间：2015年3月24日 上午9:10:39
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/queryDoctor.do", method=RequestMethod.POST)
    public @ResponseBody List<DoctorModel> querySimpleDoctorInfo(QueryModel model)
    {
        List<DoctorModel> list = null;
        try
        {
            list = nSearchService.queryDoctors(model);
        }
        catch (Exception e)
        {
            logger.error("NSearchController querySimpleDoctorInfo error：", e);
        }
        return list;
    }
	
	
	/**
	 * 描述信息：加载服务与医生关联数据
	 * 创建时间：2015年3月24日 上午9:22:44
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/serviceDoctor.do", method=RequestMethod.POST)
    public @ResponseBody long[] serviceDoctor(QueryModel model)
    {
        long[] ids = null;
        try
        {
            List<DoctorModel> list = nSearchService.queryServiceDoctorIds(model);
            if (list != null) {
                ids = new long[list.size()];
                for (int i = 0; i < list.size(); i ++) {
                    ids[i] = list.get(i).getDoctorId(); 
                }
            }
        }
        catch (Exception e)
        {
            logger.error("NSearchController serviceDoctor error：", e);
        }
        return ids;
    }
	
	
	/**
	 * 描述信息：加载活动与医生对照关系
	 * 创建时间：2015年3月24日 上午9:29:19
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/activityDoctor.do", method=RequestMethod.POST)
    public @ResponseBody long[] activityDoctor(QueryModel model)
    {
        long[] ids = null;
        try
        {
            List<DoctorModel> list = nSearchService.queryActivityDoctorIds(model);
            if (list != null) {
                ids = new long[list.size()];
                for (int i = 0; i < list.size(); i ++) {
                    ids[i] = list.get(i).getDoctorId(); 
                }
            }
        }
        catch (Exception e)
        {
            logger.error("NSearchController activityDoctor error：", e);
        }
        return ids;
    }
}
