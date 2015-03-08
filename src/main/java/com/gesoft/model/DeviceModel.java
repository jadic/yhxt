/**
 * 文件名称：DerviceModel.java
 * 版权所有：Copyright njty
 * 创建时间：2015年3月2日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.model;

/**
 * 设备管理
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
public class DeviceModel extends BaseModel
{
	private static final long serialVersionUID = 108061749213717990L;
	private long id;
	private long type;
	private String typeName;
	private String no;
	private String model;
	private String sim;
	private String buyTime;
	private long buyId;
	
	
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
	public long getId()
	{
		return id;
	}
	public void setId(long id)
	{
		this.id = id;
	}
	public long getType()
	{
		return type;
	}
	public void setType(long type)
	{
		this.type = type;
	}
	public String getNo()
	{
		return no;
	}
	public void setNo(String no)
	{
		this.no = no;
	}
	public String getModel()
	{
		return model;
	}
	public void setModel(String model)
	{
		this.model = model;
	}
	public String getSim()
	{
		return sim;
	}
	public void setSim(String sim)
	{
		this.sim = sim;
	}
	public String getTypeName()
	{
		return typeName;
	}
	public void setTypeName(String typeName)
	{
		this.typeName = typeName;
	}
	
}
