package com.gesoft.model;

/**
 * 
 * @author Jadic
 * @created 2015年5月2日
 */
public class FoodTypeModel extends BaseModel {

    private static final long serialVersionUID = 1001295226717046609L;

    private int id;
    private String name;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}
