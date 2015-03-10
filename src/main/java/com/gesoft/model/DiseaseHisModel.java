/**
 * 文件名称：DiseaseHisModel.java
 * 版权所有：Copyright njty
 * 创建时间：2015年3月10日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.model;

/**
 * 疾病史
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
public class DiseaseHisModel extends BaseModel
{
	private static final long serialVersionUID = -4149138214864745177L;
	private long id;
	private String diseaseName;
	private String startDate;
	private String endDate;
	private String descInHospital;
	private String descObserve;
	private String memo;
	
	public long getId()
	{
		return id;
	}
	public void setId(long id)
	{
		this.id = id;
	}
	public String getDiseaseName()
	{
		return diseaseName;
	}
	public void setDiseaseName(String diseaseName)
	{
		this.diseaseName = diseaseName;
	}
	public String getStartDate()
	{
		return startDate;
	}
	public void setStartDate(String startDate)
	{
		this.startDate = startDate;
	}
	public String getEndDate()
	{
		return endDate;
	}
	public void setEndDate(String endDate)
	{
		this.endDate = endDate;
	}
	public String getDescInHospital()
	{
		return descInHospital;
	}
	public void setDescInHospital(String descInHospital)
	{
		this.descInHospital = descInHospital;
	}
	public String getDescObserve()
	{
		return descObserve;
	}
	public void setDescObserve(String descObserve)
	{
		this.descObserve = descObserve;
	}
	public String getMemo()
	{
		return memo;
	}
	public void setMemo(String memo)
	{
		this.memo = memo;
	}
}
