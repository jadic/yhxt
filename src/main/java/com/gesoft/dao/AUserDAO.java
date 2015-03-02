/**
 * 文件名称：AUserDAO.java
 * 版权所有：Copyright gesoft
 * 创建时间：2015年2月2日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.dao;

import org.springframework.stereotype.Repository;

import com.gesoft.common.EntityDAOImpl;
import com.gesoft.model.LogModel;
import com.gesoft.model.UserModel;

/**
 * 用户管理
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
@Repository
public class AUserDAO extends EntityDAOImpl<UserModel, Long>
{
	@Override
    public String getMybatisSqlMapNamespace()
    {
        return "UserMapper";
    }
	

	/**
	 * 描述信息：根据用户名加载用户信息
	 * 创建时间：2015年1月31日 上午9:27:47
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public UserModel getByName(UserModel model)
	{
		return getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".getByName", model);
	}

	
	/**
	 * 描述信息：插入用户登录与退出日志
	 * 创建时间：2015年1月31日 上午10:12:20
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return
	 */
	public int addUserLogsInfo(LogModel model)
	{
		return getSqlSession().insert(getMybatisSqlMapNamespace() + ".addUserLogsInfo", model);
	}
}
