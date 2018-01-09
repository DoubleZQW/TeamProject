package com.qf.vo;

import com.qf.pojo.TbMeal;

public class TbMealCustom extends TbMeal {
//    商品状态
    private  Byte  mstatus;
//    商品类别名
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
