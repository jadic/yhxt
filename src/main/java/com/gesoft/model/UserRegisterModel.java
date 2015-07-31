package com.gesoft.model;

public class UserRegisterModel extends BaseModel {

    private static final long serialVersionUID = -713092081259666305L;

    private String cellPhone;
    private String authCode;
    private String userPass;

    public String getCellPhone() {
        return cellPhone;
    }

    public void setCellPhone(String cellPhone) {
        this.cellPhone = cellPhone;
    }

    public String getAuthCode() {
        return authCode;
    }

    public void setAuthCode(String authCode) {
        this.authCode = authCode;
    }

    public String getUserPass() {
        return userPass;
    }

    public void setUserPass(String userPass) {
        this.userPass = userPass;
    }

}
