package com.gesoft.model;

public class DoctorAdvicePerformanceModel extends BaseModel {

    private static final long serialVersionUID = -5540271260533642283L;

    private long id;//记录编号
    private long adviceId;//关联的建议ID
    private String advicePerformance;//建议的执行情况
    private String recordTime;//记录时间

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getAdviceId() {
        return adviceId;
    }

    public void setAdviceId(long adviceId) {
        this.adviceId = adviceId;
    }

    public String getAdvicePerformance() {
        return advicePerformance;
    }

    public void setAdvicePerformance(String advicePerformance) {
        this.advicePerformance = advicePerformance;
    }

    public String getRecordTime() {
        return recordTime;
    }

    public void setRecordTime(String recordTime) {
        this.recordTime = recordTime;
    }

}
