/**
 * 文件名称：NSearchDAO.java
 * 版权所有：Copyright njty
 * 创建时间：2015年3月12日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.dao;

import org.springframework.stereotype.Repository;

import com.gesoft.common.EntityDAOImpl;
import com.gesoft.model.BaseModel;

/**
 * 医护平台
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
@Repository
public class NSearchDAO extends EntityDAOImpl<BaseModel, Long>
{

	@Override
    public String getMybatisSqlMapNamespace()
    {
        return "SearchMapper";
    }

}
