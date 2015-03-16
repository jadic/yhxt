/**
 * 文件名称：AServiceDAO.java
 * 版权所有：Copyright gesoft
 * 创建时间：2015年2月2日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.gesoft.common.EntityDAOImpl;
import com.gesoft.model.DoctorModel;
import com.gesoft.model.QueryModel;
import com.gesoft.model.ServiceModel;

/**
 * 服务管理
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
@Repository
public class AServiceDAO extends EntityDAOImpl<ServiceModel, Long>
{
	@Override
    public String getMybatisSqlMapNamespace()
    {
        return "ServiceMapper";
    }
	
	public List<DoctorModel> queryDoctors(QueryModel model) {
        return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryDoctors", model);
    }
	
	public List<DoctorModel> queryAssociatedDoctorIds(QueryModel model) {
	    return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryAssociatedDoctorIds", model);
	}
	
	public int deleteDoctorAssociation(QueryModel model) {
	    return getSqlSession().delete(getMybatisSqlMapNamespace() + ".deleteDoctorAssociation", model);
	}
	
	public int addDoctorAssociation(QueryModel model) {
	    return getSqlSession().insert(getMybatisSqlMapNamespace() + ".addDoctorAssociation", model);
	}
}
