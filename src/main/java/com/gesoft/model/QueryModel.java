/**
 * 文件名称：QueryModel.java
 * 版权所有：Copyright njty
 * 创建时间：2015年2月6日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.model;

/**
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
public class QueryModel extends BaseModel
{
	private static final long serialVersionUID = -7896518111818576761L;
	
	
	private long id;
	private String name;
	private long nurseId;
	private int adviceType;
	private int deviceType;
	private int type;
	private int creatorId;	// 创建人id,查询医护联系人创建的活动和服务,
	private int deptId;		// 科室
	private int hospitalId; // 医院
	private int adviceId;
	private int serviceId;
	private int activityId;
	private int doctorId;
	private String doctorIds;
	private String startTime;
	private String endTime;
	private String command;
	private long senderId;
	
	
	public long getSenderId()
	{
		return senderId;
	}
	public void setSenderId(long senderId)
	{
		this.senderId = senderId;
	}
	public String getCommand()
	{
		return command;
	}
	public void setCommand(String command)
	{
		this.command = command;
	}
	public String getStartTime()
	{
		return startTime;
	}
	public void setStartTime(String startTime)
	{
		this.startTime = startTime;
	}
	public String getEndTime()
	{
		return endTime;
	}
	public void setEndTime(String endTime)
	{
		this.endTime = endTime;
	}
	public int getDeptId()
	{
		return deptId;
	}
	public void setDeptId(int deptId)
	{
		this.deptId = deptId;
	}
	public int getHospitalId()
	{
		return hospitalId;
	}
	public void setHospitalId(int hospitalId)
	{
		this.hospitalId = hospitalId;
	}
	public long getNurseId()
	{
		return nurseId;
	}
	public void setNurseId(long nurseId)
	{
		this.nurseId = nurseId;
	}
	public int getDeviceType()
	{
		return deviceType;
	}
	public void setDeviceType(int deviceType)
	{
		this.deviceType = deviceType;
	}
	public int getType()
	{
		return type;
	}
	public void setType(int type)
	{
		this.type = type;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public long getId()
	{
		return id;
	}
	public void setId(long id)
	{
		this.id = id;
	}
	public int getAdviceType()
	{
		return adviceType;
	}
	public void setAdviceType(int adviceType)
	{
		this.adviceType = adviceType;
	}
    public int getCreatorId() {
        return creatorId;
    }
    public void setCreatorId(int creatorId) {
        this.creatorId = creatorId;
    }
    public int getAdviceId() {
        return adviceId;
    }
    public void setAdviceId(int adviceId) {
        this.adviceId = adviceId;
    }
    public int getServiceId() {
        return serviceId;
    }
    public void setServiceId(int serviceId) {
        this.serviceId = serviceId;
    }
    public int getActivityId() {
        return activityId;
    }
    public void setActivityId(int activityId) {
        this.activityId = activityId;
    }
    public int getDoctorId() {
        return doctorId;
    }
    public void setDoctorId(int doctorId) {
        this.doctorId = doctorId;
    }
    public String getDoctorIds() {
        return doctorIds;
    }
    public void setDoctorIds(String doctorIds) {
        this.doctorIds = doctorIds;
    }
    
}
