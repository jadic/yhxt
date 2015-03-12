/**
 * 文件名称：DwrController.java
 * 版权所有：Copyright gesoft
 * 创建时间：2015年1月26日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.gesoft.service.DwrService;
import com.gesoft.util.FileUtil;
import com.gesoft.util.SystemUtils;

/**
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
@Controller
@RemoteProxy(name = "loadDwr")
public class DwrUController
{

	private static final Logger logger = LoggerFactory.getLogger(DwrUController.class);
	
	@Resource
	private DwrService dwrService;
	
	
	@RemoteMethod
	public Map<?, ?> loadCity()
	{
		Map<String, String> mRetMap = new LinkedHashMap<String, String>();
		mRetMap.put("1", "南京市");
		mRetMap.put("2", "合肥市");
		mRetMap.put("3", "沈阳市");
		return mRetMap;
	}
	
	
	/**
	 * 描述信息：DWR文件上传
	 * 创建时间：2015年2月5日 上午11:02:56
	 * @author WCL (ln_admin@yeah.net)
	 * @param uploadFile
	 * @param filedataFileName
	 * @param strDir
	 * @return
	 */
	@RemoteMethod
	public String uploadFileInfo(InputStream uploadFile, String filedataFileName)
	{
		RequestAttributes requestAttributes = RequestContextHolder.getRequestAttributes();
		HttpServletRequest request = ((ServletRequestAttributes)requestAttributes).getRequest();
		String basePath = "/upload/" + FileUtil.createFoldersByType(2);
		try
		{
			filedataFileName = SystemUtils.getCurrentSystemTime("yyyyMMddHHmmssSSS") + "_" + filedataFileName;
			String realpath = request.getSession().getServletContext().getRealPath("/") + "//" + basePath;
			realpath = "/Volumes/MacintoshHD2/Project/java/yhxt/src/main/webapp"+ "//" + basePath;
			File savefile = new File(new File(realpath), filedataFileName);
			if (!savefile.getParentFile().exists())
			{
				savefile.getParentFile().mkdirs();
			}
			IOUtils.copy(uploadFile, new FileOutputStream(savefile));
		}
		catch (Exception e)
		{
			e.printStackTrace();
			return "-1";
		}
		//return  request.getContextPath() + "/"+basePath + "/" + filedataFileName;
		return  basePath + "/" + filedataFileName;
	}  
	
	/**
	 * 描述信息：加载设备类型
	 * 创建时间：2015年3月3日 上午11:11:19
	 * @author WCL (ln_admin@yeah.net)
	 * @return
	 */
	@RemoteMethod
	public Map<?, ?> loadDevType()
	{
		LinkedHashMap<?, ?> mRetMap = null;
		try
		{
			mRetMap = dwrService.queryDevTypeInfo();
		}
		catch (Exception e)
		{
			logger.error("DwrUController loadDevType error：", e);
		}
		return mRetMap;
	}
	
	
	/**
	 * 描述信息：加载字典数据
	 * 创建时间：2015年3月8日 下午10:34:15
	 * @author WCL (ln_admin@yeah.net)
	 * @param type
	 * @return
	 */
	@RemoteMethod
	public Map<?, ?> loadDictInfo(int type)
	{
		LinkedHashMap<?, ?> mRetMap = null;
		try
		{
			mRetMap = dwrService.queryDictInfo(type);
		}
		catch (Exception e)
		{
			logger.error("DwrUController loadDictInfo error：", e);
		}
		return mRetMap;
	}
	
	/**
	 * 描述信息：加载医院
	 * 创建时间：2015年3月12日 上午11:43:18
	 * @author WCL (ln_admin@yeah.net)
	 * @return
	 */
	@RemoteMethod
	public Map<?, ?> loadHospitalInfo()
	{
		LinkedHashMap<?, ?> mRetMap = null;
		try
		{
			mRetMap = dwrService.queryHospitalInfo();
		}
		catch (Exception e)
		{
			logger.error("DwrUController loadHospitalInfo error：", e);
		}
		return mRetMap;
	}
	
	
	/**
	 * 描述信息：医院科室
	 * 创建时间：2015年3月12日 上午11:45:00
	 * @author WCL (ln_admin@yeah.net)
	 * @return
	 */
	@RemoteMethod
	public Map<?, ?> loadHospitalDeptInfo()
	{
		LinkedHashMap<?, ?> mRetMap = null;
		try
		{
			mRetMap = dwrService.queryHospitalDeptInfo();
		}
		catch (Exception e)
		{
			logger.error("DwrUController loadHospitalDeptInfo error：", e);
		}
		return mRetMap;
	}
	
	/***
	 * 描述信息：加载医院地址
	 * 创建时间：2015年3月12日 上午11:48:32
	 * @author WCL (ln_admin@yeah.net)
	 * @param id
	 * @return
	 */
	@RemoteMethod
	public String loadHospitalAddressInfo(int id)
	{
		String strRet = "";
		try
		{
			strRet = dwrService.queryHospitalAddressInfo(id);
		}
		catch (Exception e)
		{
			logger.error("DwrUController loadHospitalAddressInfo error：", e);
		}
		return strRet;
	}
}
