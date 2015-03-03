/**
 * 文件名称：ADevTypeDAO.java
 * 版权所有：Copyright gesoft
 * 创建时间：2015年2月2日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.dao;

import org.springframework.stereotype.Repository;

import com.gesoft.common.EntityDAOImpl;
import com.gesoft.model.DevTypeModel;

/**
 * 设备类型管理
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
@Repository
public class ADevTypeDAO extends EntityDAOImpl<DevTypeModel, Long>
{
	@Override
    public String getMybatisSqlMapNamespace()
    {
        return "DevTypeMapper";
    }
}
