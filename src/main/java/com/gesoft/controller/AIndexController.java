/**
 * 文件名称：AIndexController.java
 * 版权所有：Copyright gesoft
 * 创建时间：2015年1月29日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
@Controller
@RequestMapping("/a")
public class AIndexController extends BaseController
{
	
	
	/**
	 * 描述信息：主界面
	 * 创建时间：2015年1月31日 下午2:48:44
	 * @author WCL (ln_admin@yeah.net)
	 * @return
	 */
	@RequestMapping(value="/main.do")
	public String main()
	{
		return "/admin/common/client_main";
	}
	

	/**
	 * 描述信息：跳转
	 * 创建时间：2015年1月31日 下午1:54:19
	 * @author WCL (ln_admin@yeah.net)
	 * @return
	 */
	@RequestMapping(value="/redirect.do")
	public String toRedirect()
	{
		return "/admin/common/redirect_page_info";
	}
	
	/**
	 * 描述信息：验证码
	 * 创建时间：2015年1月31日 下午2:48:17
	 * @author WCL (ln_admin@yeah.net)
	 * @return
	 */
	@RequestMapping(value="/img.do")
	public String toImg()
	{
		return "/admin/login/image";
	}
	
	/**
	 * 描述信息：登录界面
	 * 创建时间：2015年1月31日 下午2:48:29
	 * @author WCL (ln_admin@yeah.net)
	 * @return
	 */
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String toLogin()
	{
		return "/admin/login/login";
	}
	
	/**
	 * 描述信息：角色管理
	 * 创建时间：2015年1月29日 下午6:12:39
	 * @author WCL (ln_admin@yeah.net)
	 * @return
	 */
	@RequestMapping(value="/user.do")
	public String toUser()
	{
		return "/admin/baseinfo/manage_user_info";
	}
	
	/**
	 * 描述信息：当前在线登录用户数
	 * 创建时间：2015年1月31日 下午1:54:00
	 * @author WCL (ln_admin@yeah.net)
	 * @return
	 */
	@RequestMapping(value="/online.do")
	public String toOnline()
	{
		return "/admin/baseinfo/query_online_user_info";
	}
	
	
	/**
	 * 描述信息：修改日志
	 * 创建时间：2015年1月31日 下午2:47:02
	 * @author WCL (ln_admin@yeah.net)
	 * @return
	 */
	@RequestMapping(value="/updatelog.do")
	public String toUpDateLog()
	{
		return "/admin/baseinfo/query_update_log";
	}
	
	/**
	 * 描述信息：设备类型管理
	 * 创建时间：2015年3月3日 上午9:29:49
	 * @author WCL (ln_admin@yeah.net)
	 * @return
	 */
	@RequestMapping(value="/devtype.do")
	public String toDevType()
	{
		return "/admin/dictinfo/manage_devtype_info";
	}
	
	/**
	 * 描述信息：设备管理
	 * 创建时间：2015年3月3日 上午11:08:30
	 * @author WCL (ln_admin@yeah.net)
	 * @return
	 */
	@RequestMapping(value="/device.do")
	public String toDevice()
	{
		return "/admin/baseinfo/manage_device_info";
	}
	
	/**
	 * 描述信息：服务管理
	 * 创建时间：2015年3月3日 下午12:48:03
	 * @author WCL (ln_admin@yeah.net)
	 * @return
	 */
	@RequestMapping(value="/service.do")
	public String toService()
	{
		return "/admin/baseinfo/manage_service_info";
	}
	
	/**
	 * 描述信息：活动管理
	 * 创建时间：2015年3月3日 下午12:48:03
	 * @author WCL (ln_admin@yeah.net)
	 * @return
	 */
	@RequestMapping(value="/activity.do")
	public String toActivity()
	{
	    System.out.println("activity.do");
	    return "/admin/baseinfo/manage_activity_info";
	}
	
	/**
	 * 描述信息：医院信息管理
	 * 创建时间：2015年3月3日 下午12:48:03
	 * @author WCL (ln_admin@yeah.net)
	 * @return
	 */
	@RequestMapping(value="/hospital.do")
	public String toHospital()
	{
	    System.out.println("hospital.do");
	    return "/admin/dictinfo/manage_hospital_info";
	}
	
	/**
	 * 描述信息：医院科室管理
	 * 创建时间：2015年3月3日 下午12:48:03
	 * @author WCL (ln_admin@yeah.net)
	 * @return
	 */
	@RequestMapping(value="/hospitalDept.do")
	public String toDeptOfHospital()
	{
	    System.out.println("hospitalDept.do");
	    return "/admin/dictinfo/manage_hospital_dept_info";
	}
}
