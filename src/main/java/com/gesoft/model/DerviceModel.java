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
public class DerviceModel extends BaseModel
{
	private long id;
	private int type;
	private String no;
	private String model;
	private String sim;
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
}
