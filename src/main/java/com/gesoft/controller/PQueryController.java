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

import com.gesoft.model.MsgModel;
import com.gesoft.model.OutModel;
import com.gesoft.model.QueryModel;
import com.gesoft.model.ServiceModel;
import com.gesoft.service.PQueryService;

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
				List<OutModel> argArgs = pQueryService.queryDeviceInfo(query);
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
	public @ResponseBody MsgModel toModifyPwd(QueryModel query, HttpServletRequest request, HttpServletResponse response)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			
		}
		catch (Exception e)
		{
			logger.error("PQueryController toModifyPwd error：", e);
		}
		return msgModel;
	}
	
}
