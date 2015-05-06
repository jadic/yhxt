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
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gesoft.model.ActivityModel;
import com.gesoft.model.BloodModel;
import com.gesoft.model.CommentModel;
import com.gesoft.model.DeviceModel;
import com.gesoft.model.DiseaseHisModel;
import com.gesoft.model.DoctorModel;
import com.gesoft.model.FeedBackModel;
import com.gesoft.model.GeneticDiseaseModel;
import com.gesoft.model.HabbitModel;
import com.gesoft.model.HealthReportModel;
import com.gesoft.model.MessageModel;
import com.gesoft.model.MsgModel;
import com.gesoft.model.NurseRequestModel;
import com.gesoft.model.OutModel;
import com.gesoft.model.PostModel;
import com.gesoft.model.QueryModel;
import com.gesoft.model.RelativePhoneModel;
import com.gesoft.model.ScoreModel;
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
	 * 描述信息：用户登录
	 * 创建时间：2015年3月25日 下午5:56:55
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/login.do")
	public ModelAndView login(UserModel user, ModelMap model, HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView result = new ModelAndView("/patient/login");
		HttpSession session = request.getSession();
		try
		{
			if(user != null)
			{
				if (session.getAttribute("rand") != null)
				{
					if (user.getRand().equals(session.getAttribute("rand")))
					{
						UserModel mLoginModel = pQueryService.login(user);
						if (user.state == GLOBAL_SERVICE_SUCCESS)
						{
							result = new ModelAndView("/patient/main");
							model.addAttribute("loginUser", mLoginModel);
							session = request.getSession(true);
							session.setAttribute(SESSION_KEY_PISLOGIN, GLOBAL_YES);
							session.setAttribute(SESSION_KEY_PLOGINNAME, mLoginModel.getUserName());
							session.setAttribute(SESSION_KEY_PUID, mLoginModel.getUserId());
							session.setAttribute(SESSION_KEY_PFULLNAME, mLoginModel.getName());
							
							QueryModel query = new QueryModel();
							query.setUserId(getSessionUserId(request, SESSION_KEY_PUID));
							result.addObject("query", query);
							
							UserModel mUserModel= pQueryService.queryUserBaseInfo(query);
							result.addObject("userModel", mUserModel);
							
							
							//加载亲人
							query.setStartNum(0);
							query.setRows(1000);
							List<RelativePhoneModel> relativeFlys = pQueryService.queryRelativePhoneInfo(query);
							if (relativeFlys != null && relativeFlys.size() > 0)
							{
								result.addObject("relativeFlys", relativeFlys);
							}
							
							
							//加载我的设备
							query.setType(-1);
							List<DeviceModel> deviceFlys = pQueryService.queryDeviceInfo(query);
							if (deviceFlys != null && deviceFlys.size() > 0)
							{
								result.addObject("deviceFlys", deviceFlys);
							}
							
							//加载我的医护人员
							//加载我的医护人员
							UserModel mRetNurse = pQueryService.queryMyNurseInfo(query);
							if (mRetNurse != null)
							{
								result.addObject("nurseModel", mRetNurse);
							}
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
			result.addObject("userName", user.getUserName());
		}
		catch (Exception e)
		{
			logger.error("NSearchController toLogin error：", e);
		}
		return result;
	}
	
	
	/**
	 * 描述信息：注销
	 * 创建时间：2015年4月2日 下午3:22:03
	 * @author WCL (ln_admin@yeah.net)
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/logout.do")
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
		return "/patient/login";
	}
	
	
	@RequestMapping(value="/main.do")
	public ModelAndView main(QueryModel query, HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView result = new ModelAndView("/patient/main");
		try
		{
			query.setUserId(getSessionUserId(request, SESSION_KEY_PUID));
			result.addObject("query", query);
			
			UserModel mUserModel= pQueryService.queryUserBaseInfo(query);
			result.addObject("userModel", mUserModel);
			
			
			//加载亲人
			query.setStartNum(0);
			query.setRows(1000);
			List<RelativePhoneModel> relativeFlys = pQueryService.queryRelativePhoneInfo(query);
			if (relativeFlys != null && relativeFlys.size() > 0)
			{
				result.addObject("relativeFlys", relativeFlys);
			}
			
			
			//加载我的设备
			query.setType(-1);
			List<DeviceModel> deviceFlys = pQueryService.queryDeviceInfo(query);
			if (deviceFlys != null && deviceFlys.size() > 0)
			{
				result.addObject("deviceFlys", deviceFlys);
			}
			
			//加载我的医护人员
			//加载我的医护人员
			UserModel mRetNurse = pQueryService.queryMyNurseInfo(query);
			if (mRetNurse != null)
			{
				result.addObject("nurseModel", mRetNurse);
			}
		}
		catch (Exception e)
		{
			logger.error("PQueryController main error：", e);
		}
		return result;
	}
	
	/**
	 * 描述信息：查询建议-健康分析
	 * 创建时间：2015年3月5日 上午5:18:15
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/advice.do")
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
	 * 描述信息：我的活动
	 * 创建时间：2015年3月4日 下午11:15:53
	 * @author WCL (ln_admin@yeah.net)
	 * @return
	 */
	@RequestMapping(value="/activity.do")
	public ModelAndView toActivity(QueryModel query, HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView result = new ModelAndView("/patient/serviceinfo/manage_activity_info");
		try
		{
			query.setUserId(getSessionUserId(request, SESSION_KEY_PUID));
			result.addObject("query", query);
			
			//分页加载建议执行结果
			long recordCount = pQueryService.queryActivityInfoCnt(query);
			if(recordCount>0)
			{
				setPageModel(recordCount, query);
				List<ActivityModel> argArgs = pQueryService.queryActivityInfo(query);
				result.addObject("activityFlys", argArgs);
			}
		}
		catch (Exception e)
		{
			logger.error("PQueryController toActivity error：", e);
		}
		return result;
	}
	
	
	@RequestMapping(value="/activitydetail.do")
	public ModelAndView toActivityDetail(QueryModel query, HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView result = new ModelAndView("/patient/serviceinfo/query_activity_info");
		try
		{
			query.setNurseId(getSessionUserId(request, SESSION_KEY_NUID));
			result.addObject("query", query);
			if (query.getId() > 0)
			{
				ActivityModel model  = pQueryService.queryActivityInfoById(query);
				List<DoctorModel> doctorFlys = pQueryService.queryActivityDoctorInfo(query);
				if (doctorFlys != null && doctorFlys.size() > 0)
				{
					result.addObject("doctorFlys", doctorFlys);
				}
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
	 * 描述信息：修改照片
	 * 创建时间：2015年3月24日 下午6:42:37
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/modifyUserPhoto.do", method=RequestMethod.POST)
	public @ResponseBody MsgModel toModifyUserPhoto(UserModel model, HttpServletRequest request, HttpServletResponse response)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			model.setUserId(getSessionUserId(request, SESSION_KEY_PUID));
			if (pQueryService.modifyUserPhotoInfo(model) > 0)
			{
				msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
			}
		}
		catch (Exception e)
		{
			logger.error("PQueryController toModifyUserPhoto error：", e);
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
		ModelAndView result = new ModelAndView("/patient/healthinfo/manage_familydisease_info");
		try
		{
			query.setUserId(getSessionUserId(request, SESSION_KEY_PUID));
			GeneticDiseaseModel model  = pQueryService.queryGeneticDiseaseInfo(query);
			if (model != null)
			{
				result.addObject("genetic", model);
			}
		}
		catch (Exception e)
		{
			logger.error("PQueryController toFamilyDisease error：", e);
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
			model.setUserId(getSessionUserId(request, SESSION_KEY_PUID));
			if (pQueryService.modifyGeneticDiseaseInfo(model) > 0)
			{
				msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
			}
		}
		catch (Exception e)
		{
			logger.error("PQueryController toModifyFamilyDisease error：", e);
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
		ModelAndView result = new ModelAndView("/patient/healthinfo/manage_diseasehis_info");
		try
		{
			query.setUserId(getSessionUserId(request, SESSION_KEY_PUID));
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
			logger.error("PQueryController toDiseaseHis error：", e);
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
		ModelAndView result = new ModelAndView("/patient/healthinfo/add_diseasehis_info");
		try
		{
			query.setUserId(getSessionUserId(request, SESSION_KEY_PUID));
			result.addObject("query", query);
			if (query.getId() > 0)
			{
				DiseaseHisModel model  = pQueryService.queryDiseaseHisInfoById(query);
				result.addObject("diseaseHis", model);
			}
		}
		catch (Exception e)
		{
			logger.error("PQueryController toMergeDiseaseHis error：", e);
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
			model.setUserId(getSessionUserId(request, SESSION_KEY_PUID));
			if (pQueryService.addDiseaseHisInfo(model) > 0)
			{
				msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
			}
		}
		catch (Exception e)
		{
			logger.error("PQueryController toAddDiseaseHis error：", e);
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
			model.setUserId(getSessionUserId(request, SESSION_KEY_PUID));
			if (pQueryService.modifyDiseaseHisInfo(model) > 0)
			{
				msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
			}
		}
		catch (Exception e)
		{
			logger.error("PQueryController toModifyDiseaseHis error：", e);
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
			model.setUserId(getSessionUserId(request, SESSION_KEY_PUID));
			if (pQueryService.delDiseaseHisInfo(model) > 0)
			{
				msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
			}
		}
		catch (Exception e)
		{
			logger.error("PQueryController toDelDiseaseHis error：", e);
		}
		return msgModel;
	}
	
	
	/**
	 * 描述信息：主页
	 * 创建时间：2015年3月11日 上午4:41:26
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/home.do")
	public ModelAndView toHome(QueryModel model, HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView result = new ModelAndView("/patient/home");
		try
		{
			model.setUserId(getSessionUserId(request, SESSION_KEY_PUID));
			OutModel mOutModel = pQueryService.queryRecentlyHomeInfo(model);
			
			result.addObject("homeBase", mOutModel);
			
			
		}
		catch (Exception e)
		{
			logger.error("PQueryController toHome error：", e);
		}
		return result;
	}
	
	/**
	 * 描述信息：我的医护人员
	 * 创建时间：2015年3月11日 上午3:09:38
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/mynuser.do")
	public ModelAndView toMyNurse(QueryModel query, HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView result = new ModelAndView("/patient/nurseinfo/manage_nurse_info");
		try
		{
			query.setUserId(getSessionUserId(request, SESSION_KEY_PUID));
			result.addObject("query", query);
			
			//加载我的医护人员
			UserModel mRetUser = pQueryService.queryMyNurseInfo(query);
			
			//查询是否有申请信息
			if (mRetUser == null)
			{
				NurseRequestModel mRetNurseRequest = pQueryService.queryNurseRequestInfo(query);
				//如果没有医护人员，则直接加载医护人员列表
				if (mRetNurseRequest == null)
				{
					//分页加载建议执行结果
					long recordCount = pQueryService.queryNurseInfoCnt(query);
					if(recordCount>0)
					{
						setPageModel(recordCount, query);
						List<UserModel> argArgs = pQueryService.queryNurseInfo(query);
						result.addObject("nurseFlys", argArgs);
					}
					query.setType(2);
				}
				else 
				{
					result.addObject("nurseRequest", mRetUser);
					query.setType(1);
				}
			}
			else 
			{
				result.addObject("nurse", mRetUser);
				
				// 判断是否当月已点评过
				query.setNurseId(mRetUser.getUserId());
				long nRet = pQueryService.queryCurrentMonthMessageInfoCnt(query);
				result.addObject("dpCnt", nRet);
			}
		}
		catch (Exception e)
		{
			logger.error("PQueryController toMyNurse error：", e);
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
	@RequestMapping(value="/nursedetail.do")
	public ModelAndView toNurseDetail(QueryModel query, HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView result = new ModelAndView("/patient/nurseinfo/query_nurse_detail_info");
		try
		{
			query.setUserId(getSessionUserId(request, SESSION_KEY_PUID));
			result.addObject("query", query);
			UserModel mRetUser = pQueryService.queryNurseDetailInfo(query);
			if (mRetUser != null)
			{
				result.addObject("userModel", mRetUser);
			}
		}
		catch (Exception e)
		{
			logger.error("PQueryController toNurseDetail error：", e);
		}
		return result;
	}
	
	/**
	 * 描述信息：进入医护人员申请界面
	 * 创建时间：2015年3月11日 上午5:09:22
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/goNurseRequest.do")
	public ModelAndView toGoNurseRequest(QueryModel query, HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView result = new ModelAndView("/patient/nurseinfo/manage_nurse_request_info");
		try
		{
			query.setUserId(getSessionUserId(request, SESSION_KEY_PUID));
			result.addObject("query", query);
		}
		catch (Exception e)
		{
			logger.error("PQueryController toGoNurseRequest error：", e);
		}
		return result;
	}
	
	
	/**
	 * 描述信息：签约申请
	 * 创建时间：2015年3月11日 上午4:42:03
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/nurserequest.do", method=RequestMethod.POST)
	public @ResponseBody MsgModel toNurseRequest(NurseRequestModel model, HttpServletRequest request, HttpServletResponse response)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			model.setUserId(getSessionUserId(request, SESSION_KEY_PUID));
			model.setRequestTime(SystemUtils.getCurrentSystemTime());
			if (pQueryService.addNurseRequestInfo(model) > 0)
			{
				msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
			}
		}
		catch (Exception e)
		{
			logger.error("PQueryController toNurseRequest error：", e);
		}
		return msgModel;
	}
	
	
	/**
	 * 描述信息：加载消息
	 * 创建时间：2015年3月11日 上午9:23:47
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/loadMsg.do", method=RequestMethod.POST)
	public @ResponseBody MsgModel toLoadMsg(QueryModel model, HttpServletRequest request, HttpServletResponse response)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			model.setUserId(getSessionUserId(request, SESSION_KEY_PUID));
			List<MessageModel> argArgs = pQueryService.queryMessageInfo(model);
			if (argArgs != null && argArgs.size() > 0)
			{
				msgModel.setTotal(argArgs.size());
				msgModel.setRows(argArgs);
			}
		}
		catch (Exception e)
		{
			logger.error("PQueryController toLoadMsg error：", e);
		}
		return msgModel;
	}
	
	
	/**
	 * 描述信息：发送消息
	 * 创建时间：2015年3月11日 上午9:16:05
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
			model.setSenderId(getSessionUserId(request, SESSION_KEY_PUID));
			model.setUserId(getSessionUserId(request, SESSION_KEY_PUID));
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
	 * 描述信息：增加月评分
	 * 创建时间：2015年3月11日 下午5:11:19
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/addScore.do", method=RequestMethod.POST)
	public @ResponseBody MsgModel toAddScore(ScoreModel model, HttpServletRequest request, HttpServletResponse response)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			model.setUserId(getSessionUserId(request, SESSION_KEY_PUID));
			model.setStime(SystemUtils.getCurrentSystemTime());
			if (pQueryService.addScoreInfo(model) > 0)
			{
				msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
			}
		}
		catch (Exception e)
		{
			logger.error("PQueryController toAddScore error：", e);
		}
		return msgModel;
	}
	
	
	/**
	 * 描述信息：增加反馈信息
	 * 创建时间：2015年4月7日 下午5:36:03
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/addFeedBack.do", method=RequestMethod.POST)
	public @ResponseBody MsgModel toAddFeedBack(FeedBackModel model, HttpServletRequest request, HttpServletResponse response)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			model.setUserId(getSessionUserId(request, SESSION_KEY_PUID));
			model.setStime(SystemUtils.getCurrentSystemTime());
			if (pQueryService.addFeedBackInfo(model) > 0)
			{
				msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
			}
		}
		catch (Exception e)
		{
			logger.error("PQueryController toAddFeedBack error：", e);
		}
		return msgModel;
	}
	
	
	/**
	 * 描述信息：论坛管理
	 * 创建时间：2015年4月9日 上午5:57:55
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/post.do")
	public ModelAndView toPost(QueryModel query, HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView result = new ModelAndView("/patient/postinfo/manage_post_info");
		try
		{
			query.setUserId(getSessionUserId(request, SESSION_KEY_PUID));
			result.addObject("query", query);
			
			long recordCount = pQueryService.queryPostInfoCnt(query);
			if(recordCount>0)
			{
				setPageModel(recordCount, query);
				List<PostModel> argArgs = pQueryService.queryPostInfo(query);
				result.addObject("postFlys", argArgs);
			}
		}
		catch (Exception e)
		{
			logger.error("PQueryController toPost error：", e);
		}
		return result;
	}
	
	/**
	 * 描述信息：进行增加论坛界面
	 * 创建时间：2015年4月9日 上午6:03:33
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/mergePost.do")
	public ModelAndView toMergePost(QueryModel query, HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView result = new ModelAndView("/patient/postinfo/add_post_info");
		try
		{
			query.setUserId(getSessionUserId(request, SESSION_KEY_PUID));
			result.addObject("query", query);
		}
		catch (Exception e)
		{
			logger.error("PQueryController toMergePost error：", e);
		}
		return result;
	}
	
	
	/**
	 * 描述信息：增加论坛
	 * 创建时间：2015年4月9日 上午6:04:36
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/addPost.do", method=RequestMethod.POST)
	public @ResponseBody MsgModel toAddPost(PostModel model, HttpServletRequest request, HttpServletResponse response)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			model.setUserId(getSessionUserId(request, SESSION_KEY_PUID));
			model.setUserName(getSessionUserName(request, SESSION_KEY_PLOGINNAME));
			model.setStime(SystemUtils.getCurrentSystemTime());
			if (pQueryService.addPostInfo(model) > 0)
			{
				msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
			}
		}
		catch (Exception e)
		{
			logger.error("PQueryController toAddPost error：", e);
		}
		return msgModel;
	}
	
	
	/**
	 * 描述信息：论坛详细
	 * 创建时间：2015年4月9日 上午8:29:12
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/postDetail.do")
	public ModelAndView toPostDetail(QueryModel query, HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView result = new ModelAndView("/patient/postinfo/query_post_detail_info");
		try
		{
			query.setUserId(getSessionUserId(request, SESSION_KEY_PUID));
			result.addObject("query", query);
			
			//加载论坛内容
			PostModel mPostModel = pQueryService.queryPostInfoById(query);
			result.addObject("post", mPostModel);
			
			//加载评论
			long recordCount = pQueryService.queryPostCommentInfoCnt(query);
			if(recordCount>0)
			{
				setPageModel(recordCount, query);
				List<CommentModel> argFlys = pQueryService.queryPostCommentInfo(query);
				result.addObject("commentFlys", argFlys);
			}
		}
		catch (Exception e)
		{
			logger.error("PQueryController toPostDetail error：", e);
		}
		return result;
	}
	
	
	/**
	 * 描述信息：提交评论
	 * 创建时间：2015年4月9日 上午8:33:03
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/addComment.do")
	public ModelAndView toAddComment(CommentModel model, HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView result = new ModelAndView("/patient/postinfo/query_post_detail_info");	
		try
		{
			model.setUserId(getSessionUserId(request, SESSION_KEY_PUID));
			model.setUserName(getSessionUserName(request, SESSION_KEY_PLOGINNAME));
			model.setStime(SystemUtils.getCurrentSystemTime());
			if (pQueryService.addPostCommentInfo(model) > 0)
			{
				
			}
			
			QueryModel query = new QueryModel();
			query.setId(model.getPid());
			result.addObject("query", query);
			
			//加载论坛内容
			PostModel mPostModel = pQueryService.queryPostInfoById(query);
			result.addObject("post", mPostModel);
			
			//加载评论
			long recordCount = pQueryService.queryPostCommentInfoCnt(query);
			if(recordCount>0)
			{
				setPageModel(recordCount, query);
				List<CommentModel> argFlys = pQueryService.queryPostCommentInfo(query);
				result.addObject("commentFlys", argFlys);
			}
		}
		catch (Exception e)
		{
			logger.error("PQueryController toAddComment error：", e);
		}
		return result;
	}
	
	
	/**
	 * 描述信息：加载血糖统计
	 * 创建时间：2015年4月21日 上午1:21:55
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/statBlood.do", method=RequestMethod.POST)
	public @ResponseBody MsgModel toStatBlood(QueryModel model, HttpServletRequest request, HttpServletResponse response)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			model.setUserId(getSessionUserId(request, SESSION_KEY_PUID));
			List<BloodModel> argFlys = pQueryService.queryStatBloodInfo(model);
			if (argFlys != null && argFlys.size() > 0)
			{
				msgModel.setTotal(argFlys.size());
				msgModel.setRows(argFlys);
			}
		}
		catch (Exception e)
		{
			logger.error("PQueryController toStatBlood error：", e);
		}
		return msgModel;
	}
	
	
	/**
	 * 描述信息：统计血压
	 * 创建时间：2015年5月1日 下午3:01:43
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/statPressure.do", method=RequestMethod.POST)
	public @ResponseBody MsgModel toStatPressure(QueryModel model, HttpServletRequest request, HttpServletResponse response)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			model.setUserId(getSessionUserId(request, SESSION_KEY_PUID));
			List<OutModel> argFlys = pQueryService.queryStatBloodPressureInfo(model);
			if (argFlys != null && argFlys.size() > 0)
			{
				msgModel.setTotal(argFlys.size());
				msgModel.setRows(argFlys);
			}
		}
		catch (Exception e)
		{
			logger.error("PQueryController toStatPressure error：", e);
		}
		return msgModel;
	}
	
	
	/**
	 * 描述信息：加载耳温
	 * 创建时间：2015年4月21日 上午1:21:55
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/statEar.do", method=RequestMethod.POST)
	public @ResponseBody MsgModel toStatEar(QueryModel model, HttpServletRequest request, HttpServletResponse response)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			model.setUserId(getSessionUserId(request, SESSION_KEY_PUID));
			List<BloodModel> argFlys = pQueryService.queryStatEarInfo(model);
			if (argFlys != null && argFlys.size() > 0)
			{
				msgModel.setTotal(argFlys.size());
				msgModel.setRows(argFlys);
			}
		}
		catch (Exception e)
		{
			logger.error("PQueryController toStatEar error：", e);
		}
		return msgModel;
	}
	
	
	/**
	 * 描述信息：首页中加载最新的一条建议
	 * 创建时间：2015年5月2日 上午10:38:34
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/homeAdvice.do", method=RequestMethod.POST)
	public @ResponseBody OutModel toHomeAdvice(QueryModel model, HttpServletRequest request, HttpServletResponse response)
	{
		OutModel mOutModel = new OutModel();
		try
		{
			model.setUserId(getSessionUserId(request, SESSION_KEY_PUID));
			mOutModel = pQueryService.queryHomeDoctorAdviceInfo(model);
		}
		catch (Exception e)
		{
			logger.error("PQueryController toHomeAdvice error：", e);
		}
		return mOutModel;
	}
	
	/**
	 * 描述信息：
	 * 创建时间：2015年5月2日 下午2:02:48
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/homeAdvice15.do", method=RequestMethod.POST)
	public @ResponseBody MsgModel toHomeAdvice15(QueryModel model, HttpServletRequest request, HttpServletResponse response)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			model.setUserId(getSessionUserId(request, SESSION_KEY_PUID));
			List<OutModel> argArgs = pQueryService.queryHomeDoctorAdvice15Info(model);
			if (argArgs != null && argArgs.size() > 0)
			{
				msgModel.setTotal(argArgs.size());
				msgModel.setRows(argArgs);
			}
		}
		catch (Exception e)
		{
			logger.error("PQueryController toHomeAdvice15 error：", e);
		}
		return msgModel;
	}
	
	
	/**
	 * 描述信息：报告分析路转
	 * 创建时间：2015年5月6日 上午9:57:19
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/goHealthBg.do")
	public ModelAndView toGoHealthBg(QueryModel model, HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView result = new ModelAndView("/patient/healthanalysis/manage_health_bg_info");	
		try
		{
			model.setUserId(getSessionUserId(request, SESSION_KEY_PUID));
			if (model.getStatType() == 1)
			{
				result = new ModelAndView("/patient/healthanalysis/manage_health_bg_info");
			}
			else if(model.getStatType() == 2)
			{
				result = new ModelAndView("/patient/healthanalysis/manage_health_week_bg_info");
			}
			else if(model.getStatType() == 3)
			{
				result = new ModelAndView("/patient/healthanalysis/manage_health_month_bg_info");
			}
			result.addObject("query", model);
		}
		catch (Exception e)
		{
			logger.error("PQueryController toGoHealthBg error：", e);
		}
		return result;
	}
	
	
	/**
	 * 描述信息：健康报告
	 * 创建时间：2015年5月4日 下午3:32:37
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/healthBg.do")
	public ModelAndView toHealthBg(QueryModel model, HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView result = new ModelAndView("/patient/healthanalysis/manage_health_bg_info");	
		try
		{
			model.setUserId(getSessionUserId(request, SESSION_KEY_PUID));
			if (model.getStatType() == 1)
			{
				result = new ModelAndView("/patient/healthanalysis/manage_health_bg_info");
				toHealthRepeatDay(model, result);
			}
			else if(model.getStatType() == 2)
			{
				result = new ModelAndView("/patient/healthanalysis/manage_health_week_bg_info");
				toHealthRepeatMonth(model, result);
			}
			else if(model.getStatType() == 3)
			{
				result = new ModelAndView("/patient/healthanalysis/manage_health_month_bg_info");
				toHealthRepeatMonth(model, result);
			}
		}
		catch (Exception e)
		{
			logger.error("PQueryController toHealthBg error：", e);
		}
		return result;
	}
	

	/**
	 * 描述信息：日健康报告
	 * 创建时间：2015年5月5日 下午3:46:43
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @param result
	 */
	private void toHealthRepeatDay(QueryModel model, ModelAndView result)
	{
		if (model.getStartTime() == null || model.getStartTime().trim().length() == 0)
		{
			model.setStartTime(SystemUtils.getCurrentSystemTime("yyyy-MM-dd"));
		}
		result.addObject("query", model);
		
		
		// 加载用户信息
		UserModel mUserModel = pQueryService.queryHealthUserInfo(model);
		if (mUserModel != null)
		{
			result.addObject("healthUser", mUserModel);
		}
		
		
		// 加载运动
		List<OutModel> sportFlys = pQueryService.queryHealthSportInfo(model);
		if (sportFlys != null && sportFlys.size() > 0)
		{
			result.addObject("sportFlys", sportFlys);
		}
		

		// 加载饮食
		List<OutModel> foodFlys = pQueryService.queryHealthFoodInfo(model);
		if (foodFlys != null && foodFlys.size() > 0)
		{
			result.addObject("foodFlys", foodFlys);
		}

		// 加载饮食
		OutModel foodModel = pQueryService.queryHealthFoodSumInfo(model);
		if (foodModel != null)
		{
			result.addObject("foodModel", foodModel);
		}
		

		// 加载心理状态
		List<OutModel> mentalFlys = pQueryService.queryHealthMentalInfo(model);
		if (mentalFlys != null && mentalFlys.size() > 0)
		{
			result.addObject("mentalFlys", mentalFlys);
		}


		// 加载血压
		List<OutModel> pressureFlys = pQueryService.queryHealthPressureInfo(model);
		if (pressureFlys != null && pressureFlys.size() > 0)
		{
			result.addObject("pressureFlys", pressureFlys);
		}
		

		// 加载心率
		List<OutModel> pulseFlys = pQueryService.queryHealthPulseInfo(model);
		if (pulseFlys != null && pulseFlys.size() > 0)
		{
			result.addObject("pulseFlys", pulseFlys);
		}
		
		
		// 加载血糖
		List<OutModel> glucoseFlys = pQueryService.queryHealthGlucoseInfo(model);
		if (glucoseFlys != null && glucoseFlys.size() > 0)
		{
			result.addObject("glucoseFlys", glucoseFlys);
		}


		// 加载体温
		List<OutModel> thermometerFlys = pQueryService.queryHealthThermometerInfo(model);
		if (thermometerFlys != null && thermometerFlys.size() > 0)
		{
			result.addObject("thermometerFlys", thermometerFlys);
		}
	}
	
	
	/**
	 * 描述信息：月健康报告
	 * 创建时间：2015年5月5日 下午3:48:32
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @param result
	 */
	private void toHealthRepeatMonth(QueryModel model, ModelAndView result)
	{
		if (model.getStartTime() == null || model.getStartTime().trim().length() == 0)
		{
			model.setStartTime(SystemUtils.getCurrentSystemTime("yyyy-MM"));
		}
		result.addObject("query", model);
		
		
		// 加载用户信息
		UserModel mUserModel = pQueryService.queryHealthUserInfo(model);
		if (mUserModel != null)
		{
			result.addObject("healthUser", mUserModel);
		}
		
		
		// 加载运动
		List<OutModel> sportFlys = pQueryService.queryHealthSportMonthInfo(model);
		if (sportFlys != null && sportFlys.size() > 0)
		{
			result.addObject("sportFlys", sportFlys);
		}
		
		OutModel sportObj = pQueryService.queryHealthSportMonthFxInfo(model);
		if (sportObj != null)
		{
			result.addObject("sportObj", sportObj);
		}
		
		// 加载饮食
		List<OutModel> foodFlys = pQueryService.queryHealthFoodMonthInfo(model);
		if (foodFlys != null && foodFlys.size() > 0)
		{
			result.addObject("foodFlys", foodFlys);
		}
	
		
		
		// 加载心理状态
		OutModel mentalObj = pQueryService.queryHealthMentalMonthInfo(model);
		if (mentalObj != null)
		{
			result.addObject("mentalObj", mentalObj);
		}
		
		
		// 加载血压
		List<OutModel> pressureFlys = pQueryService.queryHealthPressureMonthInfo(model);
		if (pressureFlys != null && pressureFlys.size() > 0)
		{
			result.addObject("pressureFlys", pressureFlys);
		}
		
		
		// 加载心率
		List<OutModel> pulseFlys = pQueryService.queryHealthPulseMonthInfo(model);
		if (pulseFlys != null && pulseFlys.size() > 0)
		{
			result.addObject("pulseFlys", pulseFlys);
		}
		
		
		// 加载血糖
		List<OutModel> glucoseFlys = pQueryService.queryHealthGlucoseMonthInfo(model);
		if (glucoseFlys != null && glucoseFlys.size() > 0)
		{
			result.addObject("glucoseFlys", glucoseFlys);
		}
		
		
		// 加载体温
		List<OutModel> thermometerFlys = pQueryService.queryHealthThermometerMonthInfo(model);
		if (thermometerFlys != null && thermometerFlys.size() > 0)
		{
			result.addObject("thermometerFlys", thermometerFlys);
		}
	}
	
	/**
	 * 描述信息：加载健康报告
	 * 创建时间：2015年5月5日 下午1:34:41
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/healthReport.do", method=RequestMethod.POST)
	public @ResponseBody HealthReportModel toHealthReport(HealthReportModel model, HttpServletRequest request, HttpServletResponse response)
	{
		HealthReportModel mHealthReportModel = null;
		try
		{
			model.setUserId(getSessionUserId(request, SESSION_KEY_PUID));
			mHealthReportModel = pQueryService.queryHealthReportInfo(model);
		}
		catch (Exception e)
		{
			logger.error("PQueryController toHealthReport error：", e);
		}
		return mHealthReportModel;
	}
}
