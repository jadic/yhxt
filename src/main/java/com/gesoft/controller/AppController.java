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
import com.gesoft.model.BloodPressureModel;
import com.gesoft.model.DeleteRecordModel;
import com.gesoft.model.DoctorAdviceModel;
import com.gesoft.model.DoctorAdvicePerformanceModel;
import com.gesoft.model.EarTemperatureModel;
import com.gesoft.model.FeedBackModel;
import com.gesoft.model.FoodItemModel;
import com.gesoft.model.HappyHostLaudModel;
import com.gesoft.model.HappyHostModel;
import com.gesoft.model.HappyHostPostModel;
import com.gesoft.model.HappyHostReplyModel;
import com.gesoft.model.HappyHostReportModel;
import com.gesoft.model.IdModel;
import com.gesoft.model.MealResultModel;
import com.gesoft.model.MentalStatusModel;
import com.gesoft.model.MsgModel;
import com.gesoft.model.NewsModel;
import com.gesoft.model.QueryModel;
import com.gesoft.model.RelativePhoneModel;
import com.gesoft.model.ServiceModel;
import com.gesoft.model.SportItemModel;
import com.gesoft.model.SportResultModel;
import com.gesoft.model.UserModel;
import com.gesoft.model.VersionModel;
import com.gesoft.service.AUserService;
import com.gesoft.service.AppService;
import com.gesoft.service.PQueryService;
import com.gesoft.util.StringUtil;
import com.gesoft.util.SystemUtils;

/**
 * APP接口
 * 
 * @author WCL
 * @version v1.001
 * @since v1.001
 */
@Controller
@RequestMapping("/app")
public class AppController extends BaseController {
    private static final Logger logger = LoggerFactory.getLogger(AppController.class);

    @Resource
    private AppService appService;

    @Resource
    private PQueryService pQueryService;
    
    @Resource
    private AUserService userService;

    /**
     * 描述信息：我的亲情号码 创建时间：2015年3月8日 上午7:27:29
     * 
     * @author WCL (ln_admin@yeah.net)
     * @param model
     * @return , method=RequestMethod.POST
     */
    @RequestMapping(value = "/relativePhone.do")
    public @ResponseBody MsgModel relativePhone(QueryModel model) {
        MsgModel msgModel = new MsgModel();
        try {
            long recordCount = appService.queryRelativePhoneInfoCnt(model);
            if (recordCount > 0) {
                setPageModel(recordCount, model);
                List<RelativePhoneModel> argArgs = appService.queryRelativePhoneInfo(model);
                if (argArgs != null && argArgs.size() > 0) {
                    msgModel.setTotal(recordCount);
                    msgModel.setRows(argArgs);
                }
            }
        } catch (Exception e) {
            logger.error("AppController relativePhone error：", e);
        }
        return msgModel;
    }

    /**
     * 根据用户登录名和密码查询用户信息
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/queryUserInfoWithUserNamePass.do")
    public @ResponseBody MsgModel queryUserInfoWithUserNamePass(QueryModel model) {
        MsgModel msgModel = new MsgModel();
        try {
            List<UserModel> list = appService.queryUserInfoWithUserNamePass(model);
            if (list != null && list.size() > 0) {
                msgModel.setTotal(list.size());
                msgModel.setRows(list);
            }
        } catch (Exception e) {
            logger.error("AppController queryUserInfoWithUserNamePass error:", e);
        }
        return msgModel;
    }

    /**
     * 根据用户ID查询用户信息
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/queryUserInfoWithUserId.do")
    public @ResponseBody MsgModel queryUserInfoWithUserId(QueryModel model) {
        MsgModel msgModel = new MsgModel();
        try {
            List<UserModel> list = appService.queryUserInfoWithUserId(model);
            if (list != null && list.size() > 0) {
                msgModel.setTotal(list.size());
                msgModel.setRows(list);
            }
        } catch (Exception e) {
            logger.error("AppController queryUserInfoWithUserId error:", e);
        }
        return msgModel;
    }

    /**
     * 根据用户ID查询关联的医护联系人信息
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/queryMyNurserWithUserId.do")
    public @ResponseBody MsgModel queryMyNurserWithUserId(QueryModel model) {
        MsgModel msgModel = new MsgModel();
        try {
            List<UserModel> list = appService.queryMyNurserWithUserId(model);
            if (list != null && list.size() > 0) {
                msgModel.setTotal(list.size());
                msgModel.setRows(list);
            }
        } catch (Exception e) {
            logger.error("AppController queryMyNurserWithUserId error:", e);
        }
        return msgModel;
    }

    /**
     * 查询用户可查看的服务信息
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/queryService.do")
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

    @RequestMapping(value = "/queryActivity.do")
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

    @RequestMapping(value = "/queryNews.do")
    public @ResponseBody MsgModel queryNews(QueryModel model) {
        MsgModel msgModel = new MsgModel();
        try {
            long recordCount = appService.queryNewsCnt(model);
            if (recordCount > 0) {
                setPageModel(recordCount, model);
                List<NewsModel> rows = appService.queryNews(model);
                if (rows != null && rows.size() > 0) {
                    msgModel.setTotal(recordCount);
                    msgModel.setRows(rows);
                }
            }
        } catch (Exception e) {
            logger.error("AppController queryNews error：", e);
        }
        return msgModel;
    }

    @RequestMapping(value = "/queryDoctorAdvice.do")
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
            logger.error("AppController queryDoctorAdvice error：", e);
        }
        return msgModel;
    }

    @RequestMapping(value = "/queryDoctorAdvicePerformance.do")
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
            logger.error("AppController queryDoctorAdvicePerformance error：", e);
        }
        return msgModel;
    }

    @RequestMapping(value = "/queryServiceDetail.do")
    public @ResponseBody ModelAndView queryServiceDetail(QueryModel model) {
        ModelAndView mv = new ModelAndView("app/detail");
        mv.getModel().put("content", appService.queryServiceDetail(model));
        return mv;
    }

    @RequestMapping(value = "/queryActivityDetail.do")
    public @ResponseBody ModelAndView queryActivityDetail(QueryModel model) {
        ModelAndView mv = new ModelAndView("app/detail");
        mv.getModel().put("content", appService.queryActivityDetail(model));
        return mv;
    }

    @RequestMapping(value = "/queryNewsDetail.do")
    public @ResponseBody ModelAndView queryNewsDetail(QueryModel model) {
        ModelAndView mv = new ModelAndView("app/detail");
        mv.getModel().put("content", appService.queryNewsDetail(model));
        return mv;
    }

    /**
     * 上传耳温
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/uploadEarTemperature.do")
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
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/uploadBloodGlucose.do")
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
            msgModel.setSuccess(appService.insertBloodGlucose(model) > 0);
        } catch (Exception e) {
            logger.error("AppController uploadBloodGlucose error：", e);
        }
        return msgModel;
    }
    
    @RequestMapping(value = "/uploadBloodPressure.do")
    public @ResponseBody MsgModel uploadBloodPressure(BloodPressureModel model) {
        MsgModel msgModel = new MsgModel();
        try {
            if (model.getUserId() <= 0 || model.getDbp() <= 0 || model.getSbp() <= 0
             || model.getPulse() <= 0 || StringUtil.isNullOrEmpty(model.getTakeTime())) {
                msgModel.setMsg("参数缺失或为空，请确认");
            } else {
                if (appService.queryBloodPressureId(model) <= 0) {//
                    msgModel.setSuccess(appService.insertBloodPressure(model) > 0);
                } else {
                    msgModel.setSuccess(true);
                }
            }
        } catch (Exception e) {
            logger.error("AppController uploadBloodPressure error：", e);
        }
        return msgModel;
    }

    @RequestMapping(value = "/getSportItemVersion.do")
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

    @RequestMapping(value = "/getFoodItemVersion.do")
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

    @RequestMapping(value = "/getSportItems.do")
    public @ResponseBody MsgModel getSportItems(QueryModel model) {
        MsgModel msgModel = new MsgModel();
        try {
            int cnt = appService.getSportItemsCnt(model);
            if (cnt > 0) {
                setPageModel(cnt, model);
                List<SportItemModel> list = appService.getSportItems(model);
                msgModel.setRows(list);
            }
            msgModel.setSuccess(true);
        } catch (Exception e) {
            logger.error("AppController getSportItems error：", e);
        }
        return msgModel;
    }

    @RequestMapping(value = "/getFoodItems.do")
    public @ResponseBody MsgModel getFoodItems(QueryModel model) {
        MsgModel msgModel = new MsgModel();
        try {
            int cnt = appService.getFoodItemsCnt(model);
            if (cnt > 0) {
                setPageModel(cnt, model);
                List<FoodItemModel> list = appService.getFoodItems(model);
                msgModel.setRows(list);
            }
            msgModel.setSuccess(true);
        } catch (Exception e) {
            logger.error("AppController getFoodItems error：", e);
        }
        return msgModel;
    }

    /**
     * 上传运动结果
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/uploadSportResult.do")
    public @ResponseBody MsgModel uploadSportResult(SportResultModel model) {
        MsgModel msgModel = new MsgModel();
        try {
            if (model.getUserId() > 0 && model.getSportItemId() > 0 && model.getSportDuration() > 0 && model.getSportTime() != null
                    && model.getSportTime().length() > 0) {
                appService.insertSportResult(model);
                int id = model.getId();
                msgModel.setTotal(1);
                List<IdModel> idList = new ArrayList<IdModel>();
                IdModel idModel = new IdModel();
                idModel.setId(id);
                idList.add(idModel);
                msgModel.setSuccess(id > 0);
                msgModel.setRows(idList);
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
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/uploadMealResult.do")
    public @ResponseBody MsgModel uploadMealResult(MealResultModel model) {
        MsgModel msgModel = new MsgModel();
        try {
            if (model.getUserId() > 0 && model.getFoodItemId() > 0 && model.getFoodAmount() > 0 && model.getMealFlag() > 0
                    && model.getMealTime() != null && model.getMealTime().length() > 0) {
                appService.insertMealResult(model);
                int id = model.getId();
                msgModel.setTotal(1);
                List<IdModel> idList = new ArrayList<IdModel>();
                IdModel idModel = new IdModel();
                idModel.setId(id);
                idList.add(idModel);
                msgModel.setSuccess(id > 0);
                msgModel.setRows(idList);
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
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/uploadMentalStatus.do")
    public @ResponseBody MsgModel uploadMentalStatus(MentalStatusModel model) {
        MsgModel msgModel = new MsgModel();
        try {
            if (model.getUserId() > 0 && model.getMentalStatus() > 0 && model.getRecordTime() != null && model.getRecordTime().length() > 0) {
                appService.insertMentalStatus(model);
                int id = model.getId();
                msgModel.setTotal(1);
                List<IdModel> idList = new ArrayList<IdModel>();
                IdModel idModel = new IdModel();
                idModel.setId(id);
                idList.add(idModel);
                msgModel.setSuccess(id > 0);
                msgModel.setRows(idList);
            } else {
                msgModel.setMsg(MsgModel.GLOBAL_MSG_FAIL + "(参数有误)");
            }
        } catch (Exception e) {
            logger.error("AppController uploadMentalStatus error：", e);
        }
        return msgModel;
    }

    @RequestMapping(value = "/addFeedback.do")
    public @ResponseBody MsgModel addFeedback(FeedBackModel model) {
        MsgModel msgModel = new MsgModel();
        try {
            model.setStime(SystemUtils.getCurrentSystemTime());
            if (pQueryService.addFeedBackInfo(model) > 0) {
                msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
            }
        } catch (Exception e) {
            logger.error("AppController toAddFeedBack error：", e);
        }
        return msgModel;
    }

    @RequestMapping(value = "/deleteRecords.do")
    public @ResponseBody MsgModel deleteRecords(DeleteRecordModel model) {
        MsgModel msgModel = new MsgModel();
        try {
            msgModel.setSuccess(appService.deleteRecords(model) > 0);
        } catch (Exception e) {
            logger.error("AppController toAddFeedBack error：", e);
        }
        return msgModel;
    }
    
    @RequestMapping(value = "/addNewUser.do")
    public @ResponseBody MsgModel addNewUser(UserModel model) {
        MsgModel msgModel = new MsgModel();
        try {
            if (StringUtil.isNullOrEmpty(model.getCellphone()) || StringUtil.isNullOrEmpty(model.getUserPass())) {
                msgModel.setMsg("参数缺失或为空，请确认");
            } else {
                //app端注册用户，利用手机作为标识
                model.setUserName(model.getCellphone());
                model.setUserPwd(model.getUserPass());
                
                if (userService.queryUserCountWithUsrName(model) <= 0) {
                    userService.save(model);
                    List<UserModel> list = new ArrayList<UserModel>();
                    list.add(model);
                    msgModel.setRows(list);
                    msgModel.setTotal(1);
                } else {
                    msgModel.setMsg("该手机号已存在，请确认");
                }
            }
        } catch (Exception e) {
            logger.error("AppController addNewUser error：", e);
        }
        return msgModel;
    }
    
    @RequestMapping(value = "/updateUserInfo.do")
    public @ResponseBody MsgModel updateUserInfo(UserModel model) {
        MsgModel msgModel = new MsgModel();
        try {
            msgModel.setSuccess(userService.updateUserInfoForApp(model) > 0);
        } catch (Exception e) {
            logger.error("AppController updateUserInfo error：", e);
        }
        return msgModel;
    }
    
    
    /**
     * 描述信息：APP 分页加载圈子
     * 创建时间：2015年5月27日 上午6:41:02
     * @author WCL (ln_admin@yeah.net)
     * @param model
     * @return
     */
    @RequestMapping(value = "/happyHost.do")
	public @ResponseBody MsgModel toHappyHost(QueryModel query)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			long recordCount = appService.queryHappyHostInfoCnt(query);
			if(recordCount>0)
			{
				setPageModel(recordCount, query);
				List<HappyHostModel> argArgs = appService.queryHappyHostInfo(query);
				if (argArgs != null)
				{
					msgModel.setTotal(recordCount);
					msgModel.setRows(argArgs);
				}
			}
		}
		catch (Exception e)
		{
			logger.error("AppController toHappyHost error：", e);
		}
		return msgModel;
	}
    
    
    /**
     * 描述信息：分页加载话题
     * 创建时间：2015年5月27日 上午6:44:52
     * @author WCL (ln_admin@yeah.net)
     * @param query
     * @return
     */
    @RequestMapping(value = "/happyHostPost.do")
   	public @ResponseBody MsgModel toHappyHostPost(QueryModel query)
   	{
   		MsgModel msgModel = new MsgModel();
   		try
   		{
   			long recordCount = appService.queryHappyHostPostInfoCnt(query);
   			if(recordCount>0)
   			{
   				setPageModel(recordCount, query);
   				List<HappyHostPostModel> argArgs = appService.queryHappyHostPostInfo(query);
   				if (argArgs != null)
   				{
   					msgModel.setTotal(recordCount);
   					msgModel.setRows(argArgs);
   				}
   			}
   		}
   		catch (Exception e)
   		{
   			logger.error("AppController toHappyHostPost error：", e);
   		}
   		return msgModel;
   	}
    
    
    /**
     * 描述信息：最热
     * 创建时间：2015年5月28日 上午9:58:19
     * @author WCL (ln_admin@yeah.net)
     * @param query
     * @return
     */
    @RequestMapping(value = "/happyHostZrPost.do")
   	public @ResponseBody MsgModel toHappyHostZrPost(QueryModel query)
   	{
   		MsgModel msgModel = new MsgModel();
   		try
   		{
   			long recordCount = appService.queryHappyHostPostInfoCnt(query);
   			if(recordCount>0)
   			{
   				setPageModel(recordCount, query);
   				List<HappyHostPostModel> argArgs = appService.queryHappyHostZrPostInfo(query);
   				if (argArgs != null)
   				{
   					msgModel.setTotal(recordCount);
   					msgModel.setRows(argArgs);
   				}
   			}
   		}
   		catch (Exception e)
   		{
   			logger.error("AppController toHappyHostZrPost error：", e);
   		}
   		return msgModel;
   	}
    
    
    /**
     * 描述信息：分页加载快乐驿站回复
     * 创建时间：2015年5月27日 上午6:46:24
     * @author WCL (ln_admin@yeah.net)
     * @param query
     * @return
     */
    @RequestMapping(value = "/happyHostReply.do")
   	public @ResponseBody MsgModel toHappyHostReply(QueryModel query)
   	{
   		MsgModel msgModel = new MsgModel();
   		try
   		{
   			List<HappyHostPostModel> argFlys = appService.queryHappyHostPostInfoById(query);
   			if (argFlys != null)
			{
				msgModel.setTotal(argFlys.size());
				msgModel.setRows(argFlys);
				
				List<HappyHostReplyModel> argArgs = appService.queryHappyHostReplyInfo(query);
	   			if (argArgs != null)
	   			{
	   				msgModel.setFooter(argArgs);
	   			}
			}
   		}
   		catch (Exception e)
   		{
   			logger.error("AppController toHappyHostReply error：", e);
   		}
   		return msgModel;
   	}
    
    
    /**
     * 描述信息：点赞操作
     * 创建时间：2015年5月28日 下午2:21:20
     * @author WCL (ln_admin@yeah.net)
     * @param model
     * @return
     */
    @RequestMapping(value = "/addHappyHostLaud.do")
   	public @ResponseBody MsgModel addHappyHostLaud(HappyHostLaudModel model)
   	{
   		MsgModel msgModel = new MsgModel();
   		try
   		{
   			model.setStime(SystemUtils.getCurrentSystemTime());
   			long nRet = appService.addHappyHostLaudIinfo(model);
   			if(nRet>0)
   			{
   				msgModel.setSuccess(true);
   			}
   		}
   		catch (Exception e)
   		{
   			logger.error("AppController addHappyHostLaud error：", e);
   		}
   		return msgModel;
   	}
    
    /**
     * 描述信息：发布话题
     * 创建时间：2015年5月28日 上午11:56:16
     * @author WCL (ln_admin@yeah.net)
     * @param query
     * @return
     */
    @RequestMapping(value = "/addHappyHostPost.do")
   	public @ResponseBody MsgModel addHappyHostPost(HappyHostPostModel model)
   	{
   		MsgModel msgModel = new MsgModel();
   		try
   		{
   			model.setStime(SystemUtils.getCurrentSystemTime());
   			long nRet = appService.addHappyHostPostInfo(model);
   			if(nRet>0)
   			{	
   				msgModel.setSuccess(true);
   			}
   		}
   		catch (Exception e)
   		{
   			logger.error("AppController addHappyHostPost error：", e);
   		}
   		return msgModel;
   	}
    
    
    /**
     * 描述信息：增加回复记录
     * 创建时间：2015年5月28日 下午2:35:23
     * @author WCL (ln_admin@yeah.net)
     * @param model
     * @return
     */
    @RequestMapping(value = "/addHappyHostReply.do")
   	public @ResponseBody MsgModel addHappyHostReply(HappyHostReplyModel model)
   	{
   		MsgModel msgModel = new MsgModel();
   		try
   		{
   			model.setStime(SystemUtils.getCurrentSystemTime());
   			long nRet = appService.addHappyHostReplyInfo(model);
   			if(nRet>0)
   			{
   				List<HappyHostReplyModel> argArgs = appService.queryHappyHostReplyInfoById(model);
   				if (argArgs != null && argArgs.size() > 0)
				{
					msgModel.setTotal(argArgs.size());
					msgModel.setRows(argArgs);
				}
   				msgModel.setSuccess(true);
   			}
   		}
   		catch (Exception e)
   		{
   			logger.error("AppController addHappyHostReply error：", e);
   		}
   		return msgModel;
   	}
    
 
    
    /**
     * 描述信息：增加举报
     * 创建时间：2015年5月28日 下午2:35:23
     * @author WCL (ln_admin@yeah.net)
     * @param model
     * @return
     */
    @RequestMapping(value = "/addHappyHostReport.do")
   	public @ResponseBody MsgModel addHappyHostReport(HappyHostReportModel model)
   	{
   		MsgModel msgModel = new MsgModel();
   		try
   		{
   			model.setStime(SystemUtils.getCurrentSystemTime());
   			long nRet = appService.addHappyHostReportInfo(model);
   			if(nRet>0)
   			{
   				msgModel.setSuccess(true);
   			}
   		}
   		catch (Exception e)
   		{
   			logger.error("AppController addHappyHostReport error：", e);
   		}
   		return msgModel;
   	}
}
