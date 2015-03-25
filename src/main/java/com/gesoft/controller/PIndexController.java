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
import org.springframework.web.bind.annotation.RequestMapping;

import com.gesoft.model.QueryModel;

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
	public String login()
	{
		return "/patient/login";
	}
	
	@RequestMapping(value="/img.do")
	public String img()
	{
		return "/patient/image";
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
	
}
