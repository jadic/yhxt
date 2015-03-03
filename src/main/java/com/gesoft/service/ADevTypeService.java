/**
 * 文件名称：ADevTypeService.java
 * 版权所有：Copyright gesoft
 * 创建时间：2015年2月2日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gesoft.common.EntityDAO;
import com.gesoft.common.EntityService;
import com.gesoft.dao.ADevTypeDAO;
import com.gesoft.model.DevTypeModel;

/**
 * 设备类型管理
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
@Service
@Transactional
public class ADevTypeService extends EntityService<DevTypeModel, Long>
{
	@Resource
	private ADevTypeDAO aDevTypeDAO;
	

	@Override
	protected EntityDAO<DevTypeModel, Long> getEntityDao()
	{
		return this.aDevTypeDAO;
	}
}
