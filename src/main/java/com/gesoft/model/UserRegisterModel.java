package com.gesoft.model;

public class UserRegisterModel extends BaseModel {

    private static final long serialVersionUID = -713092081259666305L;

    private String cellphone;
    private String authCode;
    private String userPass;

    public String getCellphone() {
        return cellphone;
    }

    public void setCellphone(String cellphone) {
        this.cellphone = cellphone;
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
