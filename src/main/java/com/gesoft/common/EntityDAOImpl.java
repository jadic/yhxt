/**
 * 文件名称：EntityDAOImpl.java
 * 版权所有：Copyright gesoft
 * 创建时间：2015年1月22日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.common;

import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;

/**
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
public abstract class EntityDAOImpl<E, PK extends Serializable> extends SqlSessionDaoSupport implements EntityDAO<E, PK>
{
	
	public Object get(PK id)
	{
		return getSqlSession().selectOne(getFindByPrimaryKeyStatement(), id);
	}
	@Override
	public int delete(E entity)
	{
		return getSqlSession().delete(getDeleteStatement(), entity);
	}

	@Override
	public int save(E entity)
	{
		return getSqlSession().insert(getInsertStatement(), entity);
	}


	@Override
	public int update(E entity)
	{
		return getSqlSession().update(getUpdateStatement(), entity);
	}
	
	/**
	 * 描述信息：修改状态
	 * 创建时间：2015年2月3日 下午5:55:31
	 * @author WCL (ln_admin@yeah.net)
	 * @param entity
	 * @return
	 */
	public int updateStatus(E entity)
	{

		return getSqlSession().update(getUpdateStatusStatement(), entity);
	}
	

	@Override
	public List<E> findList(E entity)
	{
		return getSqlSession().selectList(getFindListStatement(), entity);
	}

	@Override
	public long findListCnt(E entity)
	{
		return (Long)getSqlSession().selectOne(getFindListCountStatement(), entity);
	}

	@Override
	public List<E> findAll()
	{
		return null;//getSqlSession().selectList(getFindAllStatement());
	}

	@Override
	public void flush()
	{
		// TODO Auto-generated method stub
	}
	
	@Override
	public int saveOrUpdate(E entity)
	{
		// TODO Auto-generated method stub
		return 0;
	}
	

	public String getFindByPrimaryKeyStatement()
	{
		return getMybatisSqlMapNamespace() + ".getById";
	}

	public String getInsertStatement()
	{
		return getMybatisSqlMapNamespace() + ".insert";
	}

	public String getUpdateStatement()
	{
		return getMybatisSqlMapNamespace() + ".update";
	}

	public String getUpdateStatusStatement()
	{
		return getMybatisSqlMapNamespace() + ".updateStatus";
	}
	
	public String getDeleteStatement()
	{
		return getMybatisSqlMapNamespace() + ".delete";
	}
	
	public String getFindAllStatement()
	{
		return getMybatisSqlMapNamespace() + ".all";
	}
	
	public String getFindListStatement()
	{
		return getMybatisSqlMapNamespace() + ".list";
	}
	
	public String getFindListCountStatement()
	{
		return getMybatisSqlMapNamespace() + ".count";
	}
	
	/**
	 * 描述信息：命名空间 
	 * 创建时间：2012-08-14 15:01:24
	 * @author wangcl (ln_admin@yeah.net)
	 * @return
	 */
	public String getMybatisSqlMapNamespace()
	{
		throw new RuntimeException("not yet implement");
	}
	
	@Resource
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory)
	{
		super.setSqlSessionFactory(sqlSessionFactory);
	}
}
