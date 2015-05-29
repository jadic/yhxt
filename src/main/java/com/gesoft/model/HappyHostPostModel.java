/**
 * 文件名称：HappyHostPostModel.java
 * 版权所有：Copyright njty
 * 创建时间：2015年5月27日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.model;

/**
 * APP快乐驿站话题
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
public class HappyHostPostModel extends BaseModel
{
	private static final long serialVersionUID = -1460335102484775819L;
	private int id;
	private int happyHostId;
	private String title;
	private String content;
	private String stime;
	private int laudCnt;
	private int replyCnt;
	private int reportFlag;
	private String photo;
	private int laud = 0;
	
	
	public int getLaud()
	{
		return laud;
	}
	public void setLaud(int laud)
	{
		this.laud = laud;
	}
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
	public int getHappyHostId()
	{
		return happyHostId;
	}
	public void setHappyHostId(int happyHostId)
	{
		this.happyHostId = happyHostId;
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
	public int getLaudCnt()
	{
		return laudCnt;
	}
	public void setLaudCnt(int laudCnt)
	{
		this.laudCnt = laudCnt;
	}
	public int getReplyCnt()
	{
		return replyCnt;
	}
	public void setReplyCnt(int replyCnt)
	{
		this.replyCnt = replyCnt;
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
