package com.gesoft.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gesoft.common.EntityDAO;
import com.gesoft.common.EntityService;
import com.gesoft.dao.AHospitalDeptDAO;
import com.gesoft.model.HospitalDeptModel;

@Service
@Transactional
public class AHospitalDeptService extends EntityService<HospitalDeptModel, Long> {
    
    @Resource
    private AHospitalDeptDAO aHospitalDeptDao;

    @Override
    protected EntityDAO<HospitalDeptModel, Long> getEntityDao() {
        return this.aHospitalDeptDao;
    }

}
