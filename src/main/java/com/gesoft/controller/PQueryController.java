/**
 * 文件名称：PQueryController.java
 * 版权所有：Copyright njty
 * 创建时间：2015年3月5日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gesoft.model.QueryModel;

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
	public ModelAndView toAdvice(QueryModel model, HttpServletRequest request, HttpServletResponse response)
	{

		ModelAndView result = new ModelAndView("/patient/healthanalysis/manage_doctor_advice_info");
		try
		{
			
			result.addObject("query", model);
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
	public ModelAndView toService(QueryModel model, HttpServletRequest request, HttpServletResponse response)
	{

		ModelAndView result = new ModelAndView("/patient/serviceinfo/manage_service_info");
		try
		{
			
			result.addObject("query", model);
		}
		catch (Exception e)
		{
			logger.error("PQueryController toAdvice error：", e);
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
	public ModelAndView toDevice(QueryModel model, HttpServletRequest request, HttpServletResponse response)
	{

		ModelAndView result = new ModelAndView("/patient/serviceinfo/manage_device_info");
		try
		{
			
			result.addObject("query", model);
		}
		catch (Exception e)
		{
			logger.error("PQueryController toAdvice error：", e);
		}
		return result;
	}
	
}
