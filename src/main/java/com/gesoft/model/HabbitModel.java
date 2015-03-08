/**
 * 文件名称：HabbitModel.java
 * 版权所有：Copyright njty
 * 创建时间：2015年3月9日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.model;

/**
 * 生活习惯
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
public class HabbitModel extends BaseModel
{
	private static final long serialVersionUID = 9048055298075437584L;
	private long id;
	private int workType; 		// 工作类型
	private int workPressure; 	// 工作压力
	private int bloodType; 		// 血型
	private int weight; 		// 体重
	private int waist; 			// 腰围
	private int smokeType; 		// 吸烟年限
	private int smokeFrequency; // 吸烟频次
	private int drinkFrequency; // 饮酒频次
	private int drinkType; 		// 饮酒类型
	private int exerciseFrequency; 	// 运动频次
	private int exerciseDuration; 	// 运动时长
	private int sleepDuration; 		// 睡眠时长
	public long getId()
	{
		return id;
	}
	public void setId(long id)
	{
		this.id = id;
	}
	public int getWorkType()
	{
		return workType;
	}
	public void setWorkType(int workType)
	{
		this.workType = workType;
	}
	public int getWorkPressure()
	{
		return workPressure;
	}
	public void setWorkPressure(int workPressure)
	{
		this.workPressure = workPressure;
	}
	public int getBloodType()
	{
		return bloodType;
	}
	public void setBloodType(int bloodType)
	{
		this.bloodType = bloodType;
	}
	public int getWeight()
	{
		return weight;
	}
	public void setWeight(int weight)
	{
		this.weight = weight;
	}
	public int getWaist()
	{
		return waist;
	}
	public void setWaist(int waist)
	{
		this.waist = waist;
	}
	public int getSmokeType()
	{
		return smokeType;
	}
	public void setSmokeType(int smokeType)
	{
		this.smokeType = smokeType;
	}
	public int getSmokeFrequency()
	{
		return smokeFrequency;
	}
	public void setSmokeFrequency(int smokeFrequency)
	{
		this.smokeFrequency = smokeFrequency;
	}
	public int getDrinkFrequency()
	{
		return drinkFrequency;
	}
	public void setDrinkFrequency(int drinkFrequency)
	{
		this.drinkFrequency = drinkFrequency;
	}
	public int getDrinkType()
	{
		return drinkType;
	}
	public void setDrinkType(int drinkType)
	{
		this.drinkType = drinkType;
	}
	public int getExerciseFrequency()
	{
		return exerciseFrequency;
	}
	public void setExerciseFrequency(int exerciseFrequency)
	{
		this.exerciseFrequency = exerciseFrequency;
	}
	public int getExerciseDuration()
	{
		return exerciseDuration;
	}
	public void setExerciseDuration(int exerciseDuration)
	{
		this.exerciseDuration = exerciseDuration;
	}
	public int getSleepDuration()
	{
		return sleepDuration;
	}
	public void setSleepDuration(int sleepDuration)
	{
		this.sleepDuration = sleepDuration;
	}
	
}
