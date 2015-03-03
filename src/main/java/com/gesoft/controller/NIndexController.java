/**
 * 文件名称：NIndexController.java
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
@RequestMapping("/n")
public class NIndexController extends BaseController
{
	@RequestMapping(value="/main.do")
	public String main()
	{
		return "/nurse/main";
	}
	
	
	
}