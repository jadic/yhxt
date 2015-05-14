/**
 * 文件名称：ManageDaoInterceptor.java
 * 版权所有：Copyright gesoft
 * 创建时间：2012-07-19
 * 创 建 人：wangcl (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.interceptor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.gesoft.model.LogModel;
import com.gesoft.util.Constants;
import com.gesoft.util.SystemUtils;

/**
 * AOP日志操作功能拦截
 * @author wangcl
 * @version v1.001
 * @since   v1.001
 */
@Aspect
public class ManageDaoInterceptor implements Constants
{
	private static final Logger logger = LoggerFactory.getLogger(ManageDaoInterceptor.class);
	
	@Resource
	private DataSource dataSource;
	
	
	public ManageDaoInterceptor() 
	{  
		
	}
	 
	 
	/**
	 * 描述信息：
	 * 创建时间：2012-07-19 13:47:20
	 * @author wangcl (ln_admin@yeah.net)
	 */
	@Pointcut("!execution (* com.gesoft.service.ALoginLogsService.*(..)) && execution (* com.gesoft.service..*(..)) || execution (* com.gesoft.common.EntityService.*(..))")
	public void anyMethods()
	{
	}

	
	/**
	 * 描述信息：
	 * 创建时间：2012-07-19 13:47:26
	 * @author wangcl (ln_admin@yeah.net)
	 * @param pjp
	 * @return
	 * @throws Throwable
	 */
	@Around("anyMethods()")
	public Object doBasicProfiling(ProceedingJoinPoint pjp) throws Throwable
	{
		long mStartTimer = System.currentTimeMillis();
		Object result = pjp.proceed();
		try
		{
			LogModel model = new LogModel();
			RequestAttributes requestAttributes = RequestContextHolder.getRequestAttributes();  
			HttpSession session = ((ServletRequestAttributes)requestAttributes).getRequest().getSession();  
			if (session != null && session.getAttribute(SESSION_KEY_UID) != null)
			{
				model.setUserId(Long.parseLong(session.getAttribute(SESSION_KEY_UID).toString()));
			}
			model.setOperClass(pjp.getTarget().getClass().toString());
			model.setOperMed(pjp.getSignature().getName());
			model.setStime(SystemUtils.getCurrentSystemTime());
			
			Object[] mObjs = pjp.getArgs();
			if (mObjs != null)
			{
				for (Object object : mObjs)
				{
					if (model.getOperParam() == null)
					{
						model.setOperParam(object.toString());
					}
					model.setOperParam(model.getOperParam() + ", "+ object.toString());
				}
			}
			saveUserOperLogsInfo(model);
		}
		catch (Exception e)
		{
			logger.error("ManageDaoInterceptor doBasicProfiling error：", e);
		}
		SystemUtils.SOUT(SystemUtils.getCurrentSystemTime()+ "  "+pjp.getSignature().getName() + "方法所耗时长为："+(System.currentTimeMillis() - mStartTimer)+" MS");
		return result;
	}
	
	/**
	 * 描述信息：后置通知
	 * 创建时间：2015年1月30日 下午5:01:20
	 * @author WCL (ln_admin@yeah.net)
	 * @param result
	 */
	@AfterReturning(pointcut = "anyMethods()", returning = "result")
	public void doAfterReturning(String result)
	{
		
	}
	
	/**
	 * 描述信息：最终通知
	 * 创建时间：2015年1月30日 下午5:01:12
	 * @author WCL (ln_admin@yeah.net)
	 */
	@After("anyMethods()")
	public void doAfter()
	{
		
	}
	
	/**
	 * 描述信息：提交操作日志（不能用注解DAO/jdbcTemplate方式，如果是查询时，Service层的事务是只读的，不能进行插入操作）
	 * 	只能用这种获取数据源的方式，手动提交数据。
	 * 创建时间：2015年1月30日 下午5:56:24
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 */
	private void saveUserOperLogsInfo(LogModel model)
	{
		Connection conn = null;
		PreparedStatement pst = null;
		try
		{
			conn = dataSource.getConnection();
			conn.setAutoCommit(false);
			int offSize = 1;
			pst = conn.prepareStatement("INSERT INTO TAB_USEROPER_LOGS (USER_ID, IP, STIME, OPER_MED, OPER_CLASS, OPER_PARAM)"
					+ " VALUES (?, ?, ?, ?, ?, ?)");
			pst.setLong(offSize++, model.getUserId());
			pst.setString(offSize++, model.getIp());
			pst.setTimestamp(offSize++, SystemUtils.funTimeStamp(model.getStime()));
			pst.setString(offSize++, model.getOperMed());
			pst.setString(offSize++, model.getOperClass());
			pst.setString(offSize++, model.getOperParam());
			pst.executeUpdate();
			conn.commit();//提交JDBC事务 
			conn.setAutoCommit(true);// 恢复JD
		}
		catch (Exception e)
		{
			logger.error("ManageDaoInterceptor saveUserOperLogsInfo error：", e);
		}
		finally
		{
			if(pst != null)
			{
				try
				{
					pst.close();
				}
				catch (SQLException e)
				{
				}
				pst = null;
			}
			if (conn != null)
			{
				try
				{
					conn.close();
				}
				catch (SQLException e)
				{
				}
				conn = null;
			}
		}
	}
}
