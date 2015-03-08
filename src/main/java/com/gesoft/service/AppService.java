/**
 * 文件名称：AppService.java
 * 版权所有：Copyright njty
 * 创建时间：2015年3月8日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gesoft.common.EntityDAO;
import com.gesoft.common.EntityService;
import com.gesoft.dao.AppDAO;
import com.gesoft.model.BaseModel;
import com.gesoft.model.QueryModel;
import com.gesoft.model.RelativePhoneModel;

/**
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
@Service
@Transactional
public class AppService extends EntityService<BaseModel, Long>
{

	@Resource
	private AppDAO appDAO;
	

	@Override
	protected EntityDAO<BaseModel, Long> getEntityDao()
	{
		return this.appDAO;
	}

	/**
	 * 描述信息：查询亲情号码总数
	 * 创建时间：2015年3月8日 上午7:39:26
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public long queryRelativePhoneInfoCnt(QueryModel model)
	{
		return appDAO.queryRelativePhoneInfoCnt(model);
	}
	
	/**
	 * 描述信息：分页查询亲情号码
	 * 创建时间：2015年3月8日 上午7:39:26
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<RelativePhoneModel> queryRelativePhoneInfo(QueryModel model)
	{
		return appDAO.queryRelativePhoneInfo(model);
	}
}