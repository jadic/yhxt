package com.gesoft.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gesoft.common.EntityDAO;
import com.gesoft.common.EntityService;
import com.gesoft.dao.ANewsDAO;
import com.gesoft.model.NewsModel;

@Service
@Transactional
public class ANewsService extends EntityService<NewsModel, Long>
{
	@Resource
	private ANewsDAO aNewsDAO;
	

	@Override
	protected EntityDAO<NewsModel, Long> getEntityDao()
	{
		return this.aNewsDAO;
	}
}
