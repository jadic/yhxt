/**
 * 文件名称：HappyHostLaudModel.java
 * 版权所有：Copyright njty
 * 创建时间：2015年5月28日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.model;

/**
 * 快乐驿站点赞
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
public class HappyHostLaudModel extends BaseModel
{
	private static final long serialVersionUID = -6130883240646834403L;
	private int id;
	private int postId;
	private String stime;
	private int flag; 		// 1增加, 其它为取消
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public int getPostId()
	{
		return postId;
	}
	public void setPostId(int postId)
	{
		this.postId = postId;
	}
	public String getStime()
	{
		return stime;
	}
	public void setStime(String stime)
	{
		this.stime = stime;
	}
	public int getFlag()
	{
		return flag;
	}
	public void setFlag(int flag)
	{
		this.flag = flag;
	}
}
