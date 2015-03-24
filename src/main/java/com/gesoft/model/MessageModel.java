/**
 * 文件名称：MessageModel.java
 * 版权所有：Copyright njty
 * 创建时间：2015年3月11日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.model;

/**
 * 发送消息
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
public class MessageModel extends BaseModel
{
	private static final long serialVersionUID = -2537455191034748668L;
	private long id;
	private long senderId;
	private long receiverId;
	private String sendTime;
	private int status;			// 0：未读   1：已读
	private String statusStr;
	private String readTime;
	private String msg;
	private String name;
	private String receiverIds;
	
	
	public String getReceiverIds()
	{
		return receiverIds;
	}
	public void setReceiverIds(String receiverIds)
	{
		this.receiverIds = receiverIds;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public long getId()
	{
		return id;
	}
	public void setId(long id)
	{
		this.id = id;
	}
	public long getSenderId()
	{
		return senderId;
	}
	public void setSenderId(long senderId)
	{
		this.senderId = senderId;
	}
	public long getReceiverId()
	{
		return receiverId;
	}
	public void setReceiverId(long receiverId)
	{
		this.receiverId = receiverId;
	}
	public String getSendTime()
	{
		return sendTime;
	}
	public void setSendTime(String sendTime)
	{
		this.sendTime = sendTime;
	}
	public int getStatus()
	{
		return status;
	}
	public void setStatus(int status)
	{
		this.status = status;
	}
	public String getStatusStr()
	{
		switch (this.status)
		{
		case 0:
			this.statusStr = "未读";
			break;
		case 1:
			this.statusStr = "已读";
			break;
		default:
			break;
		}
		return statusStr;
	}
	public void setStatusStr(String statusStr)
	{
		this.statusStr = statusStr;
	}
	public String getReadTime()
	{
		return readTime;
	}
	public void setReadTime(String readTime)
	{
		this.readTime = readTime;
	}
	public String getMsg()
	{
		return msg;
	}
	public void setMsg(String msg)
	{
		this.msg = msg;
	}
}
