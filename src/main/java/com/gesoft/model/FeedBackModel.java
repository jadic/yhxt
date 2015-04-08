/**
 * 文件名称：FeedBackModel.java
 * 版权所有：Copyright njty
 * 创建时间：2015年4月7日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.model;

/**
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
public class FeedBackModel extends BaseModel
{
	private static final long serialVersionUID = -3168069340254819989L;
	private long id;
	private int type;
	private String content;
	private String stime;
	
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
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	public String getStime()
	{
		return stime;
	}
	public void setStime(String stime)
	{
		this.stime = stime;
	}
}
