/**
 * 文件名称：DoctorModel.java
 * 版权所有：Copyright njty
 * 创建时间：2015年3月12日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.model;

/**
 * 医生信息
 * 
 * @author WCL
 * @version v1.001
 * @since v1.001
 */
public class DoctorModel extends BaseModel {
    private static final long serialVersionUID = 1608046232939925591L;
    private long doctorId;
    private String doctorName; // 医生名称
    private int doctorGender; // 医生性别
    private String doctorGenderStr; // 医生性别
    private String doctorPhoto; // 医生照片
    private int doctorHospitalId; // 医生所在医院
    private int doctorDeptId; // 医生所在科室
    private String doctorTitle; // 医生职称
    private String doctorTeachingTitle; // 教学职称
    private String doctorEducation; // 医生学历
    private String doctorSkill; // 医生擅长
    private String doctorDetailDescription;// 医生详细介绍
    private String hospitalName; // 医院名称
    private String hospitalAddr; // 医院地址
    private String deptName; // 科室名称
    private String doctorEducationName; // 学历名称

    public String getDoctorEducationName() {
        return doctorEducationName;
    }

    public void setDoctorEducationName(String doctorEducationName) {
        this.doctorEducationName = doctorEducationName;
    }

    public String getHospitalName() {
        return hospitalName;
    }

    public void setHospitalName(String hospitalName) {
        this.hospitalName = hospitalName;
    }

    public String getHospitalAddr() {
        return hospitalAddr;
    }

    public void setHospitalAddr(String hospitalAddr) {
        this.hospitalAddr = hospitalAddr;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public long getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(long doctorId) {
        this.doctorId = doctorId;
    }

    public String getDoctorName() {
        return doctorName;
    }

    public void setDoctorName(String doctorName) {
        this.doctorName = doctorName;
    }

    public int getDoctorGender() {
        return doctorGender;
    }

    public void setDoctorGender(int doctorGender) {
        this.doctorGender = doctorGender;
    }

    public String getDoctorGenderStr() {
        return doctorGenderStr;
    }

    public void setDoctorGenderStr(String doctorGenderStr) {
        this.doctorGenderStr = doctorGenderStr;
    }

    public String getDoctorPhoto() {
        return doctorPhoto;
    }

    public void setDoctorPhoto(String doctorPhoto) {
        this.doctorPhoto = doctorPhoto;
    }

    public int getDoctorHospitalId() {
        return doctorHospitalId;
    }

    public void setDoctorHospitalId(int doctorHospitalId) {
        this.doctorHospitalId = doctorHospitalId;
    }

    public int getDoctorDeptId() {
        return doctorDeptId;
    }

    public void setDoctorDeptId(int doctorDeptId) {
        this.doctorDeptId = doctorDeptId;
    }

    public String getDoctorTitle() {
        return doctorTitle;
    }

    public void setDoctorTitle(String doctorTitle) {
        this.doctorTitle = doctorTitle;
    }

    public String getDoctorEducation() {
        return doctorEducation;
    }

    public void setDoctorEducation(String doctorEducation) {
        this.doctorEducation = doctorEducation;
    }

    public String getDoctorSkill() {
        return doctorSkill;
    }

    public void setDoctorSkill(String doctorSkill) {
        this.doctorSkill = doctorSkill;
    }

    public String getDoctorDetailDescription() {
        return doctorDetailDescription;
    }

    public void setDoctorDetailDescription(String doctorDetailDescription) {
        this.doctorDetailDescription = doctorDetailDescription;
    }

    public String getDoctorTeachingTitle() {
        return doctorTeachingTitle;
    }

    public void setDoctorTeachingTitle(String doctorTeachingTitle) {
        this.doctorTeachingTitle = doctorTeachingTitle;
    }
}
