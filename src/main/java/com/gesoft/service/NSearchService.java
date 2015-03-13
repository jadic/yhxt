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
import com.gesoft.model.DoctorModel;
import com.gesoft.model.NurseRequestModel;
import com.gesoft.model.QueryModel;
import com.gesoft.model.RelativePhoneModel;
import com.gesoft.model.ServiceModel;
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
	 * 描述信息：加载用户基本信息
	 * 创建时间：2015年3月8日 下午6:02:33
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly = true)
	public UserModel queryUserBaseInfo(QueryModel model)
	{
		return nSearchDAO.queryUserBaseInfo(model);
	}
	
	
	/**
	 * 描述信息：修改用户基本信息
	 * 创建时间：2015年3月8日 下午6:06:12
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public int modifyUserBaseInfo(UserModel model)
	{
		//删除原有数据
		//nSearchDAO.delUserBaseInfo(model);
		
		//新增用户基本数据
		//return nSearchDAO.addUserBaseInfo(model);
		return nSearchDAO.modifyUserBaseInfo(model);
	}
	
	
	/**
	 * 描述信息：修改用户详细信息
	 * 创建时间：2015年3月8日 下午10:24:53
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public int modifyUserDetailInfo(UserModel model)
	{
		return nSearchDAO.modifyUserDetailInfo(model);
	}
	
	
	/**
	 * 描述信息：修改用户工作信息
	 * 创建时间：2015年3月8日 下午10:29:56
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public int modifyUserWorkInfo(UserModel model)
	{
		return nSearchDAO.modifyUserWorkInfo(model);
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
	
	

	/**
	 * 描述信息：查询服务总数
	 * 创建时间：2015年3月12日 上午9:32:22
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public long queryServiceInfoCnt(QueryModel model)
	{
		return nSearchDAO.queryServiceInfoCnt(model);
	}


	/**
	 * 描述信息：分页查询服务信息
	 * 创建时间：2015年3月12日 上午9:34:23
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<ServiceModel> queryServiceInfo(QueryModel model)
	{
		return nSearchDAO.queryServiceInfo(model);
	}

	
	/**
	 * 描述信息：根所ID来加载用户信息
	 * 创建时间：2015年3月12日 上午9:34:17
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public ServiceModel queryServiceInfoById(QueryModel model)
	{
		return nSearchDAO.queryServiceInfoById(model);
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
		return nSearchDAO.addServiceInfo(model);
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
		return nSearchDAO.modifyServiceInfo(model);
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
		return nSearchDAO.delServiceInfo(model);
	}


	/**
	 * 描述信息：查询签约数据总数
	 * 创建时间：2015年3月12日 上午10:45:29
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @return
	 */
	@Transactional(readOnly=true)
	public long queryNurseRequestInfoCnt(QueryModel model)
	{
		return nSearchDAO.queryNurseRequestInfoCnt(model);
	}


	/**
	 * 描述信息：分页查询签约
	 * 创建时间：2015年3月12日 上午10:45:50
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<NurseRequestModel> queryNurseRequestInfo(QueryModel model)
	{
		return nSearchDAO.queryNurseRequestInfo(model);
	}


	/**
	 * 描述信息：加载医护人员详细情况
	 * 创建时间：2015年3月11日 上午6:27:39
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @return
	 */
	@Transactional(readOnly=true)
	public UserModel queryNurseDetailInfo(QueryModel model)
	{
		return nSearchDAO.queryNurseDetailInfo(model);
	}
	
	
	/**
	 * 描述信息：处理签约请求
	 * 创建时间：2015年3月12日 上午10:45:55
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public int dealNurseRequestInfo(NurseRequestModel model)
	{
		//如果是同时，则向用户与医护人员关系表中插入一条记录
		if (model.getStatus() == 1)
		{
			nSearchDAO.addUserNurseRelaviteInfo(model);
		}
		return nSearchDAO.dealNurseRequestInfo(model);
	}


	/**
	 * 描述信息：查询医生总记录数
	 * 创建时间：2015年3月12日 下午12:07:36
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @return
	 */
	@Transactional(readOnly=true)
	public long queryDoctorInfoCnt(QueryModel model)
	{
		return nSearchDAO.queryDoctorInfoCnt(model);
	}


	/**
	 * 描述信息：分页加载医生信息
	 * 创建时间：2015年3月12日 下午12:07:41
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<NurseRequestModel> queryDoctorInfo(QueryModel model)
	{
		return nSearchDAO.queryDoctorInfo(model);
	}


	/**
	 * 描述信息：加载医人详情
	 * 创建时间：2015年3月12日 下午12:07:46
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @return
	 */
	@Transactional(readOnly=true)
	public DoctorModel queryDoctorDetailInfo(QueryModel model)
	{
		return nSearchDAO.queryDoctorDetailInfo(model);
	}


	/**
	 * 描述信息：加载请求明细
	 * 创建时间：2015年3月13日 上午10:47:35
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @return
	 */
	@Transactional(readOnly=true)
	public NurseRequestModel queryNurseQuestInfo(QueryModel model)
	{
		return nSearchDAO.queryNurseQuestInfo(model);
	}
}
