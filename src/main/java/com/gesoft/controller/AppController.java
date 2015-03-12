/**
 * 文件名称：AppController.java
 * 版权所有：Copyright njty
 * 创建时间：2015年3月8日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.controller;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gesoft.model.ActivityModel;
import com.gesoft.model.DoctorAdviceModel;
import com.gesoft.model.DoctorAdvicePerformanceModel;
import com.gesoft.model.MsgModel;
import com.gesoft.model.QueryModel;
import com.gesoft.model.RelativePhoneModel;
import com.gesoft.model.ServiceModel;
import com.gesoft.model.UserModel;
import com.gesoft.service.AppService;


/**
 * APP接口
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
@Controller
@RequestMapping("/app")
public class AppController extends BaseController
{
	private static final Logger logger = LoggerFactory.getLogger(AppController.class);
	
	@Resource
	private AppService appService;
	
	
	
	/**
	 * 描述信息：我的亲情号码
	 * 创建时间：2015年3月8日 上午7:27:29
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return  , method=RequestMethod.POST
	 */
	@RequestMapping(value="/relativePhone.do")
	public @ResponseBody MsgModel relativePhone(QueryModel model)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			long recordCount = appService.queryRelativePhoneInfoCnt(model);
			if(recordCount>0)
			{
				setPageModel(recordCount, model);
				List<RelativePhoneModel> argArgs = appService.queryRelativePhoneInfo(model);
				if (argArgs != null && argArgs.size() > 0)
				{
					msgModel.setTotal(recordCount);
					msgModel.setRows(argArgs);
				}
			}
		}
		catch (Exception e)
		{
			logger.error("AppController relativePhone error：", e);
		}
		return msgModel;
	}
	
	/**
	 * 根据用户登录名和密码查询用户信息
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/queryUserInfoWithUserNamePass.do")
	public @ResponseBody MsgModel queryUserInfoWithUserNamePass(QueryModel model) {
	    MsgModel msgModel = new MsgModel();
	    try {
	        List<UserModel> list = appService.queryUserInfoWithUserNamePass(model);
	        if (list != null && list.size() > 0) {
	            msgModel.setTotal(list.size());
	            msgModel.setRows(list);
	        }
	    } catch (Exception e){
	        logger.error("AppController getUserInfo error:", e);
	    }
	    return msgModel;
	}
	
	/**
	 * 根据用户ID查询用户信息
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/queryUserInfoWithUserId.do")
	public @ResponseBody MsgModel queryUserInfoWithUserId(QueryModel model) {
        MsgModel msgModel = new MsgModel();
        try {
            List<UserModel> list = appService.queryUserInfoWithUserId(model);
            if (list != null && list.size() > 0) {
                msgModel.setTotal(list.size());
                msgModel.setRows(list);
            }
        } catch (Exception e){
            logger.error("AppController queryUserInfoWithUserId error:", e);
        }
        return msgModel;
	}
	
	/**
	 * 根据用户ID查询关联的医护联系人信息
	 * @param  model
	 * @return
	 */
	@RequestMapping(value="/queryMyNurserWithUserId.do")
	public @ResponseBody MsgModel queryMyNurserWithUserId(QueryModel model) {
	    MsgModel msgModel = new MsgModel();
        try {
            List<UserModel> list = appService.queryMyNurserWithUserId(model);
            if (list != null && list.size() > 0) {
                msgModel.setTotal(list.size());
                msgModel.setRows(list);
            }
        } catch (Exception e){
            logger.error("AppController queryMyNurserWithUserId error:", e);
        }
        return msgModel;
	}
	
	/**
	 * 查询用户可查看的服务信息
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/queryService.do")
	public @ResponseBody MsgModel queryServices(QueryModel model) {
	    MsgModel msgModel = new MsgModel();
	    try {
            long recordCount = appService.queryServiceCnt(model);
            if (recordCount > 0) {
                setPageModel(recordCount, model);
                List<ServiceModel> rows = appService.queryService(model);
                if (rows != null && rows.size() > 0) {
                    msgModel.setTotal(recordCount);
                    msgModel.setRows(rows);
                }
            }
        } catch (Exception e) {
            logger.error("AppController queryService error：", e);
        }
	    return msgModel;
	}
	
	@RequestMapping(value="/queryActivity.do")
	public @ResponseBody MsgModel queryActivity(QueryModel model) {
	    MsgModel msgModel = new MsgModel();
	    try {
	        long recordCount = appService.queryActivityCnt(model);
	        if (recordCount > 0) {
	            setPageModel(recordCount, model);
	            List<ActivityModel> rows = appService.queryActivity(model);
	            if (rows != null && rows.size() > 0) {
	                msgModel.setTotal(recordCount);
	                msgModel.setRows(rows);
	            }
	        }
	    } catch (Exception e) {
	        logger.error("AppController queryActivity error：", e);
	    }
	    return msgModel;
	}
	
    @RequestMapping(value="/queryDoctorAdvice.do")
    public @ResponseBody MsgModel queryDoctorAdvice(QueryModel model) {
        MsgModel msgModel = new MsgModel();
        try {
            long recordCount = appService.queryActivityCnt(model);
            if (recordCount > 0) {
                setPageModel(recordCount, model);
                List<DoctorAdviceModel> rows = appService.queryDoctorAdvice(model);
                if (rows != null && rows.size() > 0) {
                    msgModel.setTotal(recordCount);
                    msgModel.setRows(rows);
                }
            }
        } catch (Exception e) {
            logger.error("AppController queryActivity error：", e);
        }
        return msgModel;
    }
    
    @RequestMapping(value="/queryDoctorAdvicePerformance.do")
    public @ResponseBody MsgModel queryDoctorAdvicePerformance(QueryModel model) {
        MsgModel msgModel = new MsgModel();
        try {
            long recordCount = appService.queryDoctorAdvicePerformanceCnt(model);
            if (recordCount > 0) {
                setPageModel(recordCount, model);
                List<DoctorAdvicePerformanceModel> rows = appService.queryDoctorAdvicePerformance(model);
                if (rows != null && rows.size() > 0) {
                    msgModel.setTotal(recordCount);
                    msgModel.setRows(rows);
                }
            }
        } catch (Exception e) {
            logger.error("AppController queryActivity error：", e);
        }
        return msgModel;
    }
}
