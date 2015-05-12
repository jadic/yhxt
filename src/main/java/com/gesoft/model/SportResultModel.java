package com.gesoft.model;

/**
 * 
 * @author Jadic
 * @created 2015年4月29日
 */
public class SportResultModel extends BaseModel {

    private static final long serialVersionUID = 177709303585647172L;

    private int id;
    private int sportItemId;
    private int sportDuration;
    private String sportTime;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSportItemId() {
        return sportItemId;
    }

    public void setSportItemId(int sportItemId) {
        this.sportItemId = sportItemId;
    }

    public int getSportDuration() {
        return sportDuration;
    }

    public void setSportDuration(int sportDuration) {
        this.sportDuration = sportDuration;
    }

    public String getSportTime() {
        return sportTime;
    }

    public void setSportTime(String sportTime) {
        this.sportTime = sportTime;
    }

}
