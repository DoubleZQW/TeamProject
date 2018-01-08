package com.qf.pojo;

import java.util.Date;

public class TbMeal {
    private Long mealId;

    private String mealName;

    private Integer mealPrice;

    private Integer mealNum;

    private String mealPicture;

    private Byte mealStatus;

    private String publisher;

    private String mealIntro;

    private String category;

    private Date createTme;

    private Date updatTime;

    private Long catId;

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

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher == null ? null : publisher.trim();
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

    public Date getCreateTme() {
        return createTme;
    }

    public void setCreateTme(Date createTme) {
        this.createTme = createTme;
    }

    public Date getUpdatTime() {
        return updatTime;
    }

    public void setUpdatTime(Date updatTime) {
        this.updatTime = updatTime;
    }

    public Long getCatId() {
        return catId;
    }

    public void setCatId(Long catId) {
        this.catId = catId;
    }
}