package com.qf.vo;

import com.qf.pojo.TbMeal;

public class Custome extends TbMeal {
    private  Byte  mstatus;
    private String catname;

    public Byte getMstatus() {
        return mstatus;
    }

    public void setMstatus(Byte mstatus) {
        this.mstatus = mstatus;
    }

    public String getCatname() {
        return catname;
    }

    public void setCatname(String catname) {
        this.catname = catname;
    }
}
