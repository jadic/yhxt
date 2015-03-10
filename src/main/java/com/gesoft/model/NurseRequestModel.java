/**
 * 文件名称：NurseRequestModel.java
 * 版权所有：Copyright njty
 * 创建时间：2015年3月11日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.model;

/**
 * 医护人员申请表
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
public class NurseRequestModel extends BaseModel
{
	private static final long serialVersionUID = -8716838018231091911L;
	private long id;
	private long nurseId;
	private String nurseName;
	private int status;		//0：请求中    1：同意     2：拒绝
	private String statusStr;
	private String requestTime;		// 请求时间
	private String responseTime; 	// 回复时间
	private String memo;			// 备注
	
	
	public String getNurseName()
	{
		return nurseName;
	}
	public void setNurseName(String nurseName)
	{
		this.nurseName = nurseName;
	}
	public long getId()
	{
		return id;
	}
	public void setId(long id)
	{
		this.id = id;
	}
	public long getNurseId()
	{
		return nurseId;
	}
	public void setNurseId(long nurseId)
	{
		this.nurseId = nurseId;
	}
	public int getStatus()
	{
		return status;
	}
	public void setStatus(int status)
	{
		this.status = status;
	}
	public String getStatusStr()
	{
		switch (this.status)
		{
		case 0:
			this.statusStr = "请求中";
			break;
		case 1:
			this.statusStr = "同意";
			break;
		case 2:
			this.statusStr = "拒绝";
			break;
		default:
			break;
		}
		return statusStr;
	}
	public void setStatusStr(String statusStr)
	{
		this.statusStr = statusStr;
	}
	public String getRequestTime()
	{
		return requestTime;
	}
	public void setRequestTime(String requestTime)
	{
		this.requestTime = requestTime;
	}
	public String getResponseTime()
	{
		return responseTime;
	}
	public void setResponseTime(String responseTime)
	{
		this.responseTime = responseTime;
	}
	public String getMemo()
	{
		return memo;
	}
	public void setMemo(String memo)
	{
		this.memo = memo;
	}
}
