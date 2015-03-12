/**
 * 文件名称：NSearchService.java
 * 版权所有：Copyright njty
 * 创建时间：2015年3月12日
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
import com.gesoft.dao.NSearchDAO;
import com.gesoft.model.ActivityModel;
import com.gesoft.model.BaseModel;
import com.gesoft.model.QueryModel;
import com.gesoft.model.RelativePhoneModel;
import com.gesoft.model.UserModel;

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

	
	/**
	 * 描述信息：首页加载医护人员的用户信息
	 * 创建时间：2015年3月12日 上午9:31:37
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<UserModel> queryUserListInfo(RelativePhoneModel model)
	{
		return nSearchDAO.queryUserListInfo(model);
	}

	
	/**
	 * 描述信息：查询活动总数
	 * 创建时间：2015年3月12日 上午9:32:22
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public long queryActivityInfoCnt(QueryModel model)
	{
		return nSearchDAO.queryActivityInfoCnt(model);
	}


	/**
	 * 描述信息：分页查询活动信息
	 * 创建时间：2015年3月12日 上午9:34:23
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<ActivityModel> queryActivityInfo(QueryModel model)
	{
		return nSearchDAO.queryActivityInfo(model);
	}

	
	/**
	 * 描述信息：根所ID来加载用户信息
	 * 创建时间：2015年3月12日 上午9:34:17
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public ActivityModel queryActivityInfoById(QueryModel model)
	{
		return nSearchDAO.queryActivityInfoById(model);
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
		return nSearchDAO.addActivityInfo(model);
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
		return nSearchDAO.modifyActivityInfo(model);
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
		return nSearchDAO.delActivityInfo(model);
	}
}
