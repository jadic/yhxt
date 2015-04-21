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
import com.gesoft.model.MessageModel;
import com.gesoft.model.NurseRequestModel;
import com.gesoft.model.OutModel;
import com.gesoft.model.PostModel;
import com.gesoft.model.QueryModel;
import com.gesoft.model.RelativePhoneModel;
import com.gesoft.model.ScoreModel;
import com.gesoft.model.ServiceModel;
import com.gesoft.model.UserModel;
import com.gesoft.util.Constants;

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
	
	
	/**
	 * 描述信息：修改用户密码
	 * 创建时间：2015年3月8日 上午11:08:36
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public int modifyUserPwdInfo(UserModel model)
	{
		return pQueryDAO.modifyUserPwdInfo(model);
	}
	
	/**
	 * 描述信息：查询我的亲情号码总数
	 * 创建时间：2015年3月5日 上午9:28:48
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public long queryRelativePhoneInfoCnt(QueryModel model)
	{
		return pQueryDAO.queryRelativePhoneInfoCnt(model);
	}
	
	
	/**
	 * 描述信息：分页查询我的亲情号码数据
	 * 创建时间：2015年3月5日 上午9:29:10
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<RelativePhoneModel> queryRelativePhoneInfo(QueryModel model)
	{
		return pQueryDAO.queryRelativePhoneInfo(model);
	}
	
	
	/**
	 * 描述信息：根据ID来加载亲情数据
	 * 创建时间：2015年3月8日 下午4:26:17
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public RelativePhoneModel queryRelativePhoneInfoById(QueryModel model)
	{
		return pQueryDAO.queryRelativePhoneInfoById(model);
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
		return pQueryDAO.addRelativePhoneInfo(model);
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
		return pQueryDAO.modifyRelativePhoneInfo(model);
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
		return pQueryDAO.delRelativePhoneInfo(model);
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
		return pQueryDAO.queryUserBaseInfo(model);
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
		//pQueryDAO.delUserBaseInfo(model);
		
		//新增用户基本数据
		//return pQueryDAO.addUserBaseInfo(model);
		return pQueryDAO.modifyUserBaseInfo(model);
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
		return pQueryDAO.modifyUserPhotoInfo(model);
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
		return pQueryDAO.modifyUserDetailInfo(model);
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
		return pQueryDAO.modifyUserWorkInfo(model);
	}
	
	
	/**
	 * 描述信息：
	 * 创建时间：2015年3月9日 上午12:21:18
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public HabbitModel queryHabbitInfo(QueryModel model)
	{
		HabbitModel mRetModel = pQueryDAO.queryHabbitInfo(model);
		if (mRetModel == null)
		{
			mRetModel = new HabbitModel();
			mRetModel.setUserId(model.getUserId());
			pQueryDAO.addHabbitInfo(mRetModel);
		}
		return mRetModel;
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
		return pQueryDAO.modifyHabbitInfo(model);
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
		GeneticDiseaseModel mRetModel = pQueryDAO.queryGeneticDiseaseInfo(model);
		if (mRetModel == null)
		{
			mRetModel = new GeneticDiseaseModel();
			mRetModel.setUserId(model.getUserId());
			pQueryDAO.addGeneticDiseaseInfo(mRetModel);
		}
		return mRetModel;
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
		return pQueryDAO.modifyGeneticDiseaseInfo(model);
	}

	
	/**
	 * 描述信息：查询疾病史总记录数
	 * 创建时间：2015年3月10日 上午8:54:33
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @return
	 */
	@Transactional(readOnly=true)
	public long queryDiseaseHisInfoCnt(QueryModel model)
	{
		return pQueryDAO.queryDiseaseHisInfoCnt(model);
	}

	
	/**
	 * 描述信息：分页加载疾病史记录
	 * 创建时间：2015年3月10日 上午8:55:12
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<DiseaseHisModel> queryDiseaseHisInfo(QueryModel model)
	{
		return pQueryDAO.queryDiseaseHisInfo(model);
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
		return pQueryDAO.addDiseaseHisInfo(model);
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
		return pQueryDAO.modifyDiseaseHisInfo(model);
	}

	
	/**
	 * 描述信息：根据ID加载疾病史数据
	 * 创建时间：2015年3月10日 上午9:45:45
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @return
	 */
	@Transactional(readOnly=true)
	public DiseaseHisModel queryDiseaseHisInfoById(QueryModel model)
	{
		return pQueryDAO.queryDiseaseHisInfoById(model);
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
		return pQueryDAO.delDiseaseHisInfo(model);
	}

	
	/**
	 * 描述信息：加载我的医护人员
	 * 创建时间：2015年3月11日 上午3:17:33
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @return
	 */
	@Transactional(readOnly=true)
	public UserModel queryMyNurseInfo(QueryModel model)
	{
		return pQueryDAO.queryMyNurseInfo(model);
	}

	
	/**
	 * 描述信息：查询医护人员列表总数
	 * 创建时间：2015年3月11日 上午3:18:30
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @return
	 */
	@Transactional(readOnly=true)
	public long queryNurseInfoCnt(QueryModel model)
	{
		return pQueryDAO.queryNurseInfoCnt(model);
	}

	
	/**
	 * 描述信息：分页查询医护人员列表
	 * 创建时间：2015年3月11日 上午3:18:30
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<UserModel> queryNurseInfo(QueryModel model)
	{
		return pQueryDAO.queryNurseInfo(model);
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
		return pQueryDAO.addNurseRequestInfo(model);
	}

	
	/**
	 * 描述信息：查询签约申请
	 * 创建时间：2015年3月11日 上午4:56:15
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public NurseRequestModel queryNurseRequestInfo(QueryModel model)
	{
		return pQueryDAO.queryNurseRequestInfo(model);
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
		return pQueryDAO.queryNurseDetailInfo(model);
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
		return pQueryDAO.addSendMessageInfo(model);
	}

	
	/**
	 * 描述信息：批量增加留言
	 * 创建时间：2015年3月24日 下午1:51:40
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public int addBathSendMessageInfo(MessageModel model)
	{
		int nRet = 0;
		if (model.getReceiverIds() != null && model.getReceiverIds().trim().length() > 0)
		{
			String[] receiverFlys = model.getReceiverIds().split("\\,");
			for (String receiverId : receiverFlys)
			{
				model.setReceiverId(Long.parseLong(receiverId));
				pQueryDAO.addSendMessageInfo(model);
			}
		}
		nRet = 1;
		return nRet;
	}
	
	
	/**
	 * 描述信息：加载消息数据
	 * 创建时间：2015年3月11日 上午9:26:23
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<MessageModel> queryMessageInfo(QueryModel model)
	{
		return pQueryDAO.queryMessageInfo(model);
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
		return pQueryDAO.addScoreInfo(model);
	}

	
	/**
	 * 描述信息：查看当月点评权限是否已用完
	 * 创建时间：2015年3月11日 下午5:27:35
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @return
	 */
	@Transactional(readOnly=true)
	public long queryCurrentMonthMessageInfoCnt(QueryModel model)
	{
		return pQueryDAO.queryCurrentMonthMessageInfoCnt(model);
	}

	
	/**
	 * 描述信息：用户登录
	 * 创建时间：2015年3月25日 下午6:07:12
	 * @author WCL (ln_admin@yeah.net)
	 * @param user
	 * @return
	 */
	@Transactional(readOnly=true)
	public UserModel login(UserModel user)
	{
		UserModel model = pQueryDAO.queryLoginInfo(user);
		if (model != null)
		{
			if (model.getUserPwd().equals(user.getUserPwd()))
			{
				user.state = Constants.GLOBAL_SERVICE_SUCCESS;
			}
			else 
			{
				user.msgValue = "密码输入错误";
				user.state = Constants.GLOBAL_SERVICE_FAIL;
			}
		}
		else
		{
			user.msgValue = "用户不存在";
			user.state = Constants.GLOBAL_SERVICE_FAIL;
		}
		
		return model;
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
		return pQueryDAO.addFeedBackInfo(model);
	}

	
	/**
	 * 描述信息：加载活动总数
	 * 创建时间：2015年4月9日 上午4:44:29
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @return
	 */
	@Transactional(readOnly=true)
	public long queryActivityInfoCnt(QueryModel model)
	{
		return pQueryDAO.queryActivityInfoCnt(model);
	}

	
	/**
	 * 描述信息：分页加载活动
	 * 创建时间：2015年4月9日 上午4:44:47
	 * @author WCL (ln_admin@yeah.net)
	 * @param query
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<ActivityModel> queryActivityInfo(QueryModel model)
	{
		return pQueryDAO.queryActivityInfo(model);
	}

	
	/**
	 * 描述信息：加载活动详细
	 * 创建时间：2015年4月9日 上午5:15:38
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public ActivityModel queryActivityInfoById(QueryModel model)
	{
		return pQueryDAO.queryActivityInfoById(model);
	}

	
	/**
	 * 描述信息：加载活动医生
	 * 创建时间：2015年4月9日 上午5:32:02
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<DoctorModel> queryActivityDoctorInfo(QueryModel model)
	{
		return pQueryDAO.queryActivityDoctorInfo(model);
	}

	
	/**
	 * 描述信息：加载论坛总数
	 * 创建时间：2015年4月9日 上午6:11:06
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public long queryPostInfoCnt(QueryModel model)
	{
		return pQueryDAO.queryPostInfoCnt(model);
	}

	
	/**
	 * 描述信息：分页加载论坛
	 * 创建时间：2015年4月9日 上午6:10:49
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<PostModel> queryPostInfo(QueryModel model)
	{
		return pQueryDAO.queryPostInfo(model);
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
		return pQueryDAO.addPostInfo(model);
	}

	
	/**
	 * 描述信息：查看论坛详细
	 * 创建时间：2015年4月9日 上午8:35:04
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public PostModel queryPostInfoById(QueryModel model)
	{
		return pQueryDAO.queryPostInfoById(model);
	}
	

	
	/**
	 * 描述信息：查询评论列表
	 * 创建时间：2015年4月9日 上午8:35:08
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public long queryPostCommentInfoCnt(QueryModel model)
	{
		return pQueryDAO.queryPostCommentInfoCnt(model);
	}
	
	
	/**
	 * 描述信息：查询评论列表
	 * 创建时间：2015年4月9日 上午8:35:08
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<CommentModel> queryPostCommentInfo(QueryModel model)
	{
		return pQueryDAO.queryPostCommentInfo(model);
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
		return pQueryDAO.addPostCommentInfo(model);
	}

	/**
	 * 描述信息：统计血糖
	 * 创建时间：2015年4月21日 上午11:37:40
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<BloodModel> queryStatBloodInfo(QueryModel model)
	{
		return pQueryDAO.queryStatBloodInfo(model);
	}

	/**
	 * 描述信息：统计体温
	 * 创建时间：2015年4月21日 上午11:37:40
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<BloodModel> queryStatEarInfo(QueryModel model)
	{
		return pQueryDAO.queryStatEarInfo(model);
	}

	/**
	 * 描述信息：显示最近血糖与体温
	 * 创建时间：2015年4月21日 上午11:37:40
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public OutModel queryRecentlyHomeInfo(QueryModel model)
	{
		OutModel mRetModel = null;
		// 加载最近血糖
		mRetModel = pQueryDAO.queryRecentlyHomeBloodInfo(model);
		
		// 加载最近体温
		OutModel mEarModel = pQueryDAO.queryRecentlyHomeEarInfo(model);
		if (mRetModel == null)
		{
			mRetModel = mEarModel;
		}
		else 
		{
			mRetModel.setE(mEarModel.getE());
			mRetModel.setF(mEarModel.getF());
		}
		return mRetModel;
	}
	
}
