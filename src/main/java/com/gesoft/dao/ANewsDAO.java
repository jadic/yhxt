package com.gesoft.dao;

import org.springframework.stereotype.Repository;

import com.gesoft.common.EntityDAOImpl;
import com.gesoft.model.NewsModel;

@Repository
public class ANewsDAO extends EntityDAOImpl<NewsModel, Long>
{
	@Override
    public String getMybatisSqlMapNamespace()
    {
        return "NewsMapper";
    }
}
