/**
 * 文件名称：MedicineModel.java
 * 版权所有：Copyright njty
 * 创建时间：2015年5月9日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.model;

/**
 * 用药记录
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
public class MedicineModel extends BaseModel
{
	
	private static final long serialVersionUID = -2311702470515516664L;
	private int id;
	private String medicineName;
	private String medicineAmount;
	private String medicineUnit;
	private String medicineTime;
	private String medicineTiming;
	private String medicineInterval;
	
	private String flag;//配合app端增加一个标识位
	
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public String getMedicineName()
	{
		return medicineName;
	}
	public void setMedicineName(String medicineName)
	{
		this.medicineName = medicineName;
	}
	public String getMedicineAmount()
	{
		return medicineAmount;
	}
	public void setMedicineAmount(String medicineAmount)
	{
		this.medicineAmount = medicineAmount;
	}
	public String getMedicineUnit()
	{
		return medicineUnit;
	}
	public void setMedicineUnit(String medicineUnit)
	{
		this.medicineUnit = medicineUnit;
	}
	public String getMedicineTime()
	{
		return medicineTime;
	}
	public void setMedicineTime(String medicineTime)
	{
		this.medicineTime = medicineTime;
	}
    public String getMedicineTiming() {
        return medicineTiming;
    }
    public void setMedicineTiming(String medicineTiming) {
        this.medicineTiming = medicineTiming;
    }
    public String getMedicineInterval() {
        return medicineInterval;
    }
    public void setMedicineInterval(String medicineInterval) {
        this.medicineInterval = medicineInterval;
    }
    public String getFlag() {
        return flag;
    }
    public void setFlag(String flag) {
        this.flag = flag;
    }
	
}
