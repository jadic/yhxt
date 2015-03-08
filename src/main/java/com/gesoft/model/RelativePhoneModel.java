/**
 * 文件名称：RelativePhoneModel.java
 * 版权所有：Copyright njty
 * 创建时间：2015年3月8日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.model;

/**
 * 亲情号码
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
public class RelativePhoneModel extends BaseModel
{
	private static final long serialVersionUID = 7519972090734304685L;
	private long id;
	private long userId;
	private int type;
	private String typeName;
	private String cellPhone;
	private String name;
	private String tel;
	private String address;
	
	public String getTypeName()
	{
		switch (this.type)
		{
		case 0:
			this.typeName = "家庭成员";
			break;
		case 1:
			this.typeName = "亲戚";
			break;
		case 2:
			this.typeName = "朋友";
			break;
		case 3:
			this.typeName = "同事";
			break;
		default:
			this.typeName = "其它";
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
	public long getUserId()
	{
		return userId;
	}
	public void setUserId(long userId)
	{
		this.userId = userId;
	}
	public int getType()
	{
		return type;
	}
	public void setType(int type)
	{
		this.type = type;
	}
	public String getCellPhone()
	{
		return cellPhone;
	}
	public void setCellPhone(String cellPhone)
	{
		this.cellPhone = cellPhone;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getTel()
	{
		return tel;
	}
	public void setTel(String tel)
	{
		this.tel = tel;
	}
	public String getAddress()
	{
		return address;
	}
	public void setAddress(String address)
	{
		this.address = address;
	}
	
}
