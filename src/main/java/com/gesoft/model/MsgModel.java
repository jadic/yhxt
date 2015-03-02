/**
 * 文件名称：MsgModel.java
 * 版权所有：Copyright gesoft
 * 创建时间：2015年1月29日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.model;

import java.util.ArrayList;
import java.util.List;

import com.gesoft.util.Constants;

/**
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
public class MsgModel implements Constants
{

	private long total;
	private String msg = GLOBAL_MSG_FAIL;
	private boolean success;
	@SuppressWarnings("rawtypes")
	private List<?> rows = new ArrayList();
	@SuppressWarnings("rawtypes")
	private List<?> footer = new ArrayList();
	
	public List<?> getFooter()
	{
		return footer;
	}
	public void setFooter(List<?> footer)
	{
		this.footer = footer;
	}
	public long getTotal()
	{
		return total;
	}
	public void setTotal(long total)
	{
		this.total = total;
		if (this.total > 0)
		{
			this.success = GLOBAL_MSG_BOOL_SUCCESS;
			this.msg = GLOBAL_MSG_SUCCESS;
		}
		else 
		{
			this.success = GLOBAL_MSG_BOOL_FAIL;
			this.msg = GLOBAL_MSG_FAIL;
		}
	}
	public String getMsg()
	{
		return msg;
	}
	public void setMsg(String msg)
	{
		this.msg = msg;
	}
	public boolean isSuccess()
	{
		return success;
	}
	public void setSuccess(boolean success)
	{
		this.success = success;
		if (this.success == GLOBAL_MSG_BOOL_FAIL)
		{
			this.msg = GLOBAL_MSG_FAIL;
		}
		else 
		{
			this.msg = GLOBAL_MSG_SUCCESS;
		}
	}
	public List<?> getRows()
	{
		return rows;
	}
	public void setRows(List<?> rows)
	{
		this.rows = rows;
	}

}
