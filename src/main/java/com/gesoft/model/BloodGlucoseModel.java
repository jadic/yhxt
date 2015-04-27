package com.gesoft.model;

/**
 * 
 * @author Jadic
 * @created 2015年4月25日
 */
public class BloodGlucoseModel extends BaseModel {

    private static final long serialVersionUID = 7165733292093323677L;

    private long id;
    private int bloodGlucose1;
    private int bloodGlucose2;
    private String takeTime;
    private String takeDate;
    private String takeTime1;
    private String takeTime2;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public int getBloodGlucose1() {
        return bloodGlucose1;
    }

    public void setBloodGlucose1(int bloodGlucose1) {
        this.bloodGlucose1 = bloodGlucose1;
    }

    public int getBloodGlucose2() {
        return bloodGlucose2;
    }

    public void setBloodGlucose2(int bloodGlucose2) {
        this.bloodGlucose2 = bloodGlucose2;
    }

    public String getTakeDate() {
        return takeDate;
    }

    public void setTakeDate(String takeDate) {
        this.takeDate = takeDate;
    }

    public String getTakeTime() {
        return takeTime;
    }

    public void setTakeTime(String takeTime) {
        this.takeTime = takeTime;
    }

    public String getTakeTime1() {
        return takeTime1;
    }

    public void setTakeTime1(String takeTime1) {
        this.takeTime1 = takeTime1;
    }

    public String getTakeTime2() {
        return takeTime2;
    }

    public void setTakeTime2(String takeTime2) {
        this.takeTime2 = takeTime2;
    }

}
