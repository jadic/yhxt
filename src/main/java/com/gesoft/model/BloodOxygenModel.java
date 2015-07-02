package com.gesoft.model;

public class BloodOxygenModel extends BaseModel {

    private static final long serialVersionUID = 1728913480582873365L;
    private int id;
    private int valLow;
    private int valHigh;
    private String takeTime;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getValLow() {
        return valLow;
    }

    public void setValLow(int valLow) {
        this.valLow = valLow;
    }

    public int getValHigh() {
        return valHigh;
    }

    public void setValHigh(int valHigh) {
        this.valHigh = valHigh;
    }

    public String getTakeTime() {
        return takeTime;
    }

    public void setTakeTime(String takeTime) {
        this.takeTime = takeTime;
    }
}
