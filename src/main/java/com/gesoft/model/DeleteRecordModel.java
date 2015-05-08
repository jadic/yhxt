package com.gesoft.model;

public class DeleteRecordModel extends BaseModel {

    private static final long serialVersionUID = 3371502865138642111L;

    private int id;
    private int flag;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getFlag() {
        return flag;
    }

    public void setFlag(int flag) {
        this.flag = flag;
    }

}
