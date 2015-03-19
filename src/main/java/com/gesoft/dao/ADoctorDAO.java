/**
 * 文件名称：AUserDAO.java
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
import com.gesoft.model.HospitalDeptModel;
import com.gesoft.model.HospitalModel;

/**
 * 医生管理
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
@Repository
public class ADoctorDAO extends EntityDAOImpl<DoctorModel, Long>
{
	@Override
    public String getMybatisSqlMapNamespace()
    {
        return "DoctorMapper";
    }
	
	public List<HospitalModel> queryHospitals(DoctorModel model) {
	    return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryHospitals", model);
	}
	
	public List<HospitalDeptModel> queryHospitalDepts(DoctorModel model) {
	    return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryHospitalDepts", model);
	}
}
