/**
 * 文件名称：HappyHostReportModel.java
 * 版权所有：Copyright njty
 * 创建时间：2015年6月2日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.model;

/**
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
public class HappyHostReportModel extends BaseModel
{
	private static final long serialVersionUID = -9140959093865995059L;
	private int id;
	private int tableType;
	private int reportFlag;
	private String stime;
	private int tableId;
	
	public int getTableId()
	{
		return tableId;
	}
	public void setTableId(int tableId)
	{
		this.tableId = tableId;
	}
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public int getTableType()
	{
		return tableType;
	}
	public void setTableType(int tableType)
	{
		this.tableType = tableType;
	}
	public int getReportFlag()
	{
		return reportFlag;
	}
	public void setReportFlag(int reportFlag)
	{
		this.reportFlag = reportFlag;
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
