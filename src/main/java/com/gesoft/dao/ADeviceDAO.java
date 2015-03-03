/**
 * 文件名称：ADeviceDAO.java
 * 版权所有：Copyright gesoft
 * 创建时间：2015年2月2日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.dao;

import org.springframework.stereotype.Repository;

import com.gesoft.common.EntityDAOImpl;
import com.gesoft.model.DeviceModel;

/**
 * 设备管理
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
@Repository
public class ADeviceDAO extends EntityDAOImpl<DeviceModel, Long>
{
	@Override
    public String getMybatisSqlMapNamespace()
    {
        return "DeviceMapper";
    }
}
