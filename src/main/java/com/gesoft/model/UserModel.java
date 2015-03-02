/**
 * 文件名称：UserModel.java
 * 版权所有：Copyright gesoft
 * 创建时间：2015年1月30日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.model;

import com.gesoft.util.SystemUtils;

/**
 * 用户登录
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
public class UserModel extends BaseModel
{
	private static final long serialVersionUID = 4278170559943436904L;

	private long userId;
	private String userName;
	private String userPwd;
	private String RoleName;
	private String realName; // 真实姓名
	private String userTel;
	private String userMemo;
	private String stime = SystemUtils.getCurrentSystemTime(); 
	
	// 验证码
	private String rand;
	
	public long getUserId()
	{
		return userId;
	}
	public void setUserId(long userId)
	{
		this.userId = userId;
	}
	public String getUserName()
	{
		return userName;
	}
	public void setUserName(String userName)
	{
		this.userName = userName;
	}
	public String getUserPwd()
	{
		return userPwd;
	}
	public void setUserPwd(String userPwd)
	{
		this.userPwd = userPwd;
	}
	public String getRand()
	{
		return rand;
	}
	public void setRand(String rand)
	{
		this.rand = rand;
	}
	public String getRoleName()
	{
		return RoleName;
	}
	public void setRoleName(String roleName)
	{
		RoleName = roleName;
	}
	public String getRealName()
	{
		return realName;
	}
	public void setRealName(String realName)
	{
		this.realName = realName;
	}
	public String getUserTel()
	{
		return userTel;
	}
	public void setUserTel(String userTel)
	{
		this.userTel = userTel;
	}
	public String getUserMemo()
	{
		return userMemo;
	}
	public void setUserMemo(String userMemo)
	{
		this.userMemo = userMemo;
	}
	public String getStime()
	{
		return stime;
	}
	public void setStime(String stime)
	{
		this.stime = stime;
	}
	
}
