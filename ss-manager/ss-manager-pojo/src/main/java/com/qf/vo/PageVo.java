package com.qf.vo;


import java.util.List;

public class PageVo<T> {
	private long total;//总条数
	private List<T> rows;//集合

	public PageVo() {
	}

	public PageVo(long total, List<T> rows) {
		this.total = total;
		this.rows = rows;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public List<T> getRows() {
		return rows;
	}

	public void setRows(List<T> rows) {
		this.rows = rows;
	}

	@Override
	public String toString() {
		return "UserVo{" +
				"total=" + total +
				", rows=" + rows +
				'}';
	}
}
