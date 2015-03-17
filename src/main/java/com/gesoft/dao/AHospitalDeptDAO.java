package com.gesoft.dao;

import org.springframework.stereotype.Repository;

import com.gesoft.common.EntityDAOImpl;
import com.gesoft.model.HospitalDeptModel;

@Repository
public class AHospitalDeptDAO extends EntityDAOImpl<HospitalDeptModel, Long> {
    
    @Override
    public String getMybatisSqlMapNamespace()
    {
        return "HospitalDeptMapper";
    }

}
