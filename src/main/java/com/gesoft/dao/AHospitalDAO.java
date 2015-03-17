package com.gesoft.dao;

import org.springframework.stereotype.Repository;

import com.gesoft.common.EntityDAOImpl;
import com.gesoft.model.HospitalModel;

@Repository
public class AHospitalDAO extends EntityDAOImpl<HospitalModel, Long> {
    
    @Override
    public String getMybatisSqlMapNamespace()
    {
        return "HospitalMapper";
    }

}
