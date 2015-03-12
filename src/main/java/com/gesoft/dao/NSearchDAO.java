/**
 * 文件名称：NSearchDAO.java
 * 版权所有：Copyright njty
 * 创建时间：2015年3月12日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.gesoft.common.EntityDAOImpl;
import com.gesoft.model.ActivityModel;
import com.gesoft.model.BaseModel;
import com.gesoft.model.QueryModel;
import com.gesoft.model.RelativePhoneModel;
import com.gesoft.model.ServiceModel;
import com.gesoft.model.UserModel;

/**
 * 医护平台
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
@Repository
public class NSearchDAO extends EntityDAOImpl<BaseModel, Long>
{

	@Override
    public String getMybatisSqlMapNamespace()
    {
        return "SearchMapper";
    }

	
	/**
	 * 描述信息：首页加载医护人员的用户信息
	 * 创建时间：2015年3月12日 上午9:31:37
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public List<UserModel> queryUserListInfo(RelativePhoneModel model)
	{
		return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryUserListInfo", model);
	}

	
	/**
	 * 描述信息：查询活动总数
	 * 创建时间：2015年3月12日 上午9:32:22
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public long queryActivityInfoCnt(QueryModel model)
	{
		return getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryActivityInfoCnt", model);
	}


	/**
	 * 描述信息：分页查询活动信息
	 * 创建时间：2015年3月12日 上午9:34:23
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public List<ActivityModel> queryActivityInfo(QueryModel model)
	{
		return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryActivityInfo", model);
	}

	
	/**
	 * 描述信息：根所ID来加载用户信息
	 * 创建时间：2015年3月12日 上午9:34:17
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public ActivityModel queryActivityInfoById(QueryModel model)
	{
		return getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryActivityInfoById", model);
	}

	
	
	/**
	 * 描述信息：增加活动数据
	 * 创建时间：2015年3月12日 上午9:33:20
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public int addActivityInfo(ActivityModel model)
	{
		return getSqlSession().insert(getMybatisSqlMapNamespace() + ".addActivityInfo", model);
	}

	
	/**
	 * 描述信息：修改活动数据
	 * 创建时间：2015年3月12日 上午9:33:11
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public int modifyActivityInfo(ActivityModel model)
	{
		return getSqlSession().update(getMybatisSqlMapNamespace() + ".modifyActivityInfo", model);
	}

	
	/**
	 * 描述信息：删除活动数据
	 * 创建时间：2015年3月12日 上午9:33:06
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public int delActivityInfo(ActivityModel model)
	{
		return getSqlSession().delete(getMybatisSqlMapNamespace() + ".delActivityInfo", model);
	}
	

	
	/**
	 * 描述信息：查询服务总数
	 * 创建时间：2015年3月12日 上午9:32:22
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public long queryServiceInfoCnt(QueryModel model)
	{
		return getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryServiceInfoCnt", model);
	}


	/**
	 * 描述信息：分页查询服务信息
	 * 创建时间：2015年3月12日 上午9:34:23
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public List<ServiceModel> queryServiceInfo(QueryModel model)
	{
		return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryServiceInfo", model);
	}

	
	/**
	 * 描述信息：根所ID来加载用户信息
	 * 创建时间：2015年3月12日 上午9:34:17
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public ServiceModel queryServiceInfoById(QueryModel model)
	{
		return getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryServiceInfoById", model);
	}

	
	
	/**
	 * 描述信息：增加服务数据
	 * 创建时间：2015年3月12日 上午9:33:20
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public int addServiceInfo(ServiceModel model)
	{
		return getSqlSession().insert(getMybatisSqlMapNamespace() + ".addServiceInfo", model);
	}

	
	/**
	 * 描述信息：修改服务数据
	 * 创建时间：2015年3月12日 上午9:33:11
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public int modifyServiceInfo(ServiceModel model)
	{
		return getSqlSession().update(getMybatisSqlMapNamespace() + ".modifyServiceInfo", model);
	}

	
	/**
	 * 描述信息：删除服务数据
	 * 创建时间：2015年3月12日 上午9:33:06
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public int delServiceInfo(ServiceModel model)
	{
		return getSqlSession().delete(getMybatisSqlMapNamespace() + ".delServiceInfo", model);
	}
}
