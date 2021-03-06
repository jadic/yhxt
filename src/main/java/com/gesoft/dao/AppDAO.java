/**
 * 文件名称：AppDAO.java
 * 版权所有：Copyright njty
 * 创建时间：2015年3月8日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.gesoft.common.EntityDAOImpl;
import com.gesoft.model.ActivityModel;
import com.gesoft.model.BaseModel;
import com.gesoft.model.BloodGlucoseModel;
import com.gesoft.model.BloodOxygenModel;
import com.gesoft.model.BloodPressureModel;
import com.gesoft.model.DeleteRecordModel;
import com.gesoft.model.DoctorAdviceModel;
import com.gesoft.model.DoctorAdvicePerformanceModel;
import com.gesoft.model.ECGModel;
import com.gesoft.model.EarTemperatureModel;
import com.gesoft.model.FoodItemModel;
import com.gesoft.model.HappyHostLaudModel;
import com.gesoft.model.HappyHostModel;
import com.gesoft.model.HappyHostPostModel;
import com.gesoft.model.HappyHostReplyModel;
import com.gesoft.model.HappyHostReportModel;
import com.gesoft.model.MealResultModel;
import com.gesoft.model.MentalStatusModel;
import com.gesoft.model.MentalTestModel;
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
@Repository
public class AppDAO extends EntityDAOImpl<BaseModel, Long> {
    @Override
    public String getMybatisSqlMapNamespace() {
        return "AppMapper";
    }

    /**
     * 描述信息：查询亲情号码总数 创建时间：2015年3月8日 上午7:39:26
     * 
     * @author WCL (ln_admin@yeah.net)
     * @param model
     * @return
     */
    public long queryRelativePhoneInfoCnt(QueryModel model) {
        return (Long) getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryRelativePhoneInfoCnt", model);
    }

    /**
     * 描述信息：分页查询亲情号码 创建时间：2015年3月8日 上午7:39:26
     * 
     * @author WCL (ln_admin@yeah.net)
     * @param model
     * @return
     */
    public List<RelativePhoneModel> queryRelativePhoneInfo(QueryModel model) {
        return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryRelativePhoneInfo", model);
    }

    public List<UserModel> queryUserInfoWithUserNamePass(QueryModel model) {
        return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryUserInfoWithUserNamePass", model);
    }

    public List<UserModel> queryUserInfoWithUserId(QueryModel model) {
        return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryUserInfoWithUserId", model);
    }

    public List<UserModel> queryMyNurserWithUserId(QueryModel model) {
        return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryMyNurserWithUserId", model);
    }

    public long queryServiceCnt(QueryModel model) {
        return (Long) getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryServiceCnt", model);
    }

    public List<ServiceModel> queryService(QueryModel model) {
        return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryService", model);
    }

    public long queryActivityCnt(QueryModel model) {
        return (Long) getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryActivityCnt", model);
    }

    public List<ActivityModel> queryActivity(QueryModel model) {
        return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryActivity", model);
    }

    public long queryNewsCnt(QueryModel model) {
        return (Long) getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryNewsCnt", model);
    }
    
    public List<NewsModel> queryNews(QueryModel model) {
        return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryNews", model);
    }
    
    public long queryDoctorAdviceCnt(QueryModel model) {
        return (Long) getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryDoctorAdviceCnt", model);
    }

    public List<DoctorAdviceModel> queryDoctorAdvice(QueryModel model) {
        return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryDoctorAdvice", model);
    }

    public long queryDoctorAdvicePerformanceCnt(QueryModel model) {
        return (Long) getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryDoctorAdvicePerformanceCnt", model);
    }

    public List<DoctorAdvicePerformanceModel> queryDoctorAdvicePerformance(QueryModel model) {
        return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryDoctorAdvicePerformance", model);
    }

    public String queryServiceDetail(QueryModel model) {
        return getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryServiceDetail", model);
    }

    public String queryActivityDetail(QueryModel model) {
        return getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryActivityDetail", model);
    }
    
    public String queryNewsDetail(QueryModel model) {
        return getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryNewsDetail", model);
    }

    public long queryEarTemperatureId(EarTemperatureModel model) {
        return getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryEarTemperatureId", model);
    }

    public int insertEarTemperature(EarTemperatureModel model) {
        return getSqlSession().insert(getMybatisSqlMapNamespace() + ".insertEarTemperature", model);
    }

    public long queryBloodGlucoseId(BloodGlucoseModel model) {
        return getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryBloodGlucoseId", model);
    }

    public int insertBloodGlucose(BloodGlucoseModel model) {
        return getSqlSession().insert(getMybatisSqlMapNamespace() + ".insertBloodGlucose", model);
    }

    public int updateBloodGlucose(BloodGlucoseModel model) {
        return getSqlSession().update(getMybatisSqlMapNamespace() + ".updateBloodGlucose", model);
    }
    
    public long queryBloodPressureId(BloodPressureModel model) {
        return getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryBloodPressureId", model);
    }
    
    public int insertBloodPressure(BloodPressureModel model) {
        return getSqlSession().insert(getMybatisSqlMapNamespace() + ".insertBloodPressure", model);
    }
    
    public String getSportItemVersion(QueryModel model) {
        return getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".getSportItemVersion", model);
    }

    public String getFoodItemVersion(QueryModel model) {
        return getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".getFoodItemVersion", model);
    }

    public int getSportItemsCnt(QueryModel model) {
        return getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".getSportItemsCnt", model);
    }
    
    public List<SportItemModel> getSportItems(QueryModel model) {
        return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".getSportItems", model);
    }
    
    public int getFoodItemsCnt(QueryModel model) {
        return getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".getFoodItemsCnt", model);
    }

    public List<FoodItemModel> getFoodItems(QueryModel model) {
        return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".getFoodItems", model);
    }
    
    public int insertSportResult(SportResultModel model) {
        return getSqlSession().insert(getMybatisSqlMapNamespace() + ".insertSportResult", model);
    }
    
    public int insertMealResult(MealResultModel model) {
        return getSqlSession().insert(getMybatisSqlMapNamespace() + ".insertMealResult", model);
    }
    
    public int insertMentalStatus(MentalStatusModel model) {
        return getSqlSession().insert(getMybatisSqlMapNamespace() + ".insertMentalStatus", model);
    }
    
    public int deleteRecords(DeleteRecordModel model) {
        switch (model.getFlag()) {
        case 1:
            return getSqlSession().delete(getMybatisSqlMapNamespace() + ".deleteSportResult", model);
        case 2:
            return getSqlSession().delete(getMybatisSqlMapNamespace() + ".deleteMealResult", model);
        case 3:
            return getSqlSession().delete(getMybatisSqlMapNamespace() + ".deleteMentalStatus", model);
        default:
            break;
        }
        return -1;
    }
    
    /**
     * 描述信息：加载快乐驿站圈子总数
     * 创建时间：2015年5月27日 上午6:48:22
     * @author WCL (ln_admin@yeah.net)
     * @param query
     * @return
     */
	public long queryHappyHostInfoCnt(QueryModel query)
	{
		return getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryHappyHostInfoCnt", query);
	}

    
    
    /**
     * 描述信息：加载快乐驿站圈子 分页
     * 创建时间：2015年5月27日 上午6:48:22
     * @author WCL (ln_admin@yeah.net)
     * @param query
     * @return
     */
	public List<HappyHostModel> queryHappyHostInfo(QueryModel query)
	{
		return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryHappyHostInfo", query);
	}

    
    /**
     * 描述信息：加载快乐驿站话题总数
     * 创建时间：2015年5月27日 上午6:48:22
     * @author WCL (ln_admin@yeah.net)
     * @param query
     * @return
     */
	public long queryHappyHostPostInfoCnt(QueryModel query)
	{
		return getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryHappyHostPostInfoCnt", query);
	}

    
    /**
     * 描述信息：加载快乐驿站话题 分页
     * 创建时间：2015年5月27日 上午6:48:22
     * @author WCL (ln_admin@yeah.net)
     * @param query
     * @return
     */
	public List<HappyHostPostModel> queryHappyHostPostInfo(QueryModel query)
	{
		return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryHappyHostPostInfo", query);
	}
	 /**
     * 描述信息：加载快乐驿站话题 分页
     * 创建时间：2015年5月27日 上午6:48:22
     * @author WCL (ln_admin@yeah.net)
     * @param query
     * @return
     */
	public List<HappyHostPostModel> queryHappyHostZrPostInfo(QueryModel query)
	{
		return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryHappyHostZrPostInfo", query);
	}
    
    /**
     * 描述信息：加载快乐驿站回复总数
     * 创建时间：2015年5月27日 上午6:48:22
     * @author WCL (ln_admin@yeah.net)
     * @param query
     * @return
     */
	public List<HappyHostPostModel> queryHappyHostPostInfoById(QueryModel query)
	{
		return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryHappyHostPostInfoById", query);
	}

    
    /**
     * 描述信息：加载快乐驿站回复 分页
     * 创建时间：2015年5月27日 上午6:48:22
     * @author WCL (ln_admin@yeah.net)
     * @param query
     * @return
     */
	public List<HappyHostReplyModel> queryHappyHostReplyInfo(QueryModel query)
	{
		return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryHappyHostReplyInfo", query);
	}

	/**
	 * 描述信息：修改圈子 里的话题数
	 * 创建时间：2015年5月28日 上午11:59:51
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 */
	public void modifyHappyHost(HappyHostPostModel model)
	{
		getSqlSession().update(getMybatisSqlMapNamespace() + ".modifyHappyHost", model);
	}

	
	/**
	 * 描述信息：增加话题
	 * 创建时间：2015年5月28日 下午12:00:43
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public int addHappyHostPostInfo(HappyHostPostModel model)
	{
		return getSqlSession().insert(getMybatisSqlMapNamespace() + ".addHappyHostPostInfo", model);
	}

	
	/**
	 * 描述信息：修改话题表中的点赞
	 * 创建时间：2015年5月28日 下午2:26:01
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 */
	public int modifyHappyHostPostLaudInfo(HappyHostLaudModel model)
	{
		return getSqlSession().update(getMybatisSqlMapNamespace() + ".modifyHappyHostPostLaudInfo", model);
	}

	/**
	 * 描述信息：增加点赞记录
	 * 创建时间：2015年5月28日 下午2:26:19
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public int addHappyHostLaudIinfo(HappyHostLaudModel model)
	{
		return getSqlSession().insert(getMybatisSqlMapNamespace() + ".addHappyHostLaudIinfo", model);
	}

	
	/**
	 * 描述信息：删除点赞记录
	 * 创建时间：2015年5月28日 下午2:26:37
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public int delHappyHostLaudIinfo(HappyHostLaudModel model)
	{
		return getSqlSession().delete(getMybatisSqlMapNamespace() + ".delHappyHostLaudIinfo", model);
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
		return getSqlSession().insert(getMybatisSqlMapNamespace() + ".addHappyHostReplyInfo", model);
	}
    
    /**
     * 描述信息：加载增加记录
     * 创建时间：2015年5月28日 下午5:36:50
     * @author WCL (ln_admin@yeah.net)
     * @param model
     * @return
     */
	public List<HappyHostReplyModel> queryHappyHostReplyInfoById(HappyHostReplyModel model)
	{
		return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryHappyHostReplyInfoById", model);
	}

	
	/**
	 * 描述信息：增加回复数
	 * 创建时间：2015年5月28日 下午6:09:32
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 */
	public int modifyHappyHostPostReplyInfo(HappyHostReplyModel model)
	{
		return getSqlSession().update(getMybatisSqlMapNamespace() + ".modifyHappyHostPostReplyInfo", model);
	}

	/**
	 * 描述信息：举报
	 * 创建时间：2015年6月2日 下午3:29:52
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public long addHappyHostReportInfo(HappyHostReportModel model)
	{
		return getSqlSession().insert(getMybatisSqlMapNamespace() + ".addHappyHostReportInfo", model);
	}
	
	/**
	 * 增加心电记录
	 * @param model
	 * @return
	 */
	public int addEGCRecord(ECGModel model) {
        return getSqlSession().insert(getMybatisSqlMapNamespace() + ".addECGRecord", model);
    }
	
	/**
	 * 增加血氧记录
	 * @param model
	 * @return
	 */
	public int addBloodOxygenRecord(BloodOxygenModel model) {
	    return getSqlSession().insert(getMybatisSqlMapNamespace() + ".addBloodOxygenRecord", model);
	}

	/**
	 * 增加心理测试记录
	 * @param model
	 * @return
	 */
	public int addMentalTestRecord(MentalTestModel model) {
	    return getSqlSession().insert(getMybatisSqlMapNamespace() + ".addMentalTestRecord", model);
	}
}
