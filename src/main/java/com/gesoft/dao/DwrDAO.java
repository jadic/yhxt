/**
 * 文件名称：DwrDAO.java
 * 版权所有：Copyright njty
 * 创建时间：2015年2月3日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.gesoft.common.EntityDAOImpl;
import com.gesoft.model.BaseModel;
import com.gesoft.model.DictModel;
import com.gesoft.model.DwrModel;

/**
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
@Repository
public class DwrDAO extends EntityDAOImpl<BaseModel, Long>
{
	@Override
    public String getMybatisSqlMapNamespace()
    {
        return "DwrMapper";
    }
	
	
	/**
	 * 描述信息：加载设备类型
	 * 创建时间：2015年3月3日 上午11:12:19
	 * @author WCL (ln_admin@yeah.net)
	 * @return
	 */
	public List<DwrModel> queryDevTypeInfo()
	{
		return getSqlSession().selectList(getMybatisSqlMapNamespace()+".queryDevTypeInfo");
	}
	
	
	/**
	 * 描述信息：加载字段，根据表名来加载
	 * 创建时间：2015年3月8日 下午10:37:23
	 * @author WCL (ln_admin@yeah.net)
	 * @param strTableName
	 * @return
	 */
	public List<DwrModel> queryDictInfo(DictModel model)
	{
		return getSqlSession().selectList(getMybatisSqlMapNamespace()+".queryDictInfo", model);
	}
	
	


	/**
	 * 描述信息：加载医院
	 * 创建时间：2015年3月12日 上午11:43:18
	 * @author WCL (ln_admin@yeah.net)
	 * @return
	 */
	public List<DwrModel> queryHospitalInfo()
	{
		return getSqlSession().selectList(getMybatisSqlMapNamespace()+".queryHospitalInfo");
	}

	/**
	 * 描述信息：医院科室
	 * 创建时间：2015年3月12日 上午11:45:00
	 * @author WCL (ln_admin@yeah.net)
	 * @return
	 */
	public List<DwrModel> queryHospitalDeptInfo()
	{
		return getSqlSession().selectList(getMybatisSqlMapNamespace()+".queryHospitalDeptInfo");
	}

	
	/***
	 * 描述信息：加载医院地址
	 * 创建时间：2015年3月12日 上午11:48:32
	 * @author WCL (ln_admin@yeah.net)
	 * @param id
	 * @return
	 */
	public String queryHospitalAddressInfo(int id)
	{
		return getSqlSession().selectOne(getMybatisSqlMapNamespace()+".queryHospitalDeptInfo", id);
	}
}
