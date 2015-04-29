package com.gesoft.model;

/**
 * 
 * @author Jadic
 * @created 2015年4月29日
 */
public class MentalStatusModel extends BaseModel {

    private static final long serialVersionUID = 5623295168728458442L;

    private int mentalStatus;
    private String recordTime;

    public int getMentalStatus() {
        return mentalStatus;
    }

    public void setMentalStatus(int mentalStatus) {
        this.mentalStatus = mentalStatus;
    }

    public String getRecordTime() {
        return recordTime;
    }

    public void setRecordTime(String recordTime) {
        this.recordTime = recordTime;
    }

}
