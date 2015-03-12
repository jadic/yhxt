/**
 * 文件名称：NQueryController.java
 * 版权所有：Copyright njty
 * 创建时间：2015年3月12日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.controller;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gesoft.service.NSearchService;

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
}
