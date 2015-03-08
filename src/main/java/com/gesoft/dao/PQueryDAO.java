/**
 * 文件名称：PQueryDAO.java
 * 版权所有：Copyright njty
 * 创建时间：2015年3月5日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.gesoft.common.EntityDAOImpl;
import com.gesoft.model.BaseModel;
import com.gesoft.model.DeviceModel;
import com.gesoft.model.OutModel;
import com.gesoft.model.QueryModel;
import com.gesoft.model.ServiceModel;

/**
 * 用户平台查询
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
@Repository
public class PQueryDAO extends EntityDAOImpl<BaseModel, Long>
{

	@Override
    public String getMybatisSqlMapNamespace()
    {
        return "QueryMapper";
    }
	

	/**
	 * 描述信息：加载最新一条
	 * 创建时间：2015年3月5日 上午8:48:44
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public OutModel queryAdviceInfo(QueryModel model)
	{
		return getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryAdviceInfo", model);
	}
	
	/**
	 * 描述信息：查询建议执行记录总数
	 * 创建时间：2015年3月5日 上午8:58:02
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public long queryAdvicePerformaceCnt(QueryModel model)
	{
		return (Long)getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryAdvicePerformaceCnt", model);
	}
	
	
	/**
	 * 描述信息：查询建议执行记录
	 * 创建时间：2015年3月5日 上午8:58:02
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public List<OutModel> queryAdvicePerformace(QueryModel model)
	{
		return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryAdvicePerformace", model);
	}
	

	
	/**
	 * 描述信息：查询我的服务总数
	 * 创建时间：2015年3月5日 上午9:23:34
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public long queryServiceInfoCnt(QueryModel model)
	{
		return (Long)getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryServiceInfoCnt", model);
	}
	
	
	/**
	 * 描述信息：分页加载我的服务数据
	 * 创建时间：2015年3月5日 上午9:23:39
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public List<ServiceModel> queryServiceInfo(QueryModel model)
	{
		return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryServiceInfo", model);
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
		return getSqlSession().update(getMybatisSqlMapNamespace() + ".modifyBuyServiceInfo", model);
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
		return getSqlSession().update(getMybatisSqlMapNamespace() + ".modifyBuyDeviceInfo", model);
	}

	
	/**
	 * 描述信息：查询我的设备总数
	 * 创建时间：2015年3月5日 上午9:28:48
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public long queryDeviceInfoCnt(QueryModel model)
	{
		return (Long)getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryDeviceInfoCnt", model);
	}
	
	
	/**
	 * 描述信息：分页查询我的设备数据
	 * 创建时间：2015年3月5日 上午9:29:10
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public List<DeviceModel> queryDeviceInfo(QueryModel model)
	{
		return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryDeviceInfo", model);

	}
}
