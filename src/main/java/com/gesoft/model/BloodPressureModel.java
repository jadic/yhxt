package com.gesoft.model;

/**
 * 
 * @author Jadic
 * @created 2015年5月27日
 */
public class BloodPressureModel extends BaseModel {

    private static final long serialVersionUID = -3800920195637360622L;

    private int dbp;// 舒张压
    private int sbp;// 收缩压
    private int pulse;// 脉搏
    private String takeTime;// 测量时间

    public int getDbp() {
        return dbp;
    }

    public void setDbp(int dbp) {
        this.dbp = dbp;
    }

    public int getSbp() {
        return sbp;
    }

    public void setSbp(int sbp) {
        this.sbp = sbp;
    }

    public int getPulse() {
        return pulse;
    }

    public void setPulse(int pulse) {
        this.pulse = pulse;
    }

    public String getTakeTime() {
        return takeTime;
    }

    public void setTakeTime(String takeTime) {
        this.takeTime = takeTime;
    }

}
