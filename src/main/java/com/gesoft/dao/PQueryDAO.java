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
import com.gesoft.model.RelativePhoneModel;
import com.gesoft.model.ServiceModel;
import com.gesoft.model.UserModel;

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
	
	
	/**
	 * 描述信息：修改用户密码
	 * 创建时间：2015年3月8日 上午11:08:36
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public int modifyUserPwdInfo(UserModel model)
	{
		return getSqlSession().update(getMybatisSqlMapNamespace() + ".modifyUserPwdInfo", model);
	}
	

	/**
	 * 描述信息：查询我的亲情号码总数
	 * 创建时间：2015年3月5日 上午9:28:48
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public long queryRelativePhoneInfoCnt(QueryModel model)
	{
		return (Long)getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryRelativePhoneInfoCnt", model);
	}
	
	
	/**
	 * 描述信息：分页查询我的亲情号码数据
	 * 创建时间：2015年3月5日 上午9:29:10
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public List<RelativePhoneModel> queryRelativePhoneInfo(QueryModel model)
	{
		return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryRelativePhoneInfo", model);
	}
	
	
	/**
	 * 描述信息：根据ID来加载亲情数据
	 * 创建时间：2015年3月8日 下午4:26:17
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public RelativePhoneModel queryRelativePhoneInfoById(QueryModel model)
	{
		return getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryRelativePhoneInfoById", model);
	}
	
	
	/**
	 * 描述信息：增加亲情号码
	 * 创建时间：2015年3月8日 下午4:09:44
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public int addRelativePhoneInfo(RelativePhoneModel model)
	{
		return getSqlSession().insert(getMybatisSqlMapNamespace() + ".addRelativePhoneInfo", model);
	}
	
	
	/**
	 * 描述信息：修改亲情号码
	 * 创建时间：2015年3月8日 下午4:10:09
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public int modifyRelativePhoneInfo(RelativePhoneModel model)
	{
		return getSqlSession().update(getMybatisSqlMapNamespace() + ".modifyRelativePhoneInfo", model);
	}
	
	
	/**
	 * 描述信息：删除亲情号码
	 * 创建时间：2015年3月8日 下午4:08:02
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public int delRelativePhoneInfo(RelativePhoneModel model)
	{
		return getSqlSession().delete(getMybatisSqlMapNamespace() + ".delRelativePhoneInfo", model);
	}
	

	/**
	 * 描述信息：加载用户基本信息
	 * 创建时间：2015年3月8日 下午6:02:33
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public UserModel queryUserBaseInfo(QueryModel model)
	{
		return getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryUserBaseInfo", model);
	}
	
	/**
	 * 描述信息：删除用户基本数据
	 * 创建时间：2015年3月8日 下午6:07:18
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public int delUserBaseInfo(UserModel model)
	{
		return getSqlSession().delete(getMybatisSqlMapNamespace() + ".delUserBaseInfo", model);
	}
	
	/**
	 * 描述信息：增加用户基本信息
	 * 创建时间：2015年3月8日 下午6:08:19
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public long addUserBaseInfo(UserModel model)
	{
		return getSqlSession().insert(getMybatisSqlMapNamespace() + ".addUserBaseInfo", model);
	}
}
