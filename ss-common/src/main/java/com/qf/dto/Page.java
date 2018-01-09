package com.qf.dto;

public class Page {

    private int page;
    private int rows;

    public Page() {
    }

    public Page(int page, int rows) {
        this.page = page;
        this.rows = rows;
    }

    public int getOffset(){
        return (page-1)*rows;
    }
    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }
}
