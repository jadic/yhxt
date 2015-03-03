/**
 * 文件名称：ADevTypeController.java
 * 版权所有：Copyright njty
 * 创建时间：2015年3月3日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.controller;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gesoft.model.MsgModel;
import com.gesoft.model.DevTypeModel;
import com.gesoft.service.ADevTypeService;

/**
 * 设备类型管理
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
@Controller
@RequestMapping("/a/devtype")
public class ADevTypeController extends BaseController
{


	private static final Logger logger = LoggerFactory.getLogger(ADevTypeController.class);
	
	@Resource
	private ADevTypeService aDevTypeService;
	

	/**
	 * 描述信息：分页查询
	 * 创建时间：2015年1月29日 下午2:34:54
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/query.do", method=RequestMethod.POST)
	public @ResponseBody MsgModel search(DevTypeModel model)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			aDevTypeService.findPageList(model, msgModel);
		}
		catch (Exception e)
		{
			logger.error("ADevTypeController search error：", e);
		}
		return msgModel;
	}
	
	
	/**
	 * 描述信息：增加
	 * 创建时间：2015年1月29日 下午2:28:20
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/add.do", method=RequestMethod.POST)
	public @ResponseBody MsgModel add(DevTypeModel model)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			if (aDevTypeService.save(model) > 0)
			{
				msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
			}
		}
		catch (Exception e)
		{
			logger.error("ADevTypeController add error：", e);
		}
		return msgModel;
	}

	
	/**
	 * 描述信息：修改
	 * 创建时间：2015年1月29日 下午5:54:59
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/modify.do", method=RequestMethod.POST)
	public @ResponseBody MsgModel modify(DevTypeModel model)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			if (aDevTypeService.update(model) > 0)
			{
				msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
			}
		}
		catch (Exception e)
		{
			logger.error("ADevTypeController modify error：", e);
		}
		return msgModel;
	}
	
	
	/**
	 * 描述信息：删除
	 * 创建时间：2015年1月29日 下午5:54:47
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/del.do", method=RequestMethod.POST)
	public @ResponseBody MsgModel delete(DevTypeModel model)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			if (aDevTypeService.delete(model) > 0)
			{
				msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
			}
		}
		catch (Exception e)
		{
			logger.error("ADevTypeController delete error：", e);
		}
		return msgModel;
	}


}
