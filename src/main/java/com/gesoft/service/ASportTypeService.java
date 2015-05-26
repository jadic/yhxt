package com.gesoft.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gesoft.common.EntityDAO;
import com.gesoft.common.EntityService;
import com.gesoft.dao.ASportTypeDAO;
import com.gesoft.model.SportTypeModel;

@Service
@Transactional
public class ASportTypeService extends EntityService<SportTypeModel, Long>
{
	@Resource
	private ASportTypeDAO aSportTypeDAO;
	

	@Override
	protected EntityDAO<SportTypeModel, Long> getEntityDao()
	{
		return this.aSportTypeDAO;
	}
}
