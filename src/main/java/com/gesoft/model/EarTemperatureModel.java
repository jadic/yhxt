package com.gesoft.model;


/**
 * 
 * @author  Jadic
 * @created 2015年4月25日
 */
public class EarTemperatureModel extends BaseModel {

    private static final long serialVersionUID = 1956802704562617687L;
    
    private int temperature;
    private String takeTime;

    public int getTemperature() {
        return temperature;
    }
    public void setTemperature(int temperature) {
        this.temperature = temperature;
    }
    public String getTakeTime() {
        return takeTime;
    }
    public void setTakeTime(String takeTime) {
        this.takeTime = takeTime;
    }

}
