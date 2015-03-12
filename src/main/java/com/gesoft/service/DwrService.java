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
import com.gesoft.model.DictModel;
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
	 * 描述信息：加载设备类型
	 * 创建时间：2015年3月3日 上午11:12:49
	 * @author WCL (ln_admin@yeah.net)
	 * @return
	 */
	@Transactional(readOnly=true)
	public LinkedHashMap<String, String> queryDevTypeInfo()
	{
		return funDealDwrInfo(dwrDAO.queryDevTypeInfo());
	}
	
	
	/**
	 * 描述信息：加载字典数据
	 * 创建时间：2015年3月8日 下午10:35:09
	 * @author WCL (ln_admin@yeah.net)
	 * @param type
	 * @return
	 */
	@Transactional(readOnly=true)
	public LinkedHashMap<String, String> queryDictInfo(int type)
	{
		String strTableName = "tab_";
		switch (type)
		{
			case 1: // 证件类型
				strTableName = "tab_dict_credential";
				break;
				
			case 2: // 民族
				strTableName = "tab_dict_nationality";
				break;
				
			case 3: // 婚姻状态
				strTableName = "tab_dict_marriage_status";
				break;
				
			case 4: // 户籍类型
				strTableName = "tab_dict_household";
				break;
				
			case 5: // 学历
				strTableName = "tab_dict_education";
				break;	
				
			case 6: // 政治面貌
				strTableName = "tab_dict_politicsStatus";
				break;	
				
			case 7: // 工作年限
				strTableName = "tab_dict_workingage";
				break;	
				
			case 8: // 薪资范围
				strTableName = "tab_dict_salary";
				break;		
			default:
				break;
		}
		DictModel model = new DictModel();
		model.setTableName(strTableName);
		return funDealDwrInfo(dwrDAO.queryDictInfo(model));
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


	/**
	 * 描述信息：加载医院
	 * 创建时间：2015年3月12日 上午11:43:18
	 * @author WCL (ln_admin@yeah.net)
	 * @return
	 */
	@Transactional(readOnly=true)
	public LinkedHashMap<?, ?> queryHospitalInfo()
	{
		return funDealDwrInfo(dwrDAO.queryHospitalInfo());
	}


	/**
	 * 描述信息：医院科室
	 * 创建时间：2015年3月12日 上午11:45:00
	 * @author WCL (ln_admin@yeah.net)
	 * @return
	 */
	@Transactional(readOnly=true)
	public LinkedHashMap<?, ?> queryHospitalDeptInfo()
	{
		return funDealDwrInfo(dwrDAO.queryHospitalDeptInfo());
	}

	
	/***
	 * 描述信息：加载医院地址
	 * 创建时间：2015年3月12日 上午11:48:32
	 * @author WCL (ln_admin@yeah.net)
	 * @param id
	 * @return
	 */
	@Transactional(readOnly=true)
	public String queryHospitalAddressInfo(int id)
	{
		return dwrDAO.queryHospitalAddressInfo(id);
	}
}
