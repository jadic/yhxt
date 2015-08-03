/**
 * 文件名称：UserModel.java
 * 版权所有：Copyright gesoft
 * 创建时间：2015年1月30日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.model;

import com.gesoft.util.SystemUtils;

/**
 * 用户登录
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
public class UserModel extends BaseModel
{
	private static final long serialVersionUID = 4278170559943436904L;

	private long userId;
	private String userPwd;
	private String userNewPwd;
	
	private String stime = SystemUtils.getCurrentSystemTime(); 
	// 验证码
	private String rand;
	private int userSysId;
	
	private int oper;
	private String name;		// 姓名
	private int gender;  		// 性别 1：男， 2，女，0，未知
	private String birthdate; 	// 出生日期
	private String cellphone; 	//手机号码
	private String email; 		//
	private int credentialType; //证件类型
	private String credentialNo;//证件号码
	private int isSoldier; 		//是否军人
	private int isDisablity; 	//是否残疾
	private int height; 		//身高
	private int weight; 		//体重
	private int nationality;	//民族
	private String nativePlace; //籍贯
	private int marriageStatus; //婚姻状态
	private int householdType; 	//户籍类型
	private int education; 		//学历
	private int policticsStatus;//政治面貌
	private String homePhone; 	//家庭电话
	private String homeAddress; //家庭地址
	private int workingAge; 	//工作年限
	private int salary; 		//薪资
	private String companyName; //公司名称
	private String companyAddress; 	//公司地址
	private String photo; 		//照片
	private String score;       //分数
	private int cnt;
	private String genderStr;	//性别
	
	private int sysId;//用户对应的平台类型
	private int isChild;//是否是子女账号
	private int parentId;//子女用户关联的老人用户ID
	private String parentName;//关联老人姓名 
	
	private int operType = 0;
	
	private String spouseName;  // 配偶姓名
	private String spousePhone; // 配偶手机
	private String achievement; // 工作成就
	private String bmi;//weight/(height*height)
	
	
	
	public int getOper()
	{
		return oper;
	}
	public void setOper(int oper)
	{
		this.oper = oper;
	}
	public String getBmi()
	{
		return bmi;
	}
	public void setBmi(String bmi)
	{
		this.bmi = bmi;
	}
	public int getUserSysId()
	{
		return userSysId;
	}
	public void setUserSysId(int userSysId)
	{
		this.userSysId = userSysId;
	}
	public int getOperType()
	{
		return operType;
	}
	public void setOperType(int operType)
	{
		this.operType = operType;
	}
	public String getGenderStr()
	{
		switch (this.gender)
		{
		case 0:
			this.genderStr = "-";
			break;
		case 1:
			this.genderStr = "男";
			break;
		case 2:
			this.genderStr = "女";
			break;
		default:
			break;
		}
		return genderStr;
	}
	public void setGenderStr(String genderStr)
	{
		this.genderStr = genderStr;
	}
	public int getCnt()
	{
		return cnt;
	}
	public void setCnt(int cnt)
	{
		this.cnt = cnt;
	}
	public String getScore()
	{
		return score;
	}
	public void setScore(String score)
	{
		this.score = score;
	}
	
	public long getUserId()
	{
		return userId;
	}
	public void setUserId(long userId)
	{
		this.userId = userId;
	}
	public String getUserPwd()
	{
		return userPwd;
	}
	public void setUserPwd(String userPwd)
	{
		this.userPwd = userPwd;
	}
	public String getUserNewPwd()
	{
		return userNewPwd;
	}
	public void setUserNewPwd(String userNewPwd)
	{
		this.userNewPwd = userNewPwd;
	}
	public String getStime()
	{
		return stime;
	}
	public void setStime(String stime)
	{
		this.stime = stime;
	}
	public String getRand()
	{
		return rand;
	}
	public void setRand(String rand)
	{
		this.rand = rand;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public int getGender()
	{
		return gender;
	}
	public void setGender(int gender)
	{
		this.gender = gender;
	}
	public String getBirthdate()
	{
		return birthdate;
	}
	public void setBirthdate(String birthdate)
	{
		this.birthdate = birthdate;
	}
	public String getCellphone()
	{
		return cellphone;
	}
	public void setCellphone(String cellphone)
	{
		this.cellphone = cellphone;
	}
	public String getEmail()
	{
		return email;
	}
	public void setEmail(String email)
	{
		this.email = email;
	}
	public int getCredentialType()
	{
		return credentialType;
	}
	public void setCredentialType(int credentialType)
	{
		this.credentialType = credentialType;
	}
	public String getCredentialNo()
	{
		return credentialNo;
	}
	public void setCredentialNo(String credentialNo)
	{
		this.credentialNo = credentialNo;
	}
	public int getIsSoldier()
	{
		return isSoldier;
	}
	public void setIsSoldier(int isSoldier)
	{
		this.isSoldier = isSoldier;
	}
	public int getIsDisablity()
	{
		return isDisablity;
	}
	public void setIsDisablity(int isDisablity)
	{
		this.isDisablity = isDisablity;
	}
	public int getHeight()
	{
		return height;
	}
	public void setHeight(int height)
	{
		this.height = height;
	}
	public int getWeight()
	{
		return weight;
	}
	public void setWeight(int weight)
	{
		this.weight = weight;
	}
	public int getNationality()
	{
		return nationality;
	}
	public void setNationality(int nationality)
	{
		this.nationality = nationality;
	}
	public String getNativePlace()
	{
		return nativePlace;
	}
	public void setNativePlace(String nativePlace)
	{
		this.nativePlace = nativePlace;
	}
	public int getMarriageStatus()
	{
		return marriageStatus;
	}
	public void setMarriageStatus(int marriageStatus)
	{
		this.marriageStatus = marriageStatus;
	}
	public int getHouseholdType()
	{
		return householdType;
	}
	public void setHouseholdType(int householdType)
	{
		this.householdType = householdType;
	}
	public int getEducation()
	{
		return education;
	}
	public void setEducation(int education)
	{
		this.education = education;
	}
	public int getPolicticsStatus()
	{
		return policticsStatus;
	}
	public void setPolicticsStatus(int policticsStatus)
	{
		this.policticsStatus = policticsStatus;
	}
	public String getHomePhone()
	{
		return homePhone;
	}
	public void setHomePhone(String homePhone)
	{
		this.homePhone = homePhone;
	}
	public String getHomeAddress()
	{
		return homeAddress;
	}
	public void setHomeAddress(String homeAddress)
	{
		this.homeAddress = homeAddress;
	}
	public int getWorkingAge()
	{
		return workingAge;
	}
	public void setWorkingAge(int workingAge)
	{
		this.workingAge = workingAge;
	}
	public int getSalary()
	{
		return salary;
	}
	public void setSalary(int salary)
	{
		this.salary = salary;
	}
	public String getCompanyName()
	{
		return companyName;
	}
	public void setCompanyName(String companyName)
	{
		this.companyName = companyName;
	}
	public String getCompanyAddress()
	{
		return companyAddress;
	}
	public void setCompanyAddress(String companyAddress)
	{
		this.companyAddress = companyAddress;
	}
	public String getPhoto()
	{
		return photo;
	}
	public void setPhoto(String photo)
	{
		this.photo = photo;
	}
    public int getParentId() {
        return parentId;
    }
    public void setParentId(int parentId) {
        this.parentId = parentId;
    }
    public int getSysId() {
        return sysId;
    }
    public void setSysId(int sysId) {
        this.sysId = sysId;
    }
    public int getIsChild() {
        return isChild;
    }
    public void setIsChild(int isChild) {
        this.isChild = isChild;
    }
    public String getParentName() {
        return parentName;
    }
    public void setParentName(String parentName) {
        this.parentName = parentName;
    }
	public String getSpouseName()
	{
		return spouseName;
	}
	public void setSpouseName(String spouseName)
	{
		this.spouseName = spouseName;
	}
	public String getSpousePhone()
	{
		return spousePhone;
	}
	public void setSpousePhone(String spousePhone)
	{
		this.spousePhone = spousePhone;
	}
	public String getAchievement()
	{
		return achievement;
	}
	public void setAchievement(String achievement)
	{
		this.achievement = achievement;
	}
}
