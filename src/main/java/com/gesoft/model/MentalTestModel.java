package com.gesoft.model;

import com.gesoft.util.StringUtil;

/**
 * 心理测试
 * @author Jadic
 * @created 2015年7月27日
 */
public class MentalTestModel extends BaseModel {
    private static final long serialVersionUID = -7868752121593555456L;
    private int id;
    private String testTime;
    private int score;
    private int masculineCount;
    private double masculineAvgScore;
    private double somatization;
    private double compel;
    private double interpersonal;
    private double depression;
    private double anxiety;
    private double antagonism;
    private double terror;
    private double crankiness;
    private double psychosis;
    private double other;
    
    public boolean isParamValid() {
        if (this.getUserId() > 0 && this.score >= 0 && this.masculineCount >= 0 && this.masculineAvgScore >= 0
           && this.somatization >= 0 && this.compel >= 0 && this.interpersonal >= 0 && this.depression >= 0 
           && this.anxiety >= 0 && this.antagonism >= 0 && this.terror >= 0 && this.crankiness >= 0 
           && this.psychosis >= 0 && this.other >= 0 && !StringUtil.isNullOrEmpty(testTime)
           && this.testTime.matches("\\d{4}-\\d{2}-\\d{2} \\d{2}:\\d{2}:\\d{2}")) {
            return true;
        }
        return false;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTestTime() {
        return testTime;
    }

    public void setTestTime(String testTime) {
        this.testTime = testTime;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public int getMasculineCount() {
        return masculineCount;
    }

    public void setMasculineCount(int masculineCount) {
        this.masculineCount = masculineCount;
    }

    public double getMasculineAvgScore() {
        return masculineAvgScore;
    }

    public void setMasculineAvgScore(double masculineAvgScore) {
        this.masculineAvgScore = masculineAvgScore;
    }

    public double getSomatization() {
        return somatization;
    }

    public void setSomatization(double somatization) {
        this.somatization = somatization;
    }

    public double getCompel() {
        return compel;
    }

    public void setCompel(double compel) {
        this.compel = compel;
    }

    public double getInterpersonal() {
        return interpersonal;
    }

    public void setInterpersonal(double interpersonal) {
        this.interpersonal = interpersonal;
    }

    public double getDepression() {
        return depression;
    }

    public void setDepression(double depression) {
        this.depression = depression;
    }

    public double getAnxiety() {
        return anxiety;
    }

    public void setAnxiety(double anxiety) {
        this.anxiety = anxiety;
    }

    public double getAntagonism() {
        return antagonism;
    }

    public void setAntagonism(double antagonism) {
        this.antagonism = antagonism;
    }

    public double getTerror() {
        return terror;
    }

    public void setTerror(double terror) {
        this.terror = terror;
    }

    public double getCrankiness() {
        return crankiness;
    }

    public void setCrankiness(double crankiness) {
        this.crankiness = crankiness;
    }

    public double getPsychosis() {
        return psychosis;
    }

    public void setPsychosis(double psychosis) {
        this.psychosis = psychosis;
    }

    public double getOther() {
        return other;
    }

    public void setOther(double other) {
        this.other = other;
    }

}
