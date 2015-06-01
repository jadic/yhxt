/**
 * 文件名称：HappyHostReplyModel.java
 * 版权所有：Copyright njty
 * 创建时间：2015年5月27日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.model;

/**
 * APP快乐驿站 回复表
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
public class HappyHostReplyModel extends BaseModel
{
	private static final long serialVersionUID = 6361302838420597939L;
	private int id;
	private int postId;
	private String content;
	private String stime;
	private int reportFlag;
	private String photo;
	
	public String getPhoto()
	{
		if (photo == null || photo.trim().length() <= 5)
		{
			this.photo = "/app/self/images/setting_load_pic.png";
		}
		return photo;
	}
	public void setPhoto(String photo)
	{
		this.photo = photo;
	}
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public int getPostId()
	{
		return postId;
	}
	public void setPostId(int postId)
	{
		this.postId = postId;
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
	public int getReportFlag()
	{
		return reportFlag;
	}
	public void setReportFlag(int reportFlag)
	{
		this.reportFlag = reportFlag;
	}
}
