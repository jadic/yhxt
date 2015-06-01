/**
 * 文件名称：AppService.java
 * 版权所有：Copyright njty
 * 创建时间：2015年3月8日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gesoft.common.EntityDAO;
import com.gesoft.common.EntityService;
import com.gesoft.dao.AppDAO;
import com.gesoft.model.ActivityModel;
import com.gesoft.model.BaseModel;
import com.gesoft.model.BloodGlucoseModel;
import com.gesoft.model.BloodPressureModel;
import com.gesoft.model.DeleteRecordModel;
import com.gesoft.model.DoctorAdviceModel;
import com.gesoft.model.DoctorAdvicePerformanceModel;
import com.gesoft.model.EarTemperatureModel;
import com.gesoft.model.FoodItemModel;
import com.gesoft.model.HappyHostLaudModel;
import com.gesoft.model.HappyHostModel;
import com.gesoft.model.HappyHostPostModel;
import com.gesoft.model.HappyHostReplyModel;
import com.gesoft.model.MealResultModel;
import com.gesoft.model.MentalStatusModel;
import com.gesoft.model.NewsModel;
import com.gesoft.model.QueryModel;
import com.gesoft.model.RelativePhoneModel;
import com.gesoft.model.ServiceModel;
import com.gesoft.model.SportItemModel;
import com.gesoft.model.SportResultModel;
import com.gesoft.model.UserModel;

/**
 * @author WCL
 * @version v1.001
 * @since v1.001
 */
@Service
@Transactional
public class AppService extends EntityService<BaseModel, Long> {

    @Resource
    private AppDAO appDAO;

    @Override
    protected EntityDAO<BaseModel, Long> getEntityDao() {
        return this.appDAO;
    }

    /**
     * 描述信息：查询亲情号码总数 创建时间：2015年3月8日 上午7:39:26
     * 
     * @author WCL (ln_admin@yeah.net)
     * @param model
     * @return
     */
    @Transactional(readOnly = true)
    public long queryRelativePhoneInfoCnt(QueryModel model) {
        return appDAO.queryRelativePhoneInfoCnt(model);
    }

    /**
     * 描述信息：分页查询亲情号码 创建时间：2015年3月8日 上午7:39:26
     * 
     * @author WCL (ln_admin@yeah.net)
     * @param model
     * @return
     */
    @Transactional(readOnly = true)
    public List<RelativePhoneModel> queryRelativePhoneInfo(QueryModel model) {
        return appDAO.queryRelativePhoneInfo(model);
    }

    /**
     * 根据用户名和密码查询用户信息
     * 
     * @param model
     * @return
     */
    @Transactional(readOnly = true)
    public List<UserModel> queryUserInfoWithUserNamePass(QueryModel model) {
        return appDAO.queryUserInfoWithUserNamePass(model);
    }

    /**
     * 根据用户ID查询用户信息
     * 
     * @param model
     * @return
     */
    @Transactional(readOnly = true)
    public List<UserModel> queryUserInfoWithUserId(QueryModel model) {
        return appDAO.queryUserInfoWithUserId(model);
    }

    /**
     * 根据用户ID查询关联的医护联系人信息
     * 
     * @param model
     * @return
     */
    @Transactional(readOnly = true)
    public List<UserModel> queryMyNurserWithUserId(QueryModel model) {
        return appDAO.queryMyNurserWithUserId(model);
    }

    @Transactional(readOnly = true)
    public long queryServiceCnt(QueryModel model) {
        return appDAO.queryServiceCnt(model);
    }

    @Transactional(readOnly = true)
    public List<ServiceModel> queryService(QueryModel model) {
        return appDAO.queryService(model);
    }
    
    @Transactional(readOnly = true)
    public long queryActivityCnt(QueryModel model) {
        return appDAO.queryActivityCnt(model);
    }
    
    @Transactional(readOnly = true)
    public List<ActivityModel> queryActivity(QueryModel model) {
        return appDAO.queryActivity(model);
    }
    
    @Transactional(readOnly = true)
    public long queryNewsCnt(QueryModel model) {
        return appDAO.queryNewsCnt(model);
    }
    
    @Transactional(readOnly = true)
    public List<NewsModel> queryNews(QueryModel model) {
        return appDAO.queryNews(model);
    }
    
    @Transactional(readOnly = true)
    public long queryDoctorAdviceCnt(QueryModel model) {
        return appDAO.queryDoctorAdviceCnt(model);
    }
    
    @Transactional(readOnly = true)
    public List<DoctorAdviceModel> queryDoctorAdvice(QueryModel model) {
        return appDAO.queryDoctorAdvice(model);
    }
    
    @Transactional(readOnly = true)
    public long queryDoctorAdvicePerformanceCnt(QueryModel model) {
        return appDAO.queryDoctorAdvicePerformanceCnt(model);
    }
    
    @Transactional(readOnly = true)
    public List<DoctorAdvicePerformanceModel> queryDoctorAdvicePerformance(QueryModel model) {
        return appDAO.queryDoctorAdvicePerformance(model);
    }
    
    @Transactional(readOnly = true)
    public String queryServiceDetail(QueryModel model) {
        return appDAO.queryServiceDetail(model);
    }
    
    @Transactional(readOnly = true)
    public String queryActivityDetail(QueryModel model) {
        return appDAO.queryActivityDetail(model);
    }    
    
    @Transactional(readOnly = true)
    public String queryNewsDetail(QueryModel model) {
        return appDAO.queryNewsDetail(model);
    }    
    
    @Transactional(readOnly = true)
    public long queryEarTemperatureId(EarTemperatureModel model) {
        return appDAO.queryEarTemperatureId(model);
    }
   
    public int insertEarTemperature(EarTemperatureModel model) {
        return appDAO.insertEarTemperature(model);
    }

    @Transactional(readOnly = true)
    public long queryBloodGlucoseId(BloodGlucoseModel model) {
        return appDAO.queryBloodGlucoseId(model);
    }
    
    public int insertBloodGlucose(BloodGlucoseModel model) {
        return appDAO.insertBloodGlucose(model);
    }
    
    public int updateBloodGlucose(BloodGlucoseModel model) {
        return appDAO.updateBloodGlucose(model);
    }
    
    @Transactional(readOnly = true)
    public long queryBloodPressureId(BloodPressureModel model) {
        return appDAO.queryBloodPressureId(model);
    }
    
    public int insertBloodPressure(BloodPressureModel model) {
        return appDAO.insertBloodPressure(model);
    }
    
    @Transactional(readOnly = true)
    public String getSportItemVersion(QueryModel model) {
        return appDAO.getSportItemVersion(model);
    }
    
    @Transactional(readOnly = true)
    public String getFoodItemVersion(QueryModel model) {
        return appDAO.getFoodItemVersion(model);
    }
    
    @Transactional(readOnly = true)
    public int getSportItemsCnt(QueryModel model) {
        return appDAO.getSportItemsCnt(model);
    }
    
    @Transactional(readOnly = true)
    public List<SportItemModel> getSportItems(QueryModel model) {
        return appDAO.getSportItems(model);
    }
    
    @Transactional(readOnly = true)
    public int getFoodItemsCnt(QueryModel model) {
        return appDAO.getFoodItemsCnt(model);
    }
    
    @Transactional(readOnly = true)
    public List<FoodItemModel> getFoodItems(QueryModel model) {
        return appDAO.getFoodItems(model);
    }

    public int insertSportResult(SportResultModel model) {
        return appDAO.insertSportResult(model);
    }
    
    public int insertMealResult(MealResultModel model) {
        return appDAO.insertMealResult(model);
    }
    
    public int insertMentalStatus(MentalStatusModel model) {
        return appDAO.insertMentalStatus(model);
    }
    
    public int deleteRecords(DeleteRecordModel model) {
        return appDAO.deleteRecords(model);
    }

    /**
     * 描述信息：加载快乐驿站圈子总数
     * 创建时间：2015年5月27日 上午6:48:22
     * @author WCL (ln_admin@yeah.net)
     * @param query
     * @return
     */
    @Transactional(readOnly=true)
	public long queryHappyHostInfoCnt(QueryModel query)
	{
		return appDAO.queryHappyHostInfoCnt(query);
	}

    
    
    /**
     * 描述信息：加载快乐驿站圈子 分页
     * 创建时间：2015年5月27日 上午6:48:22
     * @author WCL (ln_admin@yeah.net)
     * @param query
     * @return
     */
    @Transactional(readOnly=true)
	public List<HappyHostModel> queryHappyHostInfo(QueryModel query)
	{
    	return appDAO.queryHappyHostInfo(query);
	}

    
    /**
     * 描述信息：加载快乐驿站话题总数
     * 创建时间：2015年5月27日 上午6:48:22
     * @author WCL (ln_admin@yeah.net)
     * @param query
     * @return
     */
    @Transactional(readOnly=true)
	public long queryHappyHostPostInfoCnt(QueryModel query)
	{
    	return appDAO.queryHappyHostPostInfoCnt(query);
	}

    
    /**
     * 描述信息：加载快乐驿站话题 分页
     * 创建时间：2015年5月27日 上午6:48:22
     * @author WCL (ln_admin@yeah.net)
     * @param query
     * @return
     */
    @Transactional(readOnly=true)
	public List<HappyHostPostModel> queryHappyHostPostInfo(QueryModel query)
	{
    	return appDAO.queryHappyHostPostInfo(query);
	}

    
    /**
     * 描述信息：加载快乐驿站话题 分页
     * 创建时间：2015年5月27日 上午6:48:22
     * @author WCL (ln_admin@yeah.net)
     * @param query
     * @return
     */
    @Transactional(readOnly=true)
	public List<HappyHostPostModel> queryHappyHostZrPostInfo(QueryModel query)
	{
    	return appDAO.queryHappyHostZrPostInfo(query);
	}
    
    /**
     * 描述信息：加载快乐驿站回复总数
     * 创建时间：2015年5月27日 上午6:48:22
     * @author WCL (ln_admin@yeah.net)
     * @param query
     * @return
     */
    @Transactional(readOnly=true)
	public List<HappyHostPostModel> queryHappyHostPostInfoById(QueryModel query)
	{
    	return appDAO.queryHappyHostPostInfoById(query);
	}

    
    /**
     * 描述信息：加载快乐驿站回复 分页
     * 创建时间：2015年5月27日 上午6:48:22
     * @author WCL (ln_admin@yeah.net)
     * @param query
     * @return
     */
    @Transactional(readOnly=true)
	public List<HappyHostReplyModel> queryHappyHostReplyInfo(QueryModel query)
	{
    	return appDAO.queryHappyHostReplyInfo(query);
	}
    
    /**
     * 描述信息：增中话题
     * 创建时间：2015年5月28日 上午11:57:50
     * @author WCL (ln_admin@yeah.net)
     * @param model
     * @return
     */
    public int addHappyHostPostInfo(HappyHostPostModel model)
	{
		// 修改圈子发帖数
    	appDAO.modifyHappyHost(model);
    	
    	// 增加话题
    	return appDAO.addHappyHostPostInfo(model);
	}
    
    /**
     * 描述信息：处理点赞操作
     * 创建时间：2015年5月28日 下午2:22:25
     * @author WCL (ln_admin@yeah.net)
     * @param model
     * @return
     */
    public int addHappyHostLaudIinfo(HappyHostLaudModel model)
	{
    	int nRet = 0;
		// 修改话题表点赞数
    	appDAO.modifyHappyHostPostLaudInfo(model);
    	
    	// 删除点赞记录
    	nRet = appDAO.delHappyHostLaudIinfo(model);
    	
    	// 增加点赞记录
    	if (model.getFlag() == 1)
		{
    		appDAO.delHappyHostLaudIinfo(model);
    		nRet = appDAO.addHappyHostLaudIinfo(model);
		}
    	return nRet;
	}
    
    
    /**
     * 描述信息：增加回复记录
     * 创建时间：2015年5月28日 下午2:36:39
     * @author WCL (ln_admin@yeah.net)
     * @param model
     * @return
     */
    public int addHappyHostReplyInfo(HappyHostReplyModel model)
	{
    	// 修改回复数
    	appDAO.modifyHappyHostPostReplyInfo(model);
    	
		return appDAO.addHappyHostReplyInfo(model);
	}

    
    /**
     * 描述信息：加载增加记录
     * 创建时间：2015年5月28日 下午5:36:50
     * @author WCL (ln_admin@yeah.net)
     * @param model
     * @return
     */
    @Transactional(readOnly=true)
	public List<HappyHostReplyModel> queryHappyHostReplyInfoById(HappyHostReplyModel model)
	{
    	return appDAO.queryHappyHostReplyInfoById(model);
	}
}
