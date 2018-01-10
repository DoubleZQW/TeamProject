package com.qf.dto;

public class Sort {
	private String sort;
	private String order;

	public Sort() {

	}

	public Sort(String sort, String order) {
		this.sort = sort;
		this.order = order;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	@Override
	public String toString() {
		return "Sort{" +
				"sort='" + sort + '\'' +
				", order='" + order + '\'' +
				'}';
	}
}
