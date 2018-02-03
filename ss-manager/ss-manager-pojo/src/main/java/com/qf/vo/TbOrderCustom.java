package com.qf.vo;

import com.qf.pojo.TbOrder;

public class TbOrderCustom extends TbOrder{
    private String mealName;
    private String mealPicture;
    private Integer mealPrice;
    private Integer mealNum;
    private String addrName;
    private String pName;
    private String pMobie;
    private String userName;
    private Integer amount;
    private String userPhone;
    private String sname;
    private String stelephone;

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getStelephone() {
        return stelephone;
    }

    public void setStelephone(String stelephone) {
        this.stelephone = stelephone;
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public String getMealName() {
        return mealName;
    }

    public void setMealName(String mealName) {
        this.mealName = mealName;
    }

    public String getMealPicture() {
        return mealPicture;
    }

    public void setMealPicture(String mealPicture) {
        this.mealPicture = mealPicture;
    }

    public Integer getMealPrice() {
        return mealPrice;
    }

    public void setMealPrice(Integer mealPrice) {
        this.mealPrice = mealPrice;
    }

    public Integer getMealNum() {
        return mealNum;
    }

    public void setMealNum(Integer mealNum) {
        this.mealNum = mealNum;
    }

    public String getAddrName() {
        return addrName;
    }

    public void setAddrName(String addrName) {
        this.addrName = addrName;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public String getpMobie() {
        return pMobie;
    }

    public void setpMobie(String pMobie) {
        this.pMobie = pMobie;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }
}
