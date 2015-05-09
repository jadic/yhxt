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
import com.gesoft.model.DeleteRecordModel;
import com.gesoft.model.DoctorAdviceModel;
import com.gesoft.model.DoctorAdvicePerformanceModel;
import com.gesoft.model.EarTemperatureModel;
import com.gesoft.model.FoodItemModel;
import com.gesoft.model.MealResultModel;
import com.gesoft.model.MentalStatusModel;
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
}
