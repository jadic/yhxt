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
import com.gesoft.model.DoctorAdviceModel;
import com.gesoft.model.DoctorAdvicePerformanceModel;
import com.gesoft.model.QueryModel;
import com.gesoft.model.RelativePhoneModel;
import com.gesoft.model.ServiceModel;
import com.gesoft.model.UserModel;

/**
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
@Repository
public class AppDAO extends EntityDAOImpl<BaseModel, Long>
{
	@Override
    public String getMybatisSqlMapNamespace()
    {
        return "AppMapper";
    }
	
	/**
	 * 描述信息：查询亲情号码总数
	 * 创建时间：2015年3月8日 上午7:39:26
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public long queryRelativePhoneInfoCnt(QueryModel model)
	{
		return (Long)getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryRelativePhoneInfoCnt", model);
	}
	
	/**
	 * 描述信息：分页查询亲情号码
	 * 创建时间：2015年3月8日 上午7:39:26
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public List<RelativePhoneModel> queryRelativePhoneInfo(QueryModel model)
	{
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
	
	public long queryServiceCnt(QueryModel model)
    {
        return (Long)getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryServiceCnt", model);
    }
    
    public List<ServiceModel> queryService(QueryModel model)
    {
        return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryService", model);
    }
    
    public long queryActivityCnt(QueryModel model)
    {
        return (Long)getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryActivityCnt", model);
    }
    
    public List<ActivityModel> queryActivity(QueryModel model)
    {
        return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryActivity", model);
    }
    
    public long queryDoctorAdviceCnt(QueryModel model)
    {
        return (Long)getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryDoctorAdviceCnt", model);
    }
    
    public List<DoctorAdviceModel> queryDoctorAdvice(QueryModel model)
    {
        return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryDoctorAdvice", model);
    }
    
    public long queryDoctorAdvicePerformanceCnt(QueryModel model)
    {
        return (Long)getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryDoctorAdvicePerformanceCnt", model);
    }
    
    public List<DoctorAdvicePerformanceModel> queryDoctorAdvicePerformance(QueryModel model)
    {
        return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryDoctorAdvicePerformance", model);
    }
    
    public String queryServiceDetail(QueryModel model)
    {
        return getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryServiceDetail", model);
    }
    
    public String queryActivityDetail(QueryModel model)
    {
        return getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryActivityDetail", model);
    }
}
