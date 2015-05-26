package com.gesoft.dao;

import org.springframework.stereotype.Repository;

import com.gesoft.common.EntityDAOImpl;
import com.gesoft.model.SportTypeModel;

/**
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
@Repository
public class ASportTypeDAO extends EntityDAOImpl<SportTypeModel, Long>
{
	@Override
    public String getMybatisSqlMapNamespace()
    {
        return "SportTypeMapper";
    }
}
