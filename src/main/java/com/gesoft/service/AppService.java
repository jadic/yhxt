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
import com.gesoft.model.DoctorAdviceModel;
import com.gesoft.model.DoctorAdvicePerformanceModel;
import com.gesoft.model.EarTemperatureModel;
import com.gesoft.model.FoodItemModel;
import com.gesoft.model.QueryModel;
import com.gesoft.model.RelativePhoneModel;
import com.gesoft.model.ServiceModel;
import com.gesoft.model.SportItemModel;
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
}
