/**
 * 文件名称：AServiceController.java
 * 版权所有：Copyright njty
 * 创建时间：2015年3月3日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gesoft.model.DoctorModel;
import com.gesoft.model.MsgModel;
import com.gesoft.model.QueryModel;
import com.gesoft.model.ServiceModel;
import com.gesoft.service.AServiceService;
import com.gesoft.util.SystemUtils;

/**
 * 服务管理
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
@Controller
@RequestMapping("/a/service")
public class AServiceController extends BaseController
{


	private static final Logger logger = LoggerFactory.getLogger(AServiceController.class);
	
	@Resource
	private AServiceService aServiceService;
	

	/**
	 * 描述信息：分页查询
	 * 创建时间：2015年1月29日 下午2:34:54
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/query.do", method=RequestMethod.POST)
	public @ResponseBody MsgModel search(ServiceModel model)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			aServiceService.findPageList(model, msgModel);
		}
		catch (Exception e)
		{
			logger.error("AServiceController search error：", e);
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
	public @ResponseBody MsgModel add(ServiceModel model)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			model.setCreatorId(getSessionUserId());
			model.setCreateTime(SystemUtils.getCurrentSystemTime());
			if (aServiceService.save(model) > 0)
			{
				msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
			}
		}
		catch (Exception e)
		{
			logger.error("AServiceController add error：", e);
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
	public @ResponseBody MsgModel modify(ServiceModel model)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			if (aServiceService.update(model) > 0)
			{
				msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
			}
		}
		catch (Exception e)
		{
			logger.error("AServiceController modify error：", e);
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
	public @ResponseBody MsgModel delete(ServiceModel model)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			if (aServiceService.delete(model) > 0)
			{
				msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
			}
		}
		catch (Exception e)
		{
			logger.error("AServiceController delete error：", e);
		}
		return msgModel;
	}

	@RequestMapping(value="/queryDoctor.do", method=RequestMethod.POST)
	public @ResponseBody List<DoctorModel> querySimpleDoctorInfo(QueryModel model)
	{
	    List<DoctorModel> list = null;
	    try
	    {
	        list = aServiceService.queryDoctors(model);
	    }
	    catch (Exception e)
	    {
	        logger.error("AServiceController querySimpleDoctorInfo error：", e);
	    }
	    return list;
	}
	
	@RequestMapping(value="/queryAssociatedDoctorIds.do", method=RequestMethod.POST)
	public @ResponseBody long[] queryAssociatedDoctorIds(QueryModel model)
	{
	    long[] ids = null;
	    try
        {
	        List<DoctorModel> list = aServiceService.queryAssociatedDoctorIds(model);
	        if (list != null) {
	            ids = new long[list.size()];
	            for (int i = 0; i < list.size(); i ++) {
	                ids[i] = list.get(i).getDoctorId(); 
	            }
	        }
        }
        catch (Exception e)
        {
            logger.error("AServiceController querySimpleDoctorInfo error：", e);
        }
	    return ids;
	}

	@RequestMapping(value="/associateDoctor.do", method=RequestMethod.POST)
	public @ResponseBody MsgModel associateDoctor(QueryModel model)
	{
	    MsgModel msgModel = new MsgModel();
	    try
	    {
	        msgModel.setSuccess(aServiceService.insertDoctorAssociation(model));
	        logger.info("id:{}, doctorIds:{}", model.getId(), model.getDoctorIds());
	    }
	    catch (Exception e)
	    {
	        logger.error("AServiceController delete error：", e);
	    }
	    return msgModel;
	}

}
