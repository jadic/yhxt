package com.gesoft.model;

/**
 * 
 * @author Jadic
 * @created 2015年4月28日
 */
public class SportItemModel {

    private int id;
    private String sportName;
    private int caloriePerMinute;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSportName() {
        return sportName;
    }

    public void setSportName(String sportName) {
        this.sportName = sportName;
    }

    public int getCaloriePerMinute() {
        return caloriePerMinute;
    }

    public void setCaloriePerMinute(int caloriePerMinute) {
        this.caloriePerMinute = caloriePerMinute;
    }

}
