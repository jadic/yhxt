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
	
}
