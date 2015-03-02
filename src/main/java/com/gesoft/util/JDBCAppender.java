/**
 * 文件名称：JDBCAppender.java
 * 版权所有：Copyright gesoft
 * 创建时间：2015年1月30日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.util;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Iterator;

import org.apache.log4j.spi.LoggingEvent;

/**
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
public class JDBCAppender extends org.apache.log4j.jdbc.JDBCAppender
{
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public void flushBuffer()
	{ removes.ensureCapacity(buffer.size());
		for (Iterator i = buffer.iterator(); i.hasNext();)
			try
			{
				LoggingEvent logEvent = (LoggingEvent) i.next();
				 PreparedStatement stmt = getConnection().prepareStatement("INSERT INTO tab_log4j(stamp,thread, info_level,class,message) VALUES (?, ?, ?, ?, ?)");
				 stmt.setString(1, SystemUtils.funFormatCurrentTimeMillisInfo(logEvent.getTimeStamp()));
				 stmt.setString(2, logEvent.getThreadName());
				 stmt.setString(3, logEvent.getLevel().toString());
				 stmt.setString(4, logEvent.getFQNOfLoggerClass());
				 stmt.setString(5, getLayout().format(logEvent));
				 stmt.executeUpdate();
				 
				//String sql = getLogStatement(logEvent);
				//execute(sql);
				removes.add(logEvent);
			}
			catch (SQLException e)
			{
				super.errorHandler.error("Failed to excute sql", e, 2);
			}
			finally
			{
				
			}

		buffer.removeAll(removes);
		removes.clear();
	}

}
