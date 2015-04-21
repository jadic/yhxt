/**
 * 文件名称：CommentModel.java
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
public class CommentModel extends BaseModel
{
	private static final long serialVersionUID = -4027687775816917797L;
	private long id;
	private long pid;
	private String content;
	private String stime;
	private String userName;
	private String photo;
	
	public String getPhoto()
	{
		return photo;
	}
	public void setPhoto(String photo)
	{
		this.photo = photo;
	}
	public long getId()
	{
		return id;
	}
	public void setId(long id)
	{
		this.id = id;
	}
	public long getPid()
	{
		return pid;
	}
	public void setPid(long pid)
	{
		this.pid = pid;
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
