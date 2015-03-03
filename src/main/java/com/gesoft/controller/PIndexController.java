/**
 * 文件名称：PIndexController.java
 * 版权所有：Copyright njty
 * 创建时间：2015年2月26日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
@Controller
@RequestMapping("/p")
public class PIndexController extends BaseController
{
	@RequestMapping(value="/main.do")
	public String main()
	{
		return "/patient/main";
	}
	
	
	/**
	 * 描述信息：健康档案
	 * 创建时间：2015年3月3日 下午11:32:19
	 * @author WCL (ln_admin@yeah.net)
	 * @return
	 */
	@RequestMapping(value="/health.do")
	public String toHealth()
	{
		return "/patient/healthinfo/manage_health_info";
	}
	
	/**
	 * 描述信息：基本信息
	 * 创建时间：2015年3月4日 上午12:09:58
	 * @author WCL (ln_admin@yeah.net)
	 * @return
	 */
	@RequestMapping(value="/userbase.do")
	public String toUserBase()
	{
		return "/patient/healthinfo/manage_userbase_info";
	}
	
	/**
	 * 描述信息：新情号码
	 * 创建时间：2015年3月4日 上午1:14:56
	 * @author WCL (ln_admin@yeah.net)
	 * @return
	 */
	@RequestMapping(value="/relative.do")
	public String toRelativePhone()
	{
		return "/patient/healthinfo/manage_relative_phone_info";
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
}
