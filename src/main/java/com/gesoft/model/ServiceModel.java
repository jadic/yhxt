/**
 * 文件名称：ServiceModel.java
 * 版权所有：Copyright njty
 * 创建时间：2015年3月3日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.model;

/**
 * 服务管理
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
public class ServiceModel extends BaseModel
{
	private static final long serialVersionUID = 5705483179208187468L;
	private long id;
	private long buyId; //购买表Id
	private long sdid;  //关联关系ID
	private int type;
	private String typeName;
	private String name;
	private String content;
	private long creatorId;
	private String sdate;
	private String edate;
	private String createTime;
	private String memo;
	private String icon;
	private String userName;
	private String buyTime;
	private String doctorIds;
	private int doctorId;
	
	
	
	public long getSdid()
	{
		return sdid;
	}
	public void setSdid(long sdid)
	{
		this.sdid = sdid;
	}
	public long getBuyId()
	{
		return buyId;
	}
	public void setBuyId(long buyId)
	{
		this.buyId = buyId;
	}
	public String getBuyTime()
	{
		return buyTime;
	}
	public void setBuyTime(String buyTime)
	{
		this.buyTime = buyTime;
	}
	public String getTypeName()
	{
		switch (this.type)
		{
		case 1:
			this.typeName = "平台创建";
			break;
		case 2:
			this.typeName = "医护联系人创建";
			break;
		case 3:
			this.typeName = "第三方服务";
			break;	
		default:
			this.typeName = "-";
			break;
		}
		return typeName;
	}
	public void setTypeName(String typeName)
	{
		this.typeName = typeName;
	}
	public long getId()
	{
		return id;
	}
	public void setId(long id)
	{
		this.id = id;
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
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	public long getCreatorId()
	{
		return creatorId;
	}
	public void setCreatorId(long creatorId)
	{
		this.creatorId = creatorId;
	}
	public String getSdate()
	{
		return sdate;
	}
	public void setSdate(String sdate)
	{
		this.sdate = sdate;
	}
	public String getEdate()
	{
		return edate;
	}
	public void setEdate(String edate)
	{
		this.edate = edate;
	}
	public String getCreateTime()
	{
		return createTime;
	}
	public void setCreateTime(String createTime)
	{
		this.createTime = createTime;
	}
	public String getMemo()
	{
		return memo;
	}
	public void setMemo(String memo)
	{
		this.memo = memo;
	}
	public String getIcon()
	{
		return icon;
	}
	public void setIcon(String icon)
	{
		this.icon = icon;
	}
	public String getUserName()
	{
		return userName;
	}
	public void setUserName(String userName)
	{
		this.userName = userName;
	}
    public String getDoctorIds() {
        return doctorIds;
    }
    public void setDoctorIds(String doctorIds) {
        this.doctorIds = doctorIds;
    }
    public int getDoctorId() {
        return doctorId;
    }
    public void setDoctorId(int doctorId) {
        this.doctorId = doctorId;
    }
	
}
