/**
 * 文件名称：NSearchService.java
 * 版权所有：Copyright njty
 * 创建时间：2015年3月12日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gesoft.common.EntityDAO;
import com.gesoft.common.EntityService;
import com.gesoft.dao.NSearchDAO;
import com.gesoft.model.ActivityModel;
import com.gesoft.model.BaseModel;
import com.gesoft.model.DoctorAdviceModel;
import com.gesoft.model.DoctorModel;
import com.gesoft.model.MessageModel;
import com.gesoft.model.NurseRequestModel;
import com.gesoft.model.QueryModel;
import com.gesoft.model.ServiceModel;
import com.gesoft.model.TreeNodeModel;
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
	public List<UserModel> queryUserListInfo(QueryModel model)
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
		// 增加
		int nRet = nSearchDAO.addActivityInfo(model);
		
		// 增加活动与医生关系
		if (model.getDoctorIds() != null && model.getDoctorIds().trim().length() > 0)
		{
			String[] doctorFlys = model.getDoctorIds().split("\\,");
			for (String doctorId : doctorFlys)
			{
				model.setDoctorId(Long.parseLong(doctorId));
				nSearchDAO.addActivityDoctorInfo(model);
			}
		}
		
		return nRet;
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
		// 修改活动记录
		int nRet = nSearchDAO.modifyActivityInfo(model);
		
		// 删除对应关系
		nSearchDAO.delActivityDoctorInfo(model);
		
		// 增加活动与医生关系
		if (model.getDoctorIds() != null && model.getDoctorIds().trim().length() > 0)
		{
			String[] doctorFlys = model.getDoctorIds().split("\\,");
			for (String doctorId : doctorFlys)
			{
				model.setDoctorId(Long.parseLong(doctorId));
				nSearchDAO.addActivityDoctorInfo(model);
			}
		}
		return nRet;
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
		// 增加服务
		int nRet = nSearchDAO.addServiceInfo(model);
		
		// 增加服务与医生关系
		if (model.getDoctorIds() != null && model.getDoctorIds().trim().length() > 0)
		{
			String[] doctorFlys = model.getDoctorIds().split("\\,");
			for (String doctorId : doctorFlys)
			{
				model.setDoctorId(Integer.parseInt(doctorId));
				nSearchDAO.addServiceDoctorInfo(model);
			}
		}
		return nRet;
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
		// 修改服务
		int nRet = nSearchDAO.modifyServiceInfo(model);
		
		// 删除对应关系
		nSearchDAO.delServiceDoctorInfo(model);
		
		// 增加服务与医生关系
		if (model.getDoctorIds() != null && model.getDoctorIds().trim().length() > 0)
		{
			String[] doctorFlys = model.getDoctorIds().split("\\,");
			for (String doctorId : doctorFlys)
			{
				model.setDoctorId(Integer.parseInt(doctorId));
				nSearchDAO.addServiceDoctorInfo(model);
			}
		}
		return nRet;
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
	public List<DoctorModel> queryDoctorInfo(QueryModel model)
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


	/**
	 * 描述信息：查询医嘱总数
	 * 创建时间：2015年3月17日 上午3:34:13
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @return
	 */
	@Transactional(readOnly=true)
	public long queryDoctorAdviceInfoCnt(QueryModel model)
	{
		return nSearchDAO.queryDoctorAdviceInfoCnt(model);
	}


	/**
	 * 描述信息：分页查询医嘱信息
	 * 创建时间：2015年3月17日 上午3:33:55
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<DoctorAdviceModel> queryDoctorAdviceInfo(QueryModel model)
	{
		return nSearchDAO.queryDoctorAdviceInfo(model);
	}


	/**
	 * 描述信息：根据用户ID来查询医嘱
	 * 创建时间：2015年3月17日 上午3:33:36
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @return
	 */
	@Transactional(readOnly=true)
	public DoctorAdviceModel queryDoctorAdviceInfoById(QueryModel model)
	{
		return nSearchDAO.queryDoctorAdviceInfoById(model);
	}


	/**
	 * 描述信息：增加医嘱
	 * 创建时间：2015年3月17日 上午3:33:23
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public int addDoctorAdviceInfo(DoctorAdviceModel model)
	{
		return nSearchDAO.addDoctorAdviceInfo(model);
	}


	/**
	 * 描述信息：修改医嘱
	 * 创建时间：2015年3月17日 上午3:33:04
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public int modifyDoctorAdviceInfo(DoctorAdviceModel model)
	{
		return nSearchDAO.modifyDoctorAdviceInfo(model);
	}


	/**
	 * 描述信息：删除医嘱
	 * 创建时间：2015年3月17日 上午3:32:42
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public int delDoctorAdviceInfo(DoctorAdviceModel model)
	{
		return nSearchDAO.delDoctorAdviceInfo(model);
	}


	/**
	 * 描述信息：首页查询留言信息
	 * 创建时间：2015年3月19日 上午9:32:55
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @return
	 */
	@Transactional(readOnly=true)
	public long queryMessageInfoCnt(QueryModel model)
	{
		return nSearchDAO.queryMessageInfoCnt(model);
	}


	/**
	 * 描述信息：分页显示留言数据
	 * 创建时间：2015年3月19日 上午9:33:20
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<MessageModel> queryMessageInfo(QueryModel model)
	{
		return nSearchDAO.queryMessageInfo(model);
	}


	/**
	 * 描述信息：修改读取状态
	 * 创建时间：2015年3月19日 下午12:09:29
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 */
	public long modifyMessageStatusInfo(QueryModel model)
	{
		return nSearchDAO.modifyMessageStatusInfo(model);
	}


	/**
	 * 描述信息：查看用户的留言
	 * 创建时间：2015年3月20日 上午4:58:39
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<MessageModel> queryMessageUserInfo(QueryModel model)
	{
		return nSearchDAO.queryMessageUserInfo(model);
	}


	/**
	 * 描述信息：修改用户留言状态
	 * 创建时间：2015年3月20日 上午4:59:02
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 */
	public long modifyMessageStatusInfoByUserId(QueryModel model)
	{
		return nSearchDAO.modifyMessageStatusInfoByUserId(model);
	}

	/**
	 * 描述信息：加载医生
	 * 创建时间：2015年3月24日 上午9:12:20
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<DoctorModel> queryDoctors(QueryModel model)
	{
		return this.nSearchDAO.queryDoctors(model);
	}


	/**
	 * 描述信息：加载服务与医生关联关系
	 * 创建时间：2015年3月24日 上午9:23:47
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<DoctorModel> queryServiceDoctorIds(QueryModel model)
	{
		return this.nSearchDAO.queryServiceDoctorIds(model);
	}
	

	/**
	 * 描述信息：加载活动与医生关联关系
	 * 创建时间：2015年3月24日 上午9:23:47
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<DoctorModel> queryActivityDoctorIds(QueryModel model)
	{
		return this.nSearchDAO.queryActivityDoctorIds(model);
	}


	/**
	 * 描述信息：加载用户节点树
	 * 创建时间：2015年3月24日 下午1:10:28
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<TreeNodeModel> queryUserTreeInfo(QueryModel model)
	{
		TreeNodeModel parent = new TreeNodeModel();
		parent.setId(0);
		parent.setText("所有");
		parent.setChildren(nSearchDAO.queryUserTreeInfo(model));
		
		List<TreeNodeModel> list = new ArrayList<TreeNodeModel>();
		list.add(parent);
		return list;
	}
	
}
