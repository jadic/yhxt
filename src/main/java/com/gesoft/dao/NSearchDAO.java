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
import org.springframework.transaction.annotation.Transactional;

import com.gesoft.common.EntityDAOImpl;
import com.gesoft.model.ActivityModel;
import com.gesoft.model.BaseModel;
import com.gesoft.model.DoctorAdviceModel;
import com.gesoft.model.DoctorModel;
import com.gesoft.model.MessageModel;
import com.gesoft.model.NurseRequestModel;
import com.gesoft.model.QueryModel;
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
	public List<UserModel> queryUserListInfo(QueryModel model)
	{
		return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryUserListInfo", model);
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
	 * 描述信息：修改用户基础信息
	 * 创建时间：2015年3月8日 下午10:20:36
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public int modifyUserBaseInfo(UserModel model)
	{
		return getSqlSession().update(getMybatisSqlMapNamespace() + ".modifyUserBaseInfo", model);
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
		return getSqlSession().update(getMybatisSqlMapNamespace() + ".modifyUserDetailInfo", model);
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
		return getSqlSession().update(getMybatisSqlMapNamespace() + ".modifyUserWorkInfo", model);
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
	
	/**
	 * 描述信息：查询签约数据总数
	 * 创建时间：2015年3月12日 上午10:45:29
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @return
	 */
	public long queryNurseRequestInfoCnt(QueryModel model)
	{
		return getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryNurseRequestInfoCnt", model);
	}


	/**
	 * 描述信息：分页查询签约
	 * 创建时间：2015年3月12日 上午10:45:50
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @return
	 */
	public List<NurseRequestModel> queryNurseRequestInfo(QueryModel model)
	{
		return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryNurseRequestInfo", model);
	}

	

	/**
	 * 描述信息：加载医护人员详细情况
	 * 创建时间：2015年3月11日 上午6:27:39
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @return
	 */
	public UserModel queryNurseDetailInfo(QueryModel model)
	{
		return getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryNurseDetailInfo", model);
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
		return getSqlSession().update(getMybatisSqlMapNamespace() + ".dealNurseRequestInfo", model);
	}


	/**
	 * 描述信息：插入用户与医护人员关系表
	 * 创建时间：2015年3月12日 上午10:50:46
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 */
	public void addUserNurseRelaviteInfo(NurseRequestModel model)
	{
		getSqlSession().insert(getMybatisSqlMapNamespace() + ".addUserNurseRelaviteInfo", model);
	}
	


	/**
	 * 描述信息：查询医生总记录数
	 * 创建时间：2015年3月12日 下午12:07:36
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @return
	 */
	public long queryDoctorInfoCnt(QueryModel model)
	{
		return getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryDoctorInfoCnt", model);
	}


	/**
	 * 描述信息：分页加载医生信息
	 * 创建时间：2015年3月12日 下午12:07:41
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @return
	 */
	public List<DoctorModel> queryDoctorInfo(QueryModel model)
	{
		return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryDoctorInfo", model);
	}


	/**
	 * 描述信息：加载医人详情
	 * 创建时间：2015年3月12日 下午12:07:46
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @return
	 */
	public DoctorModel queryDoctorDetailInfo(QueryModel model)
	{
		return getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryDoctorDetailInfo", model);
	}
	

	/**
	 * 描述信息：加载请求明细
	 * 创建时间：2015年3月13日 上午10:47:35
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @return
	 */
	public NurseRequestModel queryNurseQuestInfo(QueryModel model)
	{
		return getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryNurseQuestInfo", model);
	}
	

	/**
	 * 描述信息：查询医嘱总数
	 * 创建时间：2015年3月17日 上午3:34:13
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @return
	 */
	public long queryDoctorAdviceInfoCnt(QueryModel model)
	{
		return getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryDoctorAdviceInfoCnt", model);
	}


	/**
	 * 描述信息：分页查询医嘱信息
	 * 创建时间：2015年3月17日 上午3:33:55
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @return
	 */
	public List<DoctorAdviceModel> queryDoctorAdviceInfo(QueryModel model)
	{
		return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryDoctorAdviceInfo", model);
	}


	/**
	 * 描述信息：根据用户ID来查询医嘱
	 * 创建时间：2015年3月17日 上午3:33:36
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @return
	 */
	public DoctorAdviceModel queryDoctorAdviceInfoById(QueryModel model)
	{
		return getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryDoctorAdviceInfoById", model);
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
		return getSqlSession().insert(getMybatisSqlMapNamespace() + ".addDoctorAdviceInfo", model);
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
		return getSqlSession().update(getMybatisSqlMapNamespace() + ".modifyDoctorAdviceInfo", model);
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
		return getSqlSession().delete(getMybatisSqlMapNamespace() + ".delDoctorAdviceInfo", model);
	}
	


	/**
	 * 描述信息：首页查询留言信息
	 * 创建时间：2015年3月19日 上午9:32:55
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @return
	 */
	public long queryMessageInfoCnt(QueryModel model)
	{
		return getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryMessageInfoCnt", model);
	}


	/**
	 * 描述信息：分页显示留言数据
	 * 创建时间：2015年3月19日 上午9:33:20
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @return
	 */
	public List<MessageModel> queryMessageInfo(QueryModel model)
	{
		return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryMessageInfo", model);
	}
	
	
	/**
	 * 描述信息：修改读取状态
	 * 创建时间：2015年3月19日 下午12:09:29
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 */
	public long modifyMessageStatusInfo(QueryModel model)
	{
		return getSqlSession().update(getMybatisSqlMapNamespace() + ".modifyMessageStatusInfo", model);
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
		return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryMessageUserInfo", model);
	}


	/**
	 * 描述信息：修改用户留言状态
	 * 创建时间：2015年3月20日 上午4:59:02
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 */
	public long modifyMessageStatusInfoByUserId(QueryModel model)
	{
		return getSqlSession().update(getMybatisSqlMapNamespace() + ".modifyMessageStatusInfoByUserId", model);
	}
}
