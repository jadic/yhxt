package com.gesoft.dao;

import org.springframework.stereotype.Repository;

import com.gesoft.common.EntityDAOImpl;
import com.gesoft.model.CircleModuleModel;

/**
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
@Repository
public class ACircleModuleDAO extends EntityDAOImpl<CircleModuleModel, Long>
{
	@Override
    public String getMybatisSqlMapNamespace()
    {
        return "CircleModuleMapper";
    }
}
