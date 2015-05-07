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
import com.gesoft.model.ActivityModel;
import com.gesoft.model.BaseModel;
import com.gesoft.model.BloodModel;
import com.gesoft.model.CommentModel;
import com.gesoft.model.DeviceModel;
import com.gesoft.model.DiseaseHisModel;
import com.gesoft.model.DoctorModel;
import com.gesoft.model.FeedBackModel;
import com.gesoft.model.GeneticDiseaseModel;
import com.gesoft.model.HabbitModel;
import com.gesoft.model.HealthReportModel;
import com.gesoft.model.MessageModel;
import com.gesoft.model.NurseRequestModel;
import com.gesoft.model.OutModel;
import com.gesoft.model.PostModel;
import com.gesoft.model.QueryModel;
import com.gesoft.model.RelativePhoneModel;
import com.gesoft.model.ScoreModel;
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
	 * 描述信息：修改照片数据
	 * 创建时间：2015年3月24日 下午6:43:55
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public int modifyUserPhotoInfo(UserModel model)
	{
		return getSqlSession().update(getMybatisSqlMapNamespace() + ".modifyUserPhotoInfo", model);
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
	 * 描述信息：加载生活习惯
	 * 创建时间：2015年3月9日 上午12:21:18
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public HabbitModel queryHabbitInfo(QueryModel model)
	{
		return getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryHabbitInfo", model);
	}
	
	/**
	 * 描述信息：增加生活习惯
	 * 创建时间：2015年3月9日 上午12:25:25
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public int addHabbitInfo(HabbitModel model)
	{
		return getSqlSession().insert(getMybatisSqlMapNamespace() + ".addHabbitInfo", model);
	}
	
	
	/**
	 * 描述信息：修改生活习惯
	 * 创建时间：2015年3月9日 上午12:17:45
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public int modifyHabbitInfo(HabbitModel model)
	{
		return getSqlSession().update(getMybatisSqlMapNamespace() + ".modifyHabbitInfo", model);
	}
	
	/**
	 * 描述信息：加载家族遗传史
	 * 创建时间：2015年3月9日 上午1:44:37
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public GeneticDiseaseModel queryGeneticDiseaseInfo(QueryModel model)
	{
		return getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryGeneticDiseaseInfo", model);
	}
	
	
	/**
	 * 描述信息：增加家族遗传史
	 * 创建时间：2015年3月9日 上午1:46:46
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public long addGeneticDiseaseInfo(GeneticDiseaseModel model)
	{
		return getSqlSession().insert(getMybatisSqlMapNamespace() + ".addGeneticDiseaseInfo", model);
	}
	
	
	/**
	 * 描述信息：修改家族遗传史
	 * 创建时间：2015年3月9日 上午1:45:16
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public int modifyGeneticDiseaseInfo(GeneticDiseaseModel model)
	{
		return getSqlSession().update(getMybatisSqlMapNamespace() + ".modifyGeneticDiseaseInfo", model);
	}


	/**
	 * 描述信息：查询疾病史总记录数
	 * 创建时间：2015年3月10日 上午8:54:33
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @return
	 */
	public long queryDiseaseHisInfoCnt(QueryModel model)
	{
		return (Long)getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryDiseaseHisInfoCnt", model);
	}


	/**
	 * 描述信息：分页加载疾病史记录
	 * 创建时间：2015年3月10日 上午8:55:12
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @return
	 */
	public List<DiseaseHisModel> queryDiseaseHisInfo(QueryModel model)
	{
		return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryDiseaseHisInfo", model);
	}


	/**
	 * 描述信息：增加疾病史数据
	 * 创建时间：2015年3月10日 上午8:55:37
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public int addDiseaseHisInfo(DiseaseHisModel model)
	{
		return getSqlSession().insert(getMybatisSqlMapNamespace() + ".addDiseaseHisInfo", model);
	}


	/**
	 * 描述信息：修改疾病史数据
	 * 创建时间：2015年3月10日 上午8:55:50
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public int modifyDiseaseHisInfo(DiseaseHisModel model)
	{
		return getSqlSession().update(getMybatisSqlMapNamespace() + ".modifyDiseaseHisInfo", model);
	}
	
	
	/**
	 * 描述信息：根据ID加载疾病史数据
	 * 创建时间：2015年3月10日 上午9:45:45
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @return
	 */
	public DiseaseHisModel queryDiseaseHisInfoById(QueryModel model)
	{
		return getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryDiseaseHisInfoById", model);
	}

	
	/**
	 * 描述信息：删除疾病史记录
	 * 创建时间：2015年3月10日 上午9:46:45
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public int delDiseaseHisInfo(DiseaseHisModel model)
	{
		return getSqlSession().delete(getMybatisSqlMapNamespace() + ".delDiseaseHisInfo", model);
	}
	
	/**
	 * 描述信息：加载我的医护人员
	 * 创建时间：2015年3月11日 上午3:17:33
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @return
	 */
	public UserModel queryMyNurseInfo(QueryModel model)
	{
		return getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryMyNurseInfo", model);
	}

	
	/**
	 * 描述信息：查询医护人员列表总数
	 * 创建时间：2015年3月11日 上午3:18:30
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @return
	 */
	public long queryNurseInfoCnt(QueryModel model)
	{
		return getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryNurseInfoCnt", model);
	}

	
	/**
	 * 描述信息：分页查询医护人员列表
	 * 创建时间：2015年3月11日 上午3:18:30
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @return
	 */
	public List<UserModel> queryNurseInfo(QueryModel model)
	{
		return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryNurseInfo", model);
	}
	
	
	/**
	 * 描述信息：增加签约申请
	 * 创建时间：2015年3月11日 上午4:48:40
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public int addNurseRequestInfo(NurseRequestModel model)
	{
		return getSqlSession().insert(getMybatisSqlMapNamespace() + ".addNurseRequestInfo", model);
	}
	

	/**
	 * 描述信息：查询签约申请
	 * 创建时间：2015年3月11日 上午4:56:15
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public NurseRequestModel queryNurseRequestInfo(QueryModel model)
	{
		return getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryNurseRequestInfo", model);
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
	 * 描述信息：发送消息
	 * 创建时间：2015年3月11日 上午9:16:56
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public int addSendMessageInfo(MessageModel model)
	{
		return getSqlSession().insert(getMybatisSqlMapNamespace() + ".addSendMessageInfo", model);
	}
	
	
	/**
	 * 描述信息：加载消息数据
	 * 创建时间：2015年3月11日 上午9:26:23
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public List<MessageModel> queryMessageInfo(QueryModel model)
	{
		return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryMessageInfo", model);
	}
	
	
	/**
	 * 描述信息：增加月评
	 * 创建时间：2015年3月11日 下午5:12:11
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public int addScoreInfo(ScoreModel model)
	{
		return getSqlSession().insert(getMybatisSqlMapNamespace() + ".addScoreInfo", model);
	}
	
	
	/**
	 * 描述信息：查看当月点评权限是否已用完
	 * 创建时间：2015年3月11日 下午5:27:35
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @return
	 */
	public long queryCurrentMonthMessageInfoCnt(QueryModel model)
	{
		return getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryCurrentMonthMessageInfoCnt", model);
	}
	
	/**
	 * 描述信息：
	 * 创建时间：2015年3月25日 下午6:13:08
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public UserModel queryLoginInfo(UserModel model)
	{
		return getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryLoginInfo", model);
	}
	

	/**
	 * 描述信息：增加反馈
	 * 创建时间：2015年4月7日 下午5:36:29
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public int addFeedBackInfo(FeedBackModel model)
	{
		return getSqlSession().insert(getMybatisSqlMapNamespace() + ".addFeedBackInfo", model);
	}
	
	
	
	/**
	 * 描述信息：加载活动总数
	 * 创建时间：2015年4月9日 上午4:44:29
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @return
	 */
	public long queryActivityInfoCnt(QueryModel model)
	{
		return getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryActivityInfoCnt", model);
	}

	
	/**
	 * 描述信息：分页加载活动
	 * 创建时间：2015年4月9日 上午4:44:47
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @return
	 */
	public List<ActivityModel> queryActivityInfo(QueryModel model)
	{
		return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryActivityInfo", model);
	}
	
	
	/**
	 * 描述信息：加载活动详细
	 * 创建时间：2015年4月9日 上午5:15:38
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public ActivityModel queryActivityInfoById(QueryModel model)
	{
		return getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryActivityInfoById", model);
	}
	
	/**
	 * 描述信息：加载活动医生
	 * 创建时间：2015年4月9日 上午5:32:36
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public List<DoctorModel> queryActivityDoctorInfo(QueryModel model)
	{
		return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryActivityDoctorInfo", model);
	}
	

	/**
	 * 描述信息：加载论坛总数
	 * 创建时间：2015年4月9日 上午6:11:06
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public long queryPostInfoCnt(QueryModel model)
	{
		return getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryPostInfoCnt", model);
	}

	
	/**
	 * 描述信息：分页加载论坛
	 * 创建时间：2015年4月9日 上午6:10:49
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public List<PostModel> queryPostInfo(QueryModel model)
	{
		return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryPostInfo", model);
	}

	/**
	 * 描述信息：增加论坛
	 * 创建时间：2015年4月9日 上午6:10:37
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public int addPostInfo(PostModel model)
	{
		return getSqlSession().insert(getMybatisSqlMapNamespace() + ".addPostInfo", model);
	}
	
	
	/**
	 * 描述信息：查看论坛详细
	 * 创建时间：2015年4月9日 上午8:35:04
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public PostModel queryPostInfoById(QueryModel model)
	{
		return getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryPostInfoById", model);
	}
	

	
	
	/**
	 * 描述信息：查询评论列表
	 * 创建时间：2015年4月9日 上午8:35:08
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public long queryPostCommentInfoCnt(QueryModel model)
	{
		return getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryPostCommentInfoCnt", model);
	}
	
	
	/**
	 * 描述信息：查询评论列表
	 * 创建时间：2015年4月9日 上午8:35:08
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public List<CommentModel> queryPostCommentInfo(QueryModel model)
	{
		return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryPostCommentInfo", model);
	}

	
	/**
	 * 描述信息：增加评论
	 * 创建时间：2015年4月9日 上午8:35:18
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public int addPostCommentInfo(CommentModel model)
	{
		return getSqlSession().insert(getMybatisSqlMapNamespace() + ".addPostCommentInfo", model);
	}
	
	/**
	 * 描述信息：统计血糖
	 * 创建时间：2015年4月21日 上午11:38:41
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public List<BloodModel> queryStatBloodInfo(QueryModel model)
	{
		return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryStatBloodInfo", model);
	}

	/**
	 * 描述信息：统计体温
	 * 创建时间：2015年4月21日 上午11:38:41
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public List<BloodModel> queryStatEarInfo(QueryModel model)
	{
		return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryStatEarInfo", model);
	}


	/**
	 * 描述信息：加载最近的血糖
	 * 创建时间：2015年4月21日 上午11:45:12
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public OutModel queryRecentlyHomeBloodInfo(QueryModel model)
	{
		return getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryRecentlyHomeBloodInfo", model);
	}


	/**
	 * 描述信息：加载最近的体温
	 * 创建时间：2015年4月21日 上午11:45:27
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public OutModel queryRecentlyHomeEarInfo(QueryModel model)
	{
		return getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryRecentlyHomeEarInfo", model);
	}
	
	
	/**
	 * 描述信息：加载近期血压
	 * 创建时间：2015年5月1日 下午2:09:02
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public OutModel queryRecentlyHomePressureInfo(QueryModel model)
	{
		return getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryRecentlyHomePressureInfo", model);
	}
	
	/**
	 * 描述信息：统计血压
	 * 创建时间：2015年5月1日 下午3:02:53
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public List<OutModel> queryStatBloodPressureInfo(QueryModel model)
	{
		return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryStatBloodPressureInfo", model);
	}
	

	/**
	 * 描述信息：加载最新的一条建议
	 * 创建时间：2015年5月2日 上午10:39:22
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public OutModel queryHomeDoctorAdviceInfo(QueryModel model)
	{
		return getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryHomeDoctorAdviceInfo", model);
	}
	
	
	/**
	 * 描述信息： 加载15天内的医
	 * 创建时间：2015年5月2日 下午1:59:28
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public List<OutModel> queryHomeDoctorAdvice15Info(QueryModel model)
	{
		return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryHomeDoctorAdvice15Info", model);
	}
	
	/**
	 * 描述信息：加载用户信息
	 * 创建时间：2015年5月4日 下午10:20:33
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public UserModel queryHealthUserInfo(QueryModel model)
	{
		return getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryHealthUserInfo", model);
	}
	
	
	/**
	 * 描述信息：加载运动记录
	 * 创建时间：2015年5月4日 下午10:21:49
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public List<OutModel> queryHealthSportInfo(QueryModel model)
	{
		return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryHealthSportInfo", model);
	}
	
	
	/**
	 * 描述信息：加载饮食记录
	 * 创建时间：2015年5月4日 下午10:21:49
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public List<OutModel> queryHealthFoodInfo(QueryModel model)
	{
		return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryHealthFoodInfo", model);
	}
	
	
	/**
	 * 描述信息：饮食合计
	 * 创建时间：2015年5月5日 上午10:26:48
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public OutModel queryHealthFoodSumInfo(QueryModel model)
	{
		return getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryHealthFoodSumInfo", model);
	}
	
	
	/**
	 * 描述信息：加载饮食合计
	 * 创建时间：2015年5月5日 上午10:29:20
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public List<OutModel> queryHealthFoodItemSumInfo(QueryModel model)
	{
		return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryHealthFoodItemSumInfo", model);
	}
	
	
	/**
	 * 描述信息：加载饮食项
	 * 创建时间：2015年5月5日 上午9:44:11
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public List<OutModel> queryHealthFoodItemInfo(QueryModel model)
	{
		return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryHealthFoodItemInfo", model);
	}
	

	
	/**
	 * 描述信息：加载收理状态
	 * 创建时间：2015年5月4日 下午10:21:49
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public List<OutModel> queryHealthMentalInfo(QueryModel model)
	{
		return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryHealthMentalInfo", model);
	}
	
	
	/**
	 * 描述信息：测量血压
	 * 创建时间：2015年5月4日 下午10:26:36
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public List<OutModel> queryHealthPressureInfo(QueryModel model)
	{
		return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryHealthPressureInfo", model);
	}
	

	/**
	 * 描述信息：测量心率
	 * 创建时间：2015年5月4日 下午10:26:36
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public List<OutModel> queryHealthPulseInfo(QueryModel model)
	{
		return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryHealthPulseInfo", model);
	}

	/**
	 * 描述信息：测量血糖
	 * 创建时间：2015年5月4日 下午10:26:36
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public List<OutModel> queryHealthGlucoseInfo(QueryModel model)
	{
		return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryHealthGlucoseInfo", model);
	}
	


	/**
	 * 描述信息：测量体温
	 * 创建时间：2015年5月4日 下午10:26:36
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public List<OutModel> queryHealthThermometerInfo(QueryModel model)
	{
		return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryHealthThermometerInfo", model);
	}


	/**
	 * 描述信息：删除健康报告
	 * 创建时间：2015年5月5日 下午1:32:38
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 */
	public int delHealthRepeatInfo(HealthReportModel model)
	{
		return getSqlSession().delete(getMybatisSqlMapNamespace() + ".delHealthRepeatInfo", model);
	}

	
	/**
	 * 描述信息：插入健康报告
	 * 创建时间：2015年5月5日 下午1:32:56
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 */
	public int addHealthRepeatInfo(HealthReportModel model)
	{
		return getSqlSession().insert(getMybatisSqlMapNamespace() + ".addHealthRepeatInfo", model);
	}
	
	/**
	 * 描述信息：加载健康报告记录信息
	 * 创建时间：2015年5月5日 下午2:14:24
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public HealthReportModel queryHealthReportInfo(HealthReportModel model)
	{
		return getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryHealthReportInfo", model);
	}
	
	

	/**
	 * 描述信息：
	 * 创建时间：2015年5月5日 下午5:48:10
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public List<OutModel> queryHealthSportMonthInfo(QueryModel model)
	{
		return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryHealthSportMonthInfo", model);
	}


	/**
	 * 描述信息：按月 运动合计与日均
	 * 创建时间：2015年5月5日 下午5:48:10
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public OutModel queryHealthSportMonthFxInfo(QueryModel model)
	{
		return getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryHealthSportMonthFxInfo", model);
	}
	
	

	/**
	 * 描述信息：
	 * 创建时间：2015年5月5日 下午5:48:10
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public List<OutModel> queryHealthFoodMonthInfo(QueryModel model)
	{
		return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryHealthFoodMonthInfo", model);
	}

	
	
	/**
	 * 描述信息：
	 * 创建时间：2015年5月5日 下午5:48:10
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public List<OutModel> queryHealthMentalMonthInfo(QueryModel model)
	{
		return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryHealthMentalMonthInfo", model);
	}

	
	/**
	 * 描述信息：
	 * 创建时间：2015年5月5日 下午5:48:10
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public List<OutModel> queryHealthPressureMonthInfo(QueryModel model)
	{
		return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryHealthPressureMonthInfo", model);
	}

	
	/**
	 * 描述信息：
	 * 创建时间：2015年5月5日 下午5:48:10
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public List<OutModel> queryHealthPulseMonthInfo(QueryModel model)
	{
		return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryHealthPulseMonthInfo", model);
	}

	
	/**
	 * 描述信息：
	 * 创建时间：2015年5月5日 下午5:48:10
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public List<OutModel> queryHealthGlucoseMonthInfo(QueryModel model)
	{
		return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryHealthGlucoseMonthInfo", model);
	}

	
	/**
	 * 描述信息：
	 * 创建时间：2015年5月5日 下午5:48:10
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public List<OutModel> queryHealthThermometerMonthInfo(QueryModel model)
	{
		return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryHealthThermometerMonthInfo", model);
	}
}
