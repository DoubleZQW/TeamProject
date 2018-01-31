package com.qf.vo;

import java.util.List;

public class TbSearchMealResult {
	private Long recordCount;
	private Long totalPages;
	private List<TbSearchMealCustom> mealList;

	public TbSearchMealResult() {
	}

	public TbSearchMealResult(Long recordCount, Long totalPages, List<TbSearchMealCustom> mealList) {
		this.recordCount = recordCount;
		this.totalPages = totalPages;
		this.mealList = mealList;
	}

	public Long getRecordCount() {
		return this.recordCount;
	}

	public void setRecordCount(Long recordCount) {
		this.recordCount = recordCount;
	}

	public Long getTotalPages() {
		return this.totalPages;
	}

	public void setTotalPages(Long totalPages) {
		this.totalPages = totalPages;
	}

	public List<TbSearchMealCustom> getMealList() {
		return this.mealList;
	}

	public void setMealList(List<TbSearchMealCustom> mealList) {
		this.mealList = mealList;
	}

	public String toString() {
		return "TbSearchMealResult{recordCount=" + this.recordCount + ", totalPages=" + this.totalPages + ", mealList=" + this.mealList + '}';
	}
}