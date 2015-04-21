/**
 * 文件名称：BloodModel.java
 * 版权所有：Copyright njty
 * 创建时间：2015年4月21日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.model;

/**
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
public class BloodModel extends BaseModel
{
	private int value;
	private String stime;
	private int type;
	public int getValue()
	{
		return value;
	}
	public void setValue(int value)
	{
		this.value = value;
	}
	public String getStime()
	{
		return stime;
	}
	public void setStime(String stime)
	{
		this.stime = stime;
	}
	public int getType()
	{
		return type;
	}
	public void setType(int type)
	{
		this.type = type;
	}
	
}
