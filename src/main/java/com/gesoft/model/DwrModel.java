/**
 * 文件名称：DwrModel.java
 * 版权所有：Copyright gesoft
 * 创建时间：2015年1月26日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.model;

import org.directwebremoting.annotations.DataTransferObject;
import org.directwebremoting.annotations.RemoteProperty;

/**
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
@DataTransferObject
public class DwrModel
{
	private String msgKey;
	private String msgVal;
	
	@RemoteProperty
	public String getMsgKey()
	{
		return msgKey;
	}
	public void setMsgKey(String msgKey)
	{
		this.msgKey = msgKey;
	}
	@RemoteProperty
	public String getMsgVal()
	{
		return msgVal;
	}
	public void setMsgVal(String msgVal)
	{
		this.msgVal = msgVal;
	}
}
