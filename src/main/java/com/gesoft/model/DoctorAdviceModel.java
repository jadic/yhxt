package com.gesoft.model;

public class DoctorAdviceModel extends BaseModel {

    private static final long serialVersionUID = 6037965814794454861L;

    private long id;//记录编号
    private long userId;//关联的用户编号
    private int typeId;//建议类型
    private String typeName;//建议类型名称
    private String adviceTime;//建议时间
    private String adviceContent;//建议内容

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public String getAdviceTime() {
        return adviceTime;
    }

    public void setAdviceTime(String adviceTime) {
        this.adviceTime = adviceTime;
    }

    public String getAdviceContent() {
        return adviceContent;
    }

    public void setAdviceContent(String adviceContent) {
        this.adviceContent = adviceContent;
    }

}
