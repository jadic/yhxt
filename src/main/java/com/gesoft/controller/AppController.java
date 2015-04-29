/**
 * 文件名称：AppController.java
 * 版权所有：Copyright njty
 * 创建时间：2015年3月8日
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gesoft.model.ActivityModel;
import com.gesoft.model.BloodGlucoseModel;
import com.gesoft.model.DoctorAdviceModel;
import com.gesoft.model.DoctorAdvicePerformanceModel;
import com.gesoft.model.EarTemperatureModel;
import com.gesoft.model.FoodItemModel;
import com.gesoft.model.MealResultModel;
import com.gesoft.model.MentalStatusModel;
import com.gesoft.model.MsgModel;
import com.gesoft.model.QueryModel;
import com.gesoft.model.RelativePhoneModel;
import com.gesoft.model.ServiceModel;
import com.gesoft.model.SportItemModel;
import com.gesoft.model.SportResultModel;
import com.gesoft.model.UserModel;
import com.gesoft.model.VersionModel;
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
    
    @RequestMapping(value="/queryServiceDetail.do")
    public @ResponseBody ModelAndView queryServiceDetail(QueryModel model) {
        ModelAndView mv = new ModelAndView("app/detail");
        mv.getModel().put("content", appService.queryServiceDetail(model));
        return mv;
    }
    
    @RequestMapping(value="/queryActivityDetail.do")
    public @ResponseBody ModelAndView queryActivityDetail(QueryModel model) {
        ModelAndView mv = new ModelAndView("app/detail");
        mv.getModel().put("content", appService.queryActivityDetail(model));
        return mv;
    }

    /**
     * 上传耳温
     * @param model
     * @return
     */
    @RequestMapping(value="/uploadEarTemperature.do")
    public @ResponseBody MsgModel uploadEarTemperature(EarTemperatureModel model) {
        MsgModel msgModel = new MsgModel();
        try {
            if (appService.queryEarTemperatureId(model) <= 0) {//
                msgModel.setSuccess(appService.insertEarTemperature(model) > 0);
            } else {
                msgModel.setSuccess(true);
            }
        } catch (Exception e) {
            logger.error("AppController uploadEarTemperature error：", e);
        }
        return msgModel;
    }
    
    /**
     * 上传血糖
     * @param model
     * @return
     */
    @RequestMapping(value="/uploadBloodGlucose.do")
    public @ResponseBody MsgModel uploadBloodGlucose(BloodGlucoseModel model) {
        MsgModel msgModel = new MsgModel();
        try {
            model.setTakeDate(model.getTakeTime().substring(0, 10));
            if (model.getBloodGlucose1() > 0) {
                model.setTakeTime1(model.getTakeTime());
            }
            if (model.getBloodGlucose2() > 0) {
                model.setTakeTime2(model.getTakeTime());
            }
            long bloodGlucoseId = appService.queryBloodGlucoseId(model);
            if (bloodGlucoseId <= 0) {
                msgModel.setSuccess(appService.insertBloodGlucose(model) > 0);
            } else {
                model.setId(bloodGlucoseId);
                appService.updateBloodGlucose(model);
            }
            msgModel.setSuccess(true);
        } catch (Exception e) {
            logger.error("AppController uploadEarTemperature error：", e);
        }
        return msgModel;
    }

    @RequestMapping(value="/getSportItemVersion.do")
    public @ResponseBody MsgModel getSportItemVersion(QueryModel model) {
        MsgModel msgModel = new MsgModel();
        try {
            List<VersionModel> list = new ArrayList<VersionModel>();
            VersionModel versionModel = new VersionModel();
            versionModel.setVersion(appService.getSportItemVersion(model));
            list.add(versionModel);
            msgModel.setTotal(1);
            msgModel.setRows(list);
            msgModel.setSuccess(true);
        } catch (Exception e) {
            logger.error("AppController getSportItemVersion error：", e);
        }
        return msgModel;
    }
    
    @RequestMapping(value="/getFoodItemVersion.do")
    public @ResponseBody MsgModel getFoodItemVersion(QueryModel model) {
        MsgModel msgModel = new MsgModel();
        try {
            List<VersionModel> list = new ArrayList<VersionModel>();
            VersionModel versionModel = new VersionModel();
            versionModel.setVersion(appService.getFoodItemVersion(model));
            list.add(versionModel);
            msgModel.setTotal(1);
            msgModel.setRows(list);
            msgModel.setSuccess(true);
        } catch (Exception e) {
            logger.error("AppController getFoodItemVersion error：", e);
        }
        return msgModel;
    }
    
    @RequestMapping(value="/getSportItems.do")
    public @ResponseBody MsgModel getSportItems(QueryModel model) {
        MsgModel msgModel = new MsgModel();
        try {
            int cnt = appService.getSportItemsCnt(model);
            if (cnt > 0) {
                setPageModel(cnt, model);
                List<SportItemModel> list = appService.getSportItems(model);
                msgModel.setRows(list);
            }
        } catch (Exception e) {
            logger.error("AppController getSportItems error：", e);
        }
        return msgModel;
    }
    
    @RequestMapping(value="/getFoodItems.do")
    public @ResponseBody MsgModel getFoodItems(QueryModel model) {
        MsgModel msgModel = new MsgModel();
        try {
            int cnt = appService.getFoodItemsCnt(model);
            if (cnt > 0) {
                setPageModel(cnt, model);
                List<FoodItemModel> list = appService.getFoodItems(model);
                msgModel.setRows(list);
            }
        } catch (Exception e) {
            logger.error("AppController getFoodItems error：", e);
        }
        return msgModel;
    }
    
    /**
     * 上传运动结果
     * @param model
     * @return
     */
    @RequestMapping(value="/uploadSportResult.do")
    public @ResponseBody MsgModel uploadSportResult(SportResultModel model) {
        MsgModel msgModel = new MsgModel();
        try {
            if (model.getUserId() > 0 && model.getSportItemId() > 0 && model.getSportDuration() > 0 
                    && model.getSportTime() != null && model.getSportTime().length() > 0) {
                msgModel.setSuccess(appService.insertSportResult(model) > 0);
            } else {
                msgModel.setMsg(MsgModel.GLOBAL_MSG_FAIL + "(参数有误)");
            }
        } catch (Exception e) {
            logger.error("AppController uploadSportResult error：", e);
        }
        return msgModel;
    }
    
    /**
     * 上传饮食结果
     * @param model
     * @return
     */
    @RequestMapping(value="/uploadMealResult.do")
    public @ResponseBody MsgModel uploadMealResult(MealResultModel model) {
        MsgModel msgModel = new MsgModel();
        try {
            if (model.getUserId() > 0 && model.getFoodItemId() > 0 && model.getFoodAmount() > 0 
                    && model.getMealFlag() > 0 && model.getMealTime() != null && model.getMealTime().length() > 0) {
                msgModel.setSuccess(appService.insertMealResult(model) > 0);
            } else {
                msgModel.setMsg(MsgModel.GLOBAL_MSG_FAIL + "(参数有误)");
            }
        } catch (Exception e) {
            logger.error("AppController uploadMealResult error：", e);
        }
        return msgModel;
    }
    
    /**
     * 上传心理状态
     * @param model
     * @return
     */
    @RequestMapping(value="/uploadMentalStatus.do")
    public @ResponseBody MsgModel uploadMentalStatus(MentalStatusModel model) {
        MsgModel msgModel = new MsgModel();
        try {
            if (model.getUserId() > 0 && model.getMentalStatus() > 0 
                    && model.getRecordTime() != null && model.getRecordTime().length() > 0) {
                msgModel.setSuccess(appService.insertMentalStatus(model) > 0);
            } else {
                msgModel.setMsg(MsgModel.GLOBAL_MSG_FAIL + "(参数有误)");
            }
        } catch (Exception e) {
            logger.error("AppController uploadMentalStatus error：", e);
        }
        return msgModel;
    }
}
