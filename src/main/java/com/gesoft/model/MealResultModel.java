package com.gesoft.model;

/**
 * 饮食结果
 * 
 * @author Jadic
 * @created 2015年4月29日
 */
public class MealResultModel extends BaseModel {

    private static final long serialVersionUID = -5710644286013783854L;

    private int id;
    private int mealFlag;// 用餐类别
    private int foodItemId;// 食品编号
    private int foodAmount;// 食量（克）
    private String mealTime;// 用餐时间

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMealFlag() {
        return mealFlag;
    }

    public void setMealFlag(int mealFlag) {
        this.mealFlag = mealFlag;
    }

    public int getFoodItemId() {
        return foodItemId;
    }

    public void setFoodItemId(int foodItemId) {
        this.foodItemId = foodItemId;
    }

    public int getFoodAmount() {
        return foodAmount;
    }

    public void setFoodAmount(int foodAmount) {
        this.foodAmount = foodAmount;
    }

    public String getMealTime() {
        return mealTime;
    }

    public void setMealTime(String mealTime) {
        this.mealTime = mealTime;
    }

}
