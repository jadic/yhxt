/**
 * 文件名称：LogModel.java
 * 版权所有：Copyright gesoft
 * 创建时间：2015年1月30日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.model;


/**
 * 用户操作日志与登录日志
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
public class LogModel extends BaseModel
{
	private static final long serialVersionUID = 1043637554384050477L;

	private long id;
	private long userId;
	private String ip;
	private String stime;
	private String operFun; // 功能
	private String operMed; // 调用访法
	private String operClass; // 调用类
	private String operParam; // 传入参数
	private int operFlag; // 操作类型（1：登录，0：退出）
	
	
	public long getId()
	{
		return id;
	}

	public void setId(long id)
	{
		this.id = id;
	}

	public long getUserId()
	{
		return userId;
	}

	public void setUserId(long userId)
	{
		this.userId = userId;
	}

	public String getIp()
	{
		return ip;
	}

	public void setIp(String ip)
	{
		this.ip = ip;
	}

	public String getStime()
	{
		return stime;
	}

	public void setStime(String stime)
	{
		this.stime = stime;
	}

	public String getOperFun()
	{
		return operFun;
	}

	public void setOperFun(String operFun)
	{
		this.operFun = operFun;
	}

	public String getOperMed()
	{
		return operMed;
	}

	public void setOperMed(String operMed)
	{
		this.operMed = operMed;
	}

	public String getOperClass()
	{
		return operClass;
	}

	public void setOperClass(String operClass)
	{
		this.operClass = operClass;
	}

	public String getOperParam()
	{
		return operParam;
	}

	public void setOperParam(String operParam)
	{
		this.operParam = operParam;
	}

	public int getOperFlag()
	{
		return operFlag;
	}

	public void setOperFlag(int operFlag)
	{
		this.operFlag = operFlag;
	}

}
