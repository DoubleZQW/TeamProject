package com.qf.pojo;

import java.util.Date;

public class TbMeal {
    private Long mealId;

    private String mealName;

    private Integer mealPrice;

    private Integer amount;

    private Integer mealNum;

    private String mealPicture;

    private Byte mealStatus;

    private String mealIntro;

    private String category;

    private Date createTime;

    private Date updateTime;

    public Long getMealId() {
        return mealId;
    }

    public void setMealId(Long mealId) {
        this.mealId = mealId;
    }

    public String getMealName() {
        return mealName;
    }

    public void setMealName(String mealName) {
        this.mealName = mealName == null ? null : mealName.trim();
    }

    public Integer getMealPrice() {
        return mealPrice;
    }

    public void setMealPrice(Integer mealPrice) {
        this.mealPrice = mealPrice;
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public Integer getMealNum() {
        return mealNum;
    }

    public void setMealNum(Integer mealNum) {
        this.mealNum = mealNum;
    }

    public String getMealPicture() {
        return mealPicture;
    }

    public void setMealPicture(String mealPicture) {
        this.mealPicture = mealPicture == null ? null : mealPicture.trim();
    }

    public Byte getMealStatus() {
        return mealStatus;
    }

    public void setMealStatus(Byte mealStatus) {
        this.mealStatus = mealStatus;
    }

    public String getMealIntro() {
        return mealIntro;
    }

    public void setMealIntro(String mealIntro) {
        this.mealIntro = mealIntro == null ? null : mealIntro.trim();
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category == null ? null : category.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}