package com.qf.vo;

import com.qf.pojo.TbUser;

import java.util.List;

public class UserVo {
	private Double total;
	private List<TbUser> rows;

	public UserVo() {
	}

	public UserVo(Double total, List<TbUser> rows) {
		this.total = total;
		this.rows = rows;
	}

	public Double getTotal() {
		return total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

	public List<TbUser> getRows() {
		return rows;
	}

	public void setRows(List<TbUser> rows) {
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
