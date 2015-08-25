/**
 * 文件名称：PIndexController.java
 * 版权所有：Copyright njty
 * 创建时间：2015年2月26日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gesoft.model.QueryModel;
import com.gesoft.util.SystemUtils;

/**
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
@Controller
@RequestMapping("/p")
public class PIndexController extends BaseController
{
	
	
	@RequestMapping(value="/index.do")
	public String login(HttpServletRequest request)
	{
		if (SystemUtils.isMobile(request))
		{
			return "/patient/login_mobile";
		}
		return "/patient/login";
	}
	
	@RequestMapping(value="/mobile.do")
	public String loginmobile(HttpServletRequest request)
	{
		if (SystemUtils.isMobile(request))
		{
			return "/patient/login_mobile";
		}
		return "/patient/login";
	}
	
	// 我的
	@RequestMapping(value="/my.do")
	public String toMy(ModelMap model, HttpServletRequest request)
	{
		if (SystemUtils.isMobile(request))
		{
			return "/patient/mobile/my";
		}
		model.put("errorInfo", "只能在移动设备上显示");
		return "/patient/common/error";
	}
	
	// 查询
	@RequestMapping(value="/search.do")
	public String toSearch(ModelMap model, HttpServletRequest request)
	{
		if (SystemUtils.isMobile(request))
		{
			return "/patient/mobile/search";
		}
		model.put("errorInfo", "只能在移动设备上显示");
		return "/patient/common/error";
	}
	
	@RequestMapping(value="/img.do")
	public String img()
	{
		return "/patient/image";
	}
	

	@RequestMapping(value="/toReg.do")
	public String toReg()
	{
		return "/patient/register";
	}
	
	/**
	 * 描述信息：健康档案
	 * 创建时间：2015年3月3日 下午11:32:19
	 * @author WCL (ln_admin@yeah.net)
	 * @return
	 */
	@RequestMapping(value="/health.do")
	public String toHealth(QueryModel model, HttpServletRequest request, HttpServletResponse response)
	{
		request.setAttribute("query", model);
		return "/patient/healthinfo/manage_health_info";
	}
	
	
	/**
	 * 描述信息：健康病历
	 * 创建时间：2015年3月4日 下午6:23:22
	 * @author WCL (ln_admin@yeah.net)
	 * @return
	 */
	@RequestMapping(value="/jkbl.do")
	public String toJkbl()
	{
		return "/patient/healthinfo/manage_jkbl_info";
	}
	
	
	
	/**
	 * 描述信息：修改密码
	 * 创建时间：2015年3月4日 上午1:15:43
	 * @author WCL (ln_admin@yeah.net)
	 * @return
	 */
	@RequestMapping(value="/modifypwd.do")
	public String toModifyPwd()
	{
		return "/patient/healthinfo/manage_modifypwd_info";
	}
	
	
	/**
	 * 描述信息：我的服务与设备
	 * 创建时间：2015年3月4日 下午11:15:14
	 * @author WCL (ln_admin@yeah.net)
	 * @return
	 */
	@RequestMapping(value="/servicedevice.do")
	public String toServiceDevice(QueryModel model, HttpServletRequest request, HttpServletResponse response)
	{
		request.setAttribute("query", model);
		return "/patient/serviceinfo/manage_service_device_info";
	}
	
	
	
	/**
	 * 描述信息：健康分析
	 * 创建时间：2015年3月4日 下午11:22:57
	 * @author WCL (ln_admin@yeah.net)
	 * @return
	 */
	@RequestMapping(value="/healthanalysis.do")
	public String toHealthAnalysis()
	{
		return "/patient/healthanalysis/manage_health_analysis_info";
	}
	
	
	@RequestMapping(value="/chart1.do")
	public String toChart1(ModelMap model, HttpServletRequest request)
	{
		if (SystemUtils.isMobile(request))
		{
			return "/patient/mobile/chartinfo/chart1";
		}
		return "/patient/chartinfo/chart1";
	}
	
	@RequestMapping(value="/chart2.do")
	public String toChart2(ModelMap model, HttpServletRequest request)
	{
		if (SystemUtils.isMobile(request))
		{
			return "/patient/mobile/chartinfo/chart2";
		}
		return "/patient/chartinfo/chart2";
	}
	
	@RequestMapping(value="/chart3.do")
	public String toChart3(ModelMap model, HttpServletRequest request)
	{
		if (SystemUtils.isMobile(request))
		{
			return "/patient/mobile/chartinfo/chart3";
		}
		return "/patient/chartinfo/chart3";
	}

	@RequestMapping(value="/chart4.do")
	public String toChart4(ModelMap model, HttpServletRequest request)
	{
		if (SystemUtils.isMobile(request))
		{
			return "/patient/mobile/chartinfo/chart4";
		}
		return "/patient/chartinfo/chart4";
	}
}
