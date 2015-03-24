/**
 * 文件名称：ScoreModel.java
 * 版权所有：Copyright njty
 * 创建时间：2015年3月11日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.model;

/**
 * 评分项
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
public class ScoreModel extends BaseModel
{
	private static final long serialVersionUID = 1307533546619731240L;
	private long id;
	private long nurserId;
	private long userId;
	private int score1;
	private int score2;
	private int score3;
	private String stime;
	
	public String getStime()
	{
		return stime;
	}
	public void setStime(String stime)
	{
		this.stime = stime;
	}
	public long getId()
	{
		return id;
	}
	public void setId(long id)
	{
		this.id = id;
	}
	public long getNurserId()
	{
		return nurserId;
	}
	public void setNurserId(long nurserId)
	{
		this.nurserId = nurserId;
	}
	public long getUserId()
	{
		return userId;
	}
	public void setUserId(long userId)
	{
		this.userId = userId;
	}
	public int getScore1()
	{
		return score1;
	}
	public void setScore1(int score1)
	{
		this.score1 = score1;
	}
	public int getScore2()
	{
		return score2;
	}
	public void setScore2(int score2)
	{
		this.score2 = score2;
	}
	public int getScore3()
	{
		return score3;
	}
	public void setScore3(int score3)
	{
		this.score3 = score3;
	}
}
