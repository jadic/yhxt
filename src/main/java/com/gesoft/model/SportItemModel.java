package com.gesoft.model;

/**
 * 
 * @author Jadic
 * @created 2015年4月28日
 */
public class SportItemModel extends BaseModel {

    private static final long serialVersionUID = 1875871656290776623L;
    private int id;
    private String sportName;
    private int caloriePerMinute;
    private String sportIcon;
    private int sportType;
    private String sportTypeName;
    private String sportTypeIcon;

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

    public int getSportType() {
        return sportType;
    }

    public void setSportType(int sportType) {
        this.sportType = sportType;
    }

    public String getSportTypeName() {
        return sportTypeName;
    }

    public void setSportTypeName(String sportTypeName) {
        this.sportTypeName = sportTypeName;
    }

    public String getSportIcon() {
        return sportIcon;
    }

    public void setSportIcon(String sportIcon) {
        this.sportIcon = sportIcon;
    }

    public String getSportTypeIcon() {
        return sportTypeIcon;
    }

    public void setSportTypeIcon(String sportTypeIcon) {
        this.sportTypeIcon = sportTypeIcon;
    }

}
