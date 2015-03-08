/**
 * 文件名称：PQueryService.java
 * 版权所有：Copyright njty
 * 创建时间：2015年3月5日
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
import com.gesoft.dao.PQueryDAO;
import com.gesoft.model.BaseModel;
import com.gesoft.model.DeviceModel;
import com.gesoft.model.OutModel;
import com.gesoft.model.QueryModel;
import com.gesoft.model.ServiceModel;

/**
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
@Service
@Transactional
public class PQueryService extends EntityService<BaseModel, Long>
{
	@Resource
	private PQueryDAO pQueryDAO;
	

	@Override
	protected EntityDAO<BaseModel, Long> getEntityDao()
	{
		return this.pQueryDAO;
	}
	
	/**
	 * 描述信息：加载建议最新一条
	 * 创建时间：2015年3月5日 上午8:48:44
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public OutModel queryAdviceInfo(QueryModel model)
	{
		return pQueryDAO.queryAdviceInfo(model);
	}
	
	/**
	 * 描述信息：查询建议执行记录总数
	 * 创建时间：2015年3月5日 上午8:58:02
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public long queryAdvicePerformaceCnt(QueryModel model)
	{
		return pQueryDAO.queryAdvicePerformaceCnt(model);
	}
	
	
	/**
	 * 描述信息：查询建议执行记录
	 * 创建时间：2015年3月5日 上午8:58:02
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<OutModel> queryAdvicePerformace(QueryModel model)
	{
		return pQueryDAO.queryAdvicePerformace(model);
	}
	
	
	/**
	 * 描述信息：查询我的服务总数
	 * 创建时间：2015年3月5日 上午9:23:34
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public long queryServiceInfoCnt(QueryModel model)
	{
		return pQueryDAO.queryServiceInfoCnt(model);
	}
	
	
	/**
	 * 描述信息：分页加载我的服务数据
	 * 创建时间：2015年3月5日 上午9:23:39
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<ServiceModel> queryServiceInfo(QueryModel model)
	{
		return pQueryDAO.queryServiceInfo(model);
	}
	
	
	/**
	 * 描述信息：购买服务
	 * 创建时间：2015年3月8日 上午10:18:38
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public int modifyBuyServiceInfo(ServiceModel model)
	{
		return pQueryDAO.modifyBuyServiceInfo(model);
	}
	
	/**
	 * 描述信息：购买设备
	 * 创建时间：2015年3月8日 上午10:19:06
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public int modifyBuyDeviceInfo(DeviceModel model)
	{
		return pQueryDAO.modifyBuyDeviceInfo(model);
	}
	
	/**
	 * 描述信息：查询我的设备总数
	 * 创建时间：2015年3月5日 上午9:28:48
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public long queryDeviceInfoCnt(QueryModel model)
	{
		return pQueryDAO.queryDeviceInfoCnt(model);
	}
	
	
	/**
	 * 描述信息：分页查询我的设备数据
	 * 创建时间：2015年3月5日 上午9:29:10
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<DeviceModel> queryDeviceInfo(QueryModel model)
	{
		return pQueryDAO.queryDeviceInfo(model);
	}
	
}
