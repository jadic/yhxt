package com.gesoft.model;

public class HospitalDeptModel extends BaseModel {

    private static final long serialVersionUID = 356660027606169865L;

    private long id;
    private String name;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}
