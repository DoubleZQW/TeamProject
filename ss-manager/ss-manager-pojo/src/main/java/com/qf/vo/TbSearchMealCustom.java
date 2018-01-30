package com.qf.vo;

public class TbSearchMealCustom {

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
		return mealId;
	}

	public void setMealId(Integer mealId) {
		this.mealId = mealId;
	}

	public String getMealName() {
		return mealName;
	}

	public void setMealName(String mealName) {
		this.mealName = mealName;
	}

	public String getMealPrice() {
		return mealPrice;
	}

	public void setMealPrice(String mealPrice) {
		this.mealPrice = mealPrice;
	}

	public Integer getMealNum() {
		return mealNum;
	}

	public void setMealNum(Integer mealNum) {
		this.mealNum = mealNum;
	}

	public String getMealPic() {
		return mealPic;
	}

	public void setMealPic(String mealPic) {
		this.mealPic = mealPic;
	}

	public String getMealIntro() {
		return mealIntro;
	}

	public void setMealIntro(String mealIntro) {
		this.mealIntro = mealIntro;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	@Override
	public String toString() {
		return "TbSearchMealCustom{" +
				"mealId=" + mealId +
				", mealName='" + mealName + '\'' +
				", mealPrice='" + mealPrice + '\'' +
				", mealNum=" + mealNum +
				", mealPic='" + mealPic + '\'' +
				", mealIntro='" + mealIntro + '\'' +
				", publisher='" + publisher + '\'' +
				'}';
	}
}
