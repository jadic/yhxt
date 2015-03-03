/**
 * 文件名称：DevTypeModel.java
 * 版权所有：Copyright njty
 * 创建时间：2015年3月3日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.model;

/**
 * 设备类型
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
public class DevTypeModel extends BaseModel
{
	private static final long serialVersionUID = 5957802593832563439L;
	private long id;
	private String name;
	
	public long getId()
	{
		return id;
	}
	public void setId(long id)
	{
		this.id = id;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	
}
