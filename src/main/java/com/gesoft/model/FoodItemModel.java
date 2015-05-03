package com.gesoft.model;

/**
 * 
 * @author Jadic
 * @created 2015年4月28日
 */
public class FoodItemModel extends BaseModel {

    private static final long serialVersionUID = -1401776083240459482L;
    
    private int id;
    private String foodName;
    private int caloriePerHundredGram;
    private int foodType;
    private String foodTypeName;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFoodName() {
        return foodName;
    }

    public void setFoodName(String foodName) {
        this.foodName = foodName;
    }

    public int getCaloriePerHundredGram() {
        return caloriePerHundredGram;
    }

    public void setCaloriePerHundredGram(int caloriePerHundredGram) {
        this.caloriePerHundredGram = caloriePerHundredGram;
    }

    public int getFoodType() {
        return foodType;
    }

    public void setFoodType(int foodType) {
        this.foodType = foodType;
    }

    public String getFoodTypeName() {
        return foodTypeName;
    }

    public void setFoodTypeName(String foodTypeName) {
        this.foodTypeName = foodTypeName;
    }

}
