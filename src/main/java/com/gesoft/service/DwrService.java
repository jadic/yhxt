/**
 * 文件名称：DwrService.java
 * 版权所有：Copyright njty
 * 创建时间：2015年2月3日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.service;

import java.util.LinkedHashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gesoft.dao.DwrDAO;
import com.gesoft.model.DwrModel;

/**
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
@Service
@Transactional
public class DwrService
{
	@Resource
	private DwrDAO dwrDAO;
	
	
	/**
	 * 描述信息：加载定制类型
	 * 创建时间：2015年2月4日 上午7:01:10
	 * @author WCL (ln_admin@yeah.net)
	 * @return
	 */
	@Transactional(readOnly=true)
	public LinkedHashMap<String, String> queryCustomInfo()
	{
		return funDealDwrInfo(dwrDAO.queryCustomInfo());
	}
	
	
	/**
	 * 描述信息：加载新闻类型
	 * 创建时间：2015年2月3日 下午11:35:09
	 * @author WCL (ln_admin@yeah.net)
	 * @return
	 */
	@Transactional(readOnly=true)
	public LinkedHashMap<String, String> queryNewsTypeInfo(int customId)
	{
		return funDealDwrInfo(dwrDAO.queryNewsTypeInfo(customId));
	}
	
	
	/**
	 * 描述信息：加载经典案例类型
	 * 创建时间：2015年2月5日 上午9:45:43
	 * @author WCL (ln_admin@yeah.net)
	 * @param customId
	 * @return
	 */
	@Transactional(readOnly=true)
	public LinkedHashMap<String, String> queryCaseTypeInfo(int customId)
	{
		return funDealDwrInfo(dwrDAO.queryCaseTypeInfo(customId));
	}
	
	
	
	/**
	 * 描述信息：加载产品中心类型
	 * 创建时间：2015年2月5日 上午10:15:24
	 * @author WCL (ln_admin@yeah.net)
	 * @param customId
	 * @return
	 */
	@Transactional(readOnly=true)
	public LinkedHashMap<String, String> queryProduceTypeInfo(int customId)
	{
		return funDealDwrInfo(dwrDAO.queryProduceTypeInfo(customId));
	}
	
	
	/**
	 * 描述信息：处理公共部分
	 * 创建时间：2015年2月3日 下午11:34:54
	 * @author WCL (ln_admin@yeah.net)
	 * @param argArgs
	 * @return
	 */
	private LinkedHashMap<String, String>  funDealDwrInfo(List<DwrModel> argArgs)
	{
		LinkedHashMap<String, String> mRetMap = new LinkedHashMap<String, String>();
		if (argArgs != null)
		{
			for (DwrModel dwrModel : argArgs)
			{
				mRetMap.put(dwrModel.getMsgKey(), dwrModel.getMsgVal());
			}
		}
		return mRetMap;
	}
}
