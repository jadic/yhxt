package com.gesoft.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gesoft.common.EntityDAO;
import com.gesoft.common.EntityService;
import com.gesoft.dao.ACircleModuleDAO;
import com.gesoft.model.CircleModuleModel;

@Service
@Transactional
public class ACircleModuleService extends EntityService<CircleModuleModel, Long>
{
	@Resource
	private ACircleModuleDAO aCircleModuleDAO;
	

	@Override
	protected EntityDAO<CircleModuleModel, Long> getEntityDao()
	{
		return this.aCircleModuleDAO;
	}
}
