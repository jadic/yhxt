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
	 * 描述信息：加载定制类型
	 * 创建时间：2015年2月4日 上午7:01:10
	 * @author WCL (ln_admin@yeah.net)
	 * @return
	 */
	public List<DwrModel> queryCustomInfo()
	{
		return getSqlSession().selectList(getMybatisSqlMapNamespace()+".queryCustomInfo");
	}
	
	
	/**
	 * 描述信息：加载新闻类型
	 * 创建时间：2015年2月3日 下午11:30:44
	 * @author WCL (ln_admin@yeah.net)
	 * @return
	 */
	public List<DwrModel> queryNewsTypeInfo(int customId)
	{
		return getSqlSession().selectList(getMybatisSqlMapNamespace()+".queryNewsTypeInfo", customId);
	}
	
	
	/**
	 * 描述信息：加载经典案例类型
	 * 创建时间：2015年2月5日 上午9:46:17
	 * @author WCL (ln_admin@yeah.net)
	 * @param customId
	 * @return
	 */
	public List<DwrModel> queryCaseTypeInfo(int customId)
	{
		return getSqlSession().selectList(getMybatisSqlMapNamespace()+".queryCaseTypeInfo", customId);
	}
	
	
	/**
	 * 描述信息：加载产品中心类型
	 * 创建时间：2015年2月5日 上午10:15:58
	 * @author WCL (ln_admin@yeah.net)
	 * @param customId
	 * @return
	 */
	public List<DwrModel> queryProduceTypeInfo(int customId)
	{
		return getSqlSession().selectList(getMybatisSqlMapNamespace()+".queryProduceTypeInfo", customId);
	}
	
}
