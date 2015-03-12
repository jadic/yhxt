/**
 * 文件名称：NSearchService.java
 * 版权所有：Copyright njty
 * 创建时间：2015年3月12日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gesoft.common.EntityDAO;
import com.gesoft.common.EntityService;
import com.gesoft.dao.NSearchDAO;
import com.gesoft.model.BaseModel;

/**
 * 医护人员平台
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
@Service
@Transactional
public class NSearchService extends EntityService<BaseModel, Long>
{
	@Resource
	private NSearchDAO nSearchDAO;

	@Override
	protected EntityDAO<BaseModel, Long> getEntityDao()
	{
		return this.nSearchDAO;
	}
}
