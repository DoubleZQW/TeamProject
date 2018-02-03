package com.qf.vo;

import java.io.Serializable;

public class TbSearchMealCustom implements Serializable {
	private Integer mealId;
	private String mealName;
	private String mealPrice;
	private Integer mealNum;
	private String mealPic;
	private String mealIntro;
	private String publisher;

	public TbSearchMealCustom() {
	}

	public TbSearchMealCustom(Integer mealId, String mealName, String mealPrice, Integer mealNum, String mealPic, String mealIntro, String publisher) {
		this.mealId = mealId;
		this.mealName = mealName;
		this.mealPrice = mealPrice;
		this.mealNum = mealNum;
		this.mealPic = mealPic;
		this.mealIntro = mealIntro;
		this.publisher = publisher;
	}

	public Integer getMealId() {
		return this.mealId;
	}

	public void setMealId(Integer mealId) {
		this.mealId = mealId;
	}

	public String getMealName() {
		return this.mealName;
	}

	public void setMealName(String mealName) {
		this.mealName = mealName;
	}

	public String getMealPrice() {
		return this.mealPrice;
	}

	public void setMealPrice(String mealPrice) {
		this.mealPrice = mealPrice;
	}

	public Integer getMealNum() {
		return this.mealNum;
	}

	public void setMealNum(Integer mealNum) {
		this.mealNum = mealNum;
	}

	public String getMealPic() {
		return this.mealPic;
	}

	public void setMealPic(String mealPic) {
		this.mealPic = mealPic;
	}

	public String getMealIntro() {
		return this.mealIntro;
	}

	public void setMealIntro(String mealIntro) {
		this.mealIntro = mealIntro;
	}

	public String getPublisher() {
		return this.publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String toString() {
		return "TbSearchMealCustom{mealId=" + this.mealId + ", mealName='" + this.mealName + '\'' + ", mealPrice='" + this.mealPrice + '\'' + ", mealNum=" + this.mealNum + ", mealPic='" + this.mealPic + '\'' + ", mealIntro='" + this.mealIntro + '\'' + ", publisher='" + this.publisher + '\'' + '}';
	}
}
