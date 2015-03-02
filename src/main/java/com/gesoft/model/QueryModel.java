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
	private long typeId;
	private long customId;
	private long pageCnt;
	private String typeName;
	private String customName;
	private String title;
	
	public String getTitle()
	{
		return title;
	}
	public void setTitle(String title)
	{
		this.title = title;
	}
	public long getPageCnt()
	{
		return pageCnt;
	}
	public void setPageCnt(long pageCnt)
	{
		this.pageCnt = pageCnt;
	}
	public long getId()
	{
		return id;
	}
	public void setId(long id)
	{
		this.id = id;
	}
	public long getTypeId()
	{
		return typeId;
	}
	public void setTypeId(long typeId)
	{
		this.typeId = typeId;
	}
	public long getCustomId()
	{
		return customId;
	}
	public void setCustomId(long customId)
	{
		this.customId = customId;
	}
	public String getTypeName()
	{
		return typeName;
	}
	public void setTypeName(String typeName)
	{
		this.typeName = typeName;
	}
	public String getCustomName()
	{
		return customName;
	}
	public void setCustomName(String customName)
	{
		this.customName = customName;
	}
	
}
