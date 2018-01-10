package com.qf.dto;

public class Page {
	private Integer page;//当前页码
	private Integer rows;//每页条数
	//private Integer offset;//偏移量

	public Page() {
	}

	public Page(Integer page, Integer rows) {
		this.page = page;
		this.rows = rows;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

	/**
	 * 获取偏移量，不需要手工设值
	 * @return
	 */
	public int getOffset() {
		return (page-1)*rows;
	}

	@Override
	public String toString() {
		return "Page{" +
				"page=" + page +
				", rows=" + rows +
				'}';
	}
    public void setRows(int rows) {
        this.rows = rows;
    }
}
