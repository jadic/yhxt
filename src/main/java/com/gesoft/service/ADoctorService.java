/**
 * 文件名称：AUserService.java
 * 版权所有：Copyright gesoft
 * 创建时间：2015年2月2日
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
import com.gesoft.dao.ADoctorDAO;
import com.gesoft.model.DoctorModel;
import com.gesoft.model.HospitalDeptModel;
import com.gesoft.model.HospitalModel;

/**
 * 医生管理
 * 
 * @author WCL
 * @version v1.001
 * @since v1.001
 */
@Service
@Transactional
public class ADoctorService extends EntityService<DoctorModel, Long> {
    @Resource
    private ADoctorDAO aDoctorDAO;

    @Override
    protected EntityDAO<DoctorModel, Long> getEntityDao() {
        return this.aDoctorDAO;
    }

    public List<HospitalModel> queryHospitals(DoctorModel model) {
        return this.aDoctorDAO.queryHospitals(model);
    }

    public List<HospitalDeptModel> queryHospitalDepts(DoctorModel model) {
        return this.aDoctorDAO.queryHospitalDepts(model);
    }

}
