/**
 * 文件名称：EntityService.java
 * 版权所有：Copyright gesoft
 * 创建时间：2015年1月22日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.common;

import java.io.Serializable;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.gesoft.model.BaseModel;
import com.gesoft.model.MsgModel;

/**
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
@Transactional
public abstract class EntityService<E, PK extends Serializable>
{
	
	protected abstract EntityDAO<E, PK> getEntityDao();
	
	@SuppressWarnings("unchecked")
	@Transactional(readOnly = true)
	public E get(PK id)
	{
		return (E) getEntityDao().get(id);
	}
	
	@Transactional(readOnly = true)
	public List<E> findAll()
	{
		return getEntityDao().findAll();
	}

	public long save(E entity)
	{
		return getEntityDao().save(entity);
	}
 
	public int delete(E entity) 
	{
		return getEntityDao().delete(entity);
	}

	public int update(E entity)
	{
		return getEntityDao().update(entity);
	}
	
	public int updateStatus(E entity)
	{
		return getEntityDao().updateStatus(entity);
	}
	
	@Transactional(readOnly = true)
	public long findListCnt(E entity)
	{
		return getEntityDao().findListCnt(entity);
	}
	
	@Transactional(readOnly = true)
	public List<E> findList(E entity)
	{
		return getEntityDao().findList(entity);
	}
	
	@SuppressWarnings("unchecked")
	@Transactional(readOnly = true)
	public void findPageList(BaseModel model, MsgModel msgModel)
	{
		//取总记录数
		long recordCount = model.getTotal();
		if (isSearchPageTotal(model))
		{
			recordCount = findListCnt((E) model);	
		}
		
		//分页加载数据
		if (recordCount > 0)
		{
			setPageModel(recordCount, model);
			List<E> argArgs = findList((E)model);
			if (argArgs != null)
			{
				msgModel.setRows(argArgs);
				msgModel.setTotal(recordCount);
			}
		}
	}
	
	
	/**
	 * 描述信息：判断分页
	 * 创建时间：2015年1月29日 下午3:21:28
	 * @author WCL (ln_admin@yeah.net)
	 * @param recordCount
	 * @param handerModel
	 */
	protected void setPageModel(long recordCount, BaseModel handerModel) 
	{
		if (handerModel.getPage() <= 0) 
		{
			handerModel.setPage(1);
		}
		
		if (handerModel.getRows() <= 0)
		{
			handerModel.setRows(10);
		}
		
		//计算开始、结束记录数
		handerModel.setStartNum((handerModel.getPage() -1) * handerModel.getRows());
		if (recordCount >= handerModel.getPage() * handerModel.getRows())
		{
			handerModel.setEndNum(handerModel.getPage() * handerModel.getRows());
		}
		else
		{
			handerModel.setEndNum(recordCount);
		}
	}
	
	
	/**
	 * 描述信息：判断是否要进行分页查询
	 * 创建时间：2014-01-16 11:38:20
	 * @author WCL （ln_admin@yeah.net）
	 * @return 如果返回flase则不用查总记录数，如果返回true则要查总记录数
	 */
	protected boolean isSearchPageTotal(BaseModel handerModel)
	{
		if (handerModel.getPage() >1 && handerModel.getTotal() > 0)
		{
			return false;
		}
		return true;
	}
}
