/**
 * 文件名称：AUserService.java
 * 版权所有：Copyright gesoft
 * 创建时间：2015年2月2日
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
import com.gesoft.dao.AUserDAO;
import com.gesoft.model.UserModel;

/**
 * 用户管理
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
@Service
@Transactional
public class AUserService extends EntityService<UserModel, Long>
{
	@Resource
	private AUserDAO aUserDAO;	

	@Override
	protected EntityDAO<UserModel, Long> getEntityDao()
	{
		return this.aUserDAO;
	}
	
	public int resetUserPassword(UserModel model) {
	    return this.aUserDAO.resetUserPassword(model);
	}
	
	public List<UserModel> queryParents(UserModel model) {
	    return this.aUserDAO.queryParents(model);
	}
	
	public int queryUserCountWithUsrName(UserModel model) {
	    return this.aUserDAO.queryUserCountWithUsrName(model);
	}
	
	public int updateUserInfoForApp(UserModel model) {
	    return this.aUserDAO.updateUserInfoForApp(model);
	}
	
}
