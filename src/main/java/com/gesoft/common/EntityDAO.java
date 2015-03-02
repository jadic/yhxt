/**
 * 文件名称：EntityDAO.java
 * 版权所有：Copyright gesoft
 * 创建时间：2015年1月22日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.common;

import java.io.Serializable;
import java.util.List;

/**
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
public interface EntityDAO<E, PK extends Serializable>
{
	/**
	 * 描述信息：取单条记录
	 * 创建时间：2015年1月23日 上午11:10:32
	 * @author WCL (ln_admin@yeah.net)
	 * @param id
	 * @return
	 */
	public Object get(PK id);
	
	/**
	 * 描述信息：保存
	 * 创建时间：2015年1月23日 上午11:10:08
	 * @author WCL (ln_admin@yeah.net)
	 * @param entity
	 * @return
	 */
	public int save(E entity);
	
	/**
	 * 描述信息：删除
	 * 创建时间：2015年1月23日 上午11:10:13
	 * @author WCL (ln_admin@yeah.net)
	 * @param entity
	 * @return
	 */
	public int delete(E entity);

	/**
	 * 描述信息：修改
	 * 创建时间：2015年1月23日 上午11:10:01
	 * @author WCL (ln_admin@yeah.net)
	 * @param entity
	 * @return
	 */
	public int update(E entity);

	public int saveOrUpdate(E entity);
	
	/**
	 * 描述信息：修改状态
	 * 创建时间：2015年2月3日 下午5:55:31
	 * @author WCL (ln_admin@yeah.net)
	 * @param entity
	 * @return
	 */
	public int updateStatus(E entity);

	
	public void flush();

	/**
	 * 描述信息：查询所有
	 * 创建时间：2015年1月23日 上午11:09:28
	 * @author WCL (ln_admin@yeah.net)
	 * @return
	 */
	public List<E> findAll();
	
	/**
	 * 描述信息：查询总记录数
	 * 创建时间：2015年1月23日 上午11:09:21
	 * @author WCL (ln_admin@yeah.net)
	 * @param entity
	 * @return
	 */
	public long findListCnt(E entity);
	
	/**
	 * 描述信息：分页查询/查询
	 * 创建时间：2015年1月23日 上午11:09:07
	 * @author WCL (ln_admin@yeah.net)
	 * @param entity
	 * @return
	 */
	public List<E> findList(E entity);
}
