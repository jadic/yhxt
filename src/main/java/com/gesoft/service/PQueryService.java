/**
 * 文件名称：PQueryService.java
 * 版权所有：Copyright njty
 * 创建时间：2015年3月5日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gesoft.common.EntityDAO;
import com.gesoft.common.EntityService;
import com.gesoft.dao.PQueryDAO;
import com.gesoft.model.ActivityModel;
import com.gesoft.model.BaseModel;
import com.gesoft.model.BloodGlucoseModel;
import com.gesoft.model.BloodModel;
import com.gesoft.model.CommentModel;
import com.gesoft.model.DeviceModel;
import com.gesoft.model.DiseaseHisModel;
import com.gesoft.model.DoctorModel;
import com.gesoft.model.FeedBackModel;
import com.gesoft.model.GeneticDiseaseModel;
import com.gesoft.model.HabbitModel;
import com.gesoft.model.HealthReportModel;
import com.gesoft.model.MedicineModel;
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
	public List<BloodGlucoseModel> queryStatBloodInfo(QueryModel model)
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
		if (mRetModel == null)
		{
			mRetModel = pQueryDAO.queryRecentlyHomeBloodTwoInfo(model);
		}
		else 
		{
			OutModel model2 = pQueryDAO.queryRecentlyHomeBloodTwoInfo(model);
			if (model2 != null)
			{
				mRetModel.setC(model2.getC());
				mRetModel.setD(model2.getD());
			}
		}
		
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
		
		//加载近期血压
		OutModel mPressureModel = pQueryDAO.queryRecentlyHomePressureInfo(model);
		if (mRetModel == null)
		{
			mRetModel = mPressureModel;
		}
		else 
		{
			mRetModel.setG(mPressureModel.getG());
			mRetModel.setH(mPressureModel.getH());
		}
		return mRetModel;
	}

	
	/**
	 * 描述信息：统计血压
	 * 创建时间：2015年5月1日 下午3:02:53
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<OutModel> queryStatBloodPressureInfo(QueryModel model)
	{
		return pQueryDAO.queryStatBloodPressureInfo(model);
	}

	
	/**
	 * 描述信息：加载最新的一条建议
	 * 创建时间：2015年5月2日 上午10:39:22
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public OutModel queryHomeDoctorAdviceInfo(QueryModel model)
	{
		return pQueryDAO.queryHomeDoctorAdviceInfo(model);
	}
	
	
	/**
	 * 描述信息： 加载15天内的医
	 * 创建时间：2015年5月2日 下午1:59:28
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<OutModel> queryHomeDoctorAdvice15Info(QueryModel model)
	{
		return pQueryDAO.queryHomeDoctorAdvice15Info(model);
	}
	
	
	/**
	 * 描述信息：加载用户信息
	 * 创建时间：2015年5月4日 下午10:20:33
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public UserModel queryHealthUserInfo(QueryModel model)
	{
		return pQueryDAO.queryHealthUserInfo(model);
	}
	
	
	/**
	 * 描述信息：加载运动记录
	 * 创建时间：2015年5月4日 下午10:21:49
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<OutModel> queryHealthSportInfo(QueryModel model)
	{
		return pQueryDAO.queryHealthSportInfo(model);
	}
	
	
	/**
	 * 描述信息：饮食记录合计
	 * 创建时间：2015年5月5日 上午10:25:59
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public OutModel queryHealthFoodSumInfo(QueryModel model)
	{
		OutModel mOutModel = pQueryDAO.queryHealthFoodSumInfo(model);
		if (mOutModel != null)
		{
			List<OutModel> argFlys = pQueryDAO.queryHealthFoodItemSumInfo(model);  
			if (argFlys != null && argFlys.size() > 0)
			{
				for (OutModel outModel : argFlys)
				{
					switch (outModel.getA1())
					{
					case 4:
						mOutModel.setD(outModel.getB());
						break;
					case 5:
						mOutModel.setE(outModel.getB());
						break;
					case 6:
						mOutModel.setF(outModel.getB());
						break;
					case 7:
						mOutModel.setG(outModel.getB());
						break;
					case 8:
						mOutModel.setH(outModel.getB());
						break;
					case 9:
						mOutModel.setI(outModel.getB());
						break;	
					default:
						break;
					}
				}
			}
		}
		return mOutModel;
	}
	
	
	
	/**
	 * 描述信息：加载饮食记录
	 * 创建时间：2015年5月4日 下午10:21:49
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<OutModel> queryHealthFoodInfo(QueryModel model)
	{
		List<OutModel> argArgs = pQueryDAO.queryHealthFoodInfo(model);
		if (argArgs != null && argArgs.size() > 0)
		{
			for (int nItem = 0; nItem < argArgs.size(); nItem++)
			{
				model.setType(Integer.parseInt(argArgs.get(nItem).getA()));
				List<OutModel> argFlys = pQueryDAO.queryHealthFoodItemInfo(model);  
				if (argFlys != null && argFlys.size() > 0)
				{
					for (OutModel outModel : argFlys)
					{
						switch (outModel.getA1())
						{
						case 4:
							argArgs.get(nItem).setD(outModel.getB());
							break;
						case 5:
							argArgs.get(nItem).setE(outModel.getB());
							break;
						case 6:
							argArgs.get(nItem).setF(outModel.getB());
							break;
						case 7:
							argArgs.get(nItem).setG(outModel.getB());
							break;
						case 8:
							argArgs.get(nItem).setH(outModel.getB());
							break;
						case 9:
							argArgs.get(nItem).setI(outModel.getB());
							break;	
						default:
							break;
						}
					}
				}
			}
		}
		return argArgs;
	}
	

	
	/**
	 * 描述信息：加载收理状态
	 * 创建时间：2015年5月4日 下午10:21:49
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<OutModel> queryHealthMentalInfo(QueryModel model)
	{
		return pQueryDAO.queryHealthMentalInfo(model);
	}

	@Transactional(readOnly=true)
	public List<OutModel> queryMentalTestRecord(QueryModel model)
	{
	    return pQueryDAO.queryMentalTestRecord(model);
	}
	
	
	/**
	 * 描述信息：测量血压
	 * 创建时间：2015年5月4日 下午10:26:36
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<OutModel> queryHealthPressureInfo(QueryModel model)
	{
		return pQueryDAO.queryHealthPressureInfo(model);
	}
	
	/**
	 * 描述信息：测量血压 单条
	 * 创建时间：2015年5月4日 下午10:26:36
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public OutModel queryHealthPressureOfOneInfo(QueryModel model)
	{
		return pQueryDAO.queryHealthPressureOfOneInfo(model);
	}
	

	/**
	 * 描述信息：测量心率
	 * 创建时间：2015年5月4日 下午10:26:36
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<OutModel> queryHealthPulseInfo(QueryModel model)
	{
		return pQueryDAO.queryHealthPulseInfo(model);
	}
	
	/**
	 * 描述信息：测量血糖
	 * 创建时间：2015年5月4日 下午10:26:36
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<OutModel> queryHealthGlucoseInfo(QueryModel model)
	{
		List<OutModel> argArgs = null;
		List<OutModel> argFlys = pQueryDAO.queryHealthGlucoseInfo(model);
		if (argFlys != null && argFlys.size() > 0)
		{
			argArgs = new ArrayList<OutModel>();
			for (OutModel outModel : argFlys)
			{
				if (outModel.getA() != null && outModel.getA().trim().length() > 0)
				{
					OutModel mOutModel = new OutModel();
					mOutModel.setA(outModel.getA());
					mOutModel.setB(outModel.getB());
					mOutModel.setA1(0);
					if (outModel.getA() != null && outModel.getA().trim().length() > 0)
					{
						argArgs.add(mOutModel);
					}
				}
				
				if (outModel.getC() != null && outModel.getC().trim().length() > 0)
				{
					OutModel mOutModel = new OutModel();
					mOutModel.setA(outModel.getC());
					mOutModel.setB(outModel.getD());
					mOutModel.setA1(1);
					if (outModel.getC() !=null && outModel.getC().trim().length() > 0)
					{
						argArgs.add(mOutModel);
					}
				}
			}
			
			Collections.sort(argArgs, new Comparator<OutModel>() {
	            public int compare(OutModel arg0, OutModel arg1) {
	                return arg0.getA().compareTo(arg1.getA());
	            }
	        });
		}
		return argArgs;
	}
	

	/**
	 * 描述信息：加载单条血糖记录
	 * 创建时间：2015年6月6日 上午10:16:49
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public OutModel queryHealthGlucoseOfOneInfo(QueryModel model)
	{
		OutModel outModel = pQueryDAO.queryHealthGlucoseOfOneInfo(model);
		if (outModel == null)
		{
			outModel = pQueryDAO.queryHealthGlucoseOfTwoInfo(model);
		}
		else 
		{
			OutModel model2 = pQueryDAO.queryHealthGlucoseOfTwoInfo(model);
			if (model2 != null)
			{
				outModel.setC(model2.getC());
				outModel.setD(model2.getD());
			}
		}
		
		return outModel;
	}
	
	
	/**
	 * 描述信息：测量体温
	 * 创建时间：2015年5月4日 下午10:26:36
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<OutModel> queryHealthThermometerInfo(QueryModel model)
	{
		return pQueryDAO.queryHealthThermometerInfo(model);
	}
	
	/**
	 * 描述信息：加载最近一条体温
	 * 创建时间：2015年6月6日 上午10:17:19
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public OutModel queryHealthThermometerOfOneInfo(QueryModel model)
	{
		return pQueryDAO.queryHealthThermometerOfOneInfo(model);
	}
	
	/**
	 * 描述信息：处理健康报告
	 * 创建时间：2015年5月5日 下午1:30:47
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public int modifyHealthRepeatInfo(HealthReportModel model)
	{
		// 删除健康报告
		pQueryDAO.delHealthRepeatInfo(model);
		
		// 插入健康报告
		return pQueryDAO.addHealthRepeatInfo(model);
	}
	
	
	/**
	 * 描述信息：加载健康报告记录信息
	 * 创建时间：2015年5月5日 下午2:14:24
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public HealthReportModel queryHealthReportInfo(HealthReportModel model)
	{
		return pQueryDAO.queryHealthReportInfo(model);
	}

	
	
	/**
	 * 描述信息：按月 运动
	 * 创建时间：2015年5月5日 下午5:48:10
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<OutModel> queryHealthSportMonthInfo(QueryModel model)
	{
		return pQueryDAO.queryHealthSportMonthInfo(model);
	}

	
	/**
	 * 描述信息：按月 运动合计与日均
	 * 创建时间：2015年5月5日 下午5:48:10
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public OutModel queryHealthSportMonthFxInfo(QueryModel model)
	{
		return pQueryDAO.queryHealthSportMonthFxInfo(model);
	}

	/**
	 * 描述信息：按月饮食
	 * 创建时间：2015年5月5日 下午5:48:10
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<OutModel> queryHealthFoodMonthInfo(QueryModel model)
	{
		return pQueryDAO.queryHealthFoodMonthInfo(model);
	}

	
	
	/**
	 * 描述信息：按月  心理状态
	 * 创建时间：2015年5月5日 下午5:48:10
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public OutModel queryHealthMentalMonthInfo(QueryModel model)
	{
		OutModel mOutModel = null;
		List<OutModel> argFlys = pQueryDAO.queryHealthMentalMonthInfo(model);
		if (argFlys != null && argFlys.size() >0)
		{
			mOutModel = new OutModel();
			for (OutModel outModel : argFlys)
			{
				mOutModel.setA5(mOutModel.getA5() + outModel.getA2());
				//心理状态  1：开心 2：平静 3：沮丧  4：烦躁
				switch (outModel.getA1())
				{
					case 1:
						mOutModel.setA2(outModel.getA2());
					break;
					
					case 2:
						mOutModel.setA3(outModel.getA2());
					break;
					
					case 3:
						mOutModel.setA4(outModel.getA2());
					break;
					
					case 4:
						mOutModel.setA1(outModel.getA2());
					break;

				default:
					break;
				}
			}
		}
		return mOutModel;
	}
	
	@Transactional(readOnly=true)
	public OutModel queryMentalTestAvgRecord(QueryModel model)
	{
	    return pQueryDAO.queryMentalTestAvgRecord(model);
	}

	
	/**
	 * 描述信息：按月 血压
	 * 创建时间：2015年5月5日 下午5:48:10
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<OutModel> queryHealthPressureMonthInfo(QueryModel model)
	{
		return pQueryDAO.queryHealthPressureMonthInfo(model);
	}

	
	/**
	 * 描述信息：
	 * 创建时间：2015年5月5日 下午5:48:10
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<OutModel> queryHealthPulseMonthInfo(QueryModel model)
	{
		return pQueryDAO.queryHealthPulseMonthInfo(model);
	}

	
	/**
	 * 描述信息：
	 * 创建时间：2015年5月5日 下午5:48:10
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<OutModel> queryHealthGlucoseMonthInfo(QueryModel model)
	{
		return pQueryDAO.queryHealthGlucoseMonthInfo(model);
	}

	
	/**
	 * 描述信息：
	 * 创建时间：2015年5月5日 下午5:48:10
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<OutModel> queryHealthThermometerMonthInfo(QueryModel model)
	{
		return pQueryDAO.queryHealthThermometerMonthInfo(model);
	}
	
	
	
	/**
	 * 描述信息：用药记录
	 * 创建时间：2015年5月8日 上午5:57:14
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<OutModel> queryHealthMedicineInfo(QueryModel model)
	{
		return pQueryDAO.queryHealthMedicineInfo(model);
	}
	
	
	
	/**
	 * 描述信息：用药记录 按月
	 * 创建时间：2015年5月8日 上午5:57:14
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<OutModel> queryHealthMedicineMonthInfo(QueryModel model)
	{
		return pQueryDAO.queryHealthMedicineMonthInfo(model);
	}
	

	/**
	 * 描述信息：分页加载 用药记录总记录数
	 * 创建时间：2015年5月9日 上午6:04:37
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public long queryMedicineInfoCnt(QueryModel model)
	{
		return pQueryDAO.queryMedicineInfoCnt(model);
	}
	
	
	/**
	 * 描述信息：分页加载 用药记录
	 * 创建时间：2015年5月9日 上午6:04:37
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<MedicineModel> queryMedicineInfo(QueryModel model)
	{
		return pQueryDAO.queryMedicineInfo(model);
	}
	
	
	/**
	 * 描述信息：用户药管理
	 * 创建时间：2015年5月9日 上午6:35:45
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public MedicineModel queryMedicineInfoById(QueryModel model)
	{
		return pQueryDAO.queryMedicineInfoById(model);
	}
	
	
	/**
	 * 描述信息：增加用药记录
	 * 创建时间：2015年5月9日 上午6:06:01
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public int addMedicineInfo(MedicineModel model)
	{
		return pQueryDAO.addMedicineInfo(model);
	}
	
	
	/**
	 * 描述信息：修改用药记录
	 * 创建时间：2015年5月9日 上午6:06:01
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public int modifyMedicineInfo(MedicineModel model)
	{
		return pQueryDAO.modifyMedicineInfo(model);
	}
	
	
	/**
	 * 描述信息：删除用药记录
	 * 创建时间：2015年5月9日 上午6:06:01
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public int delMedicineInfo(MedicineModel model)
	{
		return pQueryDAO.delMedicineInfo(model);
	}
	
	
	/**
	 * 描述信息：插入注册用户信息
	 * 创建时间：2015年8月3日 下午3:33:03
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public int addUserInfo(UserModel model)
	{
		return pQueryDAO.addUserInfo(model);
	}
	
	
	/**
	 * 描述信息：判断用户是否存在
	 * 创建时间：2015年8月3日 下午3:42:16
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	@Transactional(readOnly=true)
	public int queryUserCountWithUserName(UserModel model)
	{
		return pQueryDAO.queryUserCountWithUserName(model);
	}
}
