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
	private int adviceType;
	
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
}
