/**
 * 文件名称：GeneticDiseaseModel.java
 * 版权所有：Copyright njty
 * 创建时间：2015年3月9日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.model;

/**
 * 家庭遗传史
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
public class GeneticDiseaseModel extends BaseModel
{
	private static final long serialVersionUID = -3794640773751210095L;
	private long id;
	private int isHeartDisease; // 心脏病
	private int isHypertension; // 高血压
	private int isHyperlipemia; // 高血脂
	private int isDiabetesMellitus; // 糖尿病
	private int isCoronaryDisease; // 冠心病
	public long getId()
	{
		return id;
	}
	public void setId(long id)
	{
		this.id = id;
	}
	public int getIsHeartDisease()
	{
		return isHeartDisease;
	}
	public void setIsHeartDisease(int isHeartDisease)
	{
		this.isHeartDisease = isHeartDisease;
	}
	public int getIsHypertension()
	{
		return isHypertension;
	}
	public void setIsHypertension(int isHypertension)
	{
		this.isHypertension = isHypertension;
	}
	public int getIsHyperlipemia()
	{
		return isHyperlipemia;
	}
	public void setIsHyperlipemia(int isHyperlipemia)
	{
		this.isHyperlipemia = isHyperlipemia;
	}
	public int getIsDiabetesMellitus()
	{
		return isDiabetesMellitus;
	}
	public void setIsDiabetesMellitus(int isDiabetesMellitus)
	{
		this.isDiabetesMellitus = isDiabetesMellitus;
	}
	public int getIsCoronaryDisease()
	{
		return isCoronaryDisease;
	}
	public void setIsCoronaryDisease(int isCoronaryDisease)
	{
		this.isCoronaryDisease = isCoronaryDisease;
	}
}
