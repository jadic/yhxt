/**
 * 文件名称：HealthReportModel.java
 * 版权所有：Copyright njty
 * 创建时间：2015年5月5日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.model;

/**
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
public class HealthReportModel extends BaseModel
{

	private static final long serialVersionUID = 3415424340044765439L;
	private long id;
	private int reportFlag;  				// 报告类型  1：日报 2：周报  3：月报
	private String sportLevel; 				// 运动是否适量  该字段存储多个运动项目是否适量时，以逗号分割  ，其中适量标准中有如下定义  1：较少  2：适中  3：过量
	private String sportAdvice;				// 运动综合分析
	private String dietLevel;				// 饮食是否适量  该字段存储多个饮食项目是否适量时，以逗号分割  ，其中适量标准中有如下定义  1：较少  2：适中  3：过量
	private String dietAdvice;				// 饮食综合分析
	private String mentalAdvice;			// 心理综合分析
	private String bloodPressureAdvice;		// 血压综合分析
	private String bloodGlucoseAdvice;		// 血糖综合分析
	private String heartRateAdvice;			// 心率综合分析
	private String temperatureAdvice;		// 体温综合分析
	private String medicationAdvice;		// 用药综合分析
	private String reportTime;				// 该报告对应的日期  格式示例   日报：2015-04-30  周报：2015-05-04_2015-05-10  月报：2015-04
	private String accessment;				// 综合评价 1：90-100   2：80-90   3：70-80   4：70以下   对应的健康状况：90-100对应“健康”；80-90对应“良好”；70-80对应“一般”；70以下对应“欠佳”
	private String recordTime;				// 记录时间
	public long getId()
	{
		return id;
	}
	public void setId(long id)
	{
		this.id = id;
	}
	public int getReportFlag()
	{
		return reportFlag;
	}
	public void setReportFlag(int reportFlag)
	{
		this.reportFlag = reportFlag;
	}
	public String getSportLevel()
	{
		return sportLevel;
	}
	public void setSportLevel(String sportLevel)
	{
		this.sportLevel = sportLevel;
	}
	public String getSportAdvice()
	{
		return sportAdvice;
	}
	public void setSportAdvice(String sportAdvice)
	{
		this.sportAdvice = sportAdvice;
	}
	public String getDietLevel()
	{
		return dietLevel;
	}
	public void setDietLevel(String dietLevel)
	{
		this.dietLevel = dietLevel;
	}
	public String getDietAdvice()
	{
		return dietAdvice;
	}
	public void setDietAdvice(String dietAdvice)
	{
		this.dietAdvice = dietAdvice;
	}
	public String getMentalAdvice()
	{
		return mentalAdvice;
	}
	public void setMentalAdvice(String mentalAdvice)
	{
		this.mentalAdvice = mentalAdvice;
	}
	public String getBloodPressureAdvice()
	{
		return bloodPressureAdvice;
	}
	public void setBloodPressureAdvice(String bloodPressureAdvice)
	{
		this.bloodPressureAdvice = bloodPressureAdvice;
	}
	public String getBloodGlucoseAdvice()
	{
		return bloodGlucoseAdvice;
	}
	public void setBloodGlucoseAdvice(String bloodGlucoseAdvice)
	{
		this.bloodGlucoseAdvice = bloodGlucoseAdvice;
	}
	public String getHeartRateAdvice()
	{
		return heartRateAdvice;
	}
	public void setHeartRateAdvice(String heartRateAdvice)
	{
		this.heartRateAdvice = heartRateAdvice;
	}
	public String getTemperatureAdvice()
	{
		return temperatureAdvice;
	}
	public void setTemperatureAdvice(String temperatureAdvice)
	{
		this.temperatureAdvice = temperatureAdvice;
	}
	public String getMedicationAdvice()
	{
		return medicationAdvice;
	}
	public void setMedicationAdvice(String medicationAdvice)
	{
		this.medicationAdvice = medicationAdvice;
	}
	public String getReportTime()
	{
		return reportTime;
	}
	public void setReportTime(String reportTime)
	{
		this.reportTime = reportTime;
	}
	public String getAccessment()
	{
		return accessment;
	}
	public void setAccessment(String accessment)
	{
		this.accessment = accessment;
	}
	public String getRecordTime()
	{
		return recordTime;
	}
	public void setRecordTime(String recordTime)
	{
		this.recordTime = recordTime;
	}
}
