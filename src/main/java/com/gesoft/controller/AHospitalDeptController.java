package com.gesoft.controller;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gesoft.model.HospitalDeptModel;
import com.gesoft.model.MsgModel;
import com.gesoft.service.AHospitalDeptService;

/**
 * 医院部门管理
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
@Controller
@RequestMapping("/a/hospitalDept")
public class AHospitalDeptController extends BaseController
{


	private static final Logger logger = LoggerFactory.getLogger(AHospitalDeptController.class);
	
	@Resource
	private AHospitalDeptService aHospitalDeptService;
	

	/**
	 * 描述信息：分页查询
	 * 创建时间：2015年1月29日 下午2:34:54
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/query.do", method=RequestMethod.POST)
	public @ResponseBody MsgModel search(HospitalDeptModel model)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			aHospitalDeptService.findPageList(model, msgModel);
		}
		catch (Exception e)
		{
			logger.error("AHospitalDeptController search error：", e);
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
	public @ResponseBody MsgModel add(HospitalDeptModel model)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			if (aHospitalDeptService.save(model) > 0)
			{
				msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
			}
		}
		catch (Exception e)
		{
			logger.error("AHospitalDeptController add error：", e);
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
	public @ResponseBody MsgModel modify(HospitalDeptModel model)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			if (aHospitalDeptService.update(model) > 0)
			{
				msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
			}
		}
		catch (Exception e)
		{
			logger.error("AHospitalDeptController modify error：", e);
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
	public @ResponseBody MsgModel delete(HospitalDeptModel model)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			if (aHospitalDeptService.delete(model) > 0)
			{
				msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
			}
		}
		catch (Exception e)
		{
			logger.error("AHospitalDeptController delete error：", e);
		}
		return msgModel;
	}


}
