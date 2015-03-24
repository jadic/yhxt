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
import com.gesoft.model.DiseaseHisModel;
import com.gesoft.model.GeneticDiseaseModel;
import com.gesoft.model.HabbitModel;
import com.gesoft.model.MessageModel;
import com.gesoft.model.MsgModel;
import com.gesoft.model.NurseRequestModel;
import com.gesoft.model.OutModel;
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
	public ModelAndView toHome(QueryModel query, HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView result = new ModelAndView("/patient/home");
		try
		{
			
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
	
}
