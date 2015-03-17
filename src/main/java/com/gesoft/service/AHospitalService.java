package com.gesoft.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gesoft.common.EntityDAO;
import com.gesoft.common.EntityService;
import com.gesoft.dao.AHospitalDAO;
import com.gesoft.model.HospitalModel;

@Service
@Transactional
public class AHospitalService extends EntityService<HospitalModel, Long> {
    
    @Resource
    private AHospitalDAO aHospitalDao;

    @Override
    protected EntityDAO<HospitalModel, Long> getEntityDao() {
        return this.aHospitalDao;
    }

}
