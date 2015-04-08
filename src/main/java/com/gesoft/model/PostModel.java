/**
 * 文件名称：PostModel.java
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
public class PostModel extends BaseModel
{
	private static final long serialVersionUID = 6187201883733240500L;
	private long id;
	private String title;
	private String content;
	private String stime;
	private String userName;
	public long getId()
	{
		return id;
	}
	public void setId(long id)
	{
		this.id = id;
	}
	public String getTitle()
	{
		return title;
	}
	public void setTitle(String title)
	{
		this.title = title;
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
	public String getUserName()
	{
		return userName;
	}
	public void setUserName(String userName)
	{
		this.userName = userName;
	}
}
