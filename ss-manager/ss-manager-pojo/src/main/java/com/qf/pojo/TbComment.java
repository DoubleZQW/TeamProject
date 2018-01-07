package com.qf.pojo;

import java.util.Date;

public class TbComment {
    private Integer commentId;

    private Integer oId;

    private Integer comScore;

    private String comContent;

    private Date comTime;

    public Integer getCommentId() {
        return commentId;
    }

    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }

    public Integer getoId() {
        return oId;
    }

    public void setoId(Integer oId) {
        this.oId = oId;
    }

    public Integer getComScore() {
        return comScore;
    }

    public void setComScore(Integer comScore) {
        this.comScore = comScore;
    }

    public String getComContent() {
        return comContent;
    }

    public void setComContent(String comContent) {
        this.comContent = comContent == null ? null : comContent.trim();
    }

    public Date getComTime() {
        return comTime;
    }

    public void setComTime(Date comTime) {
        this.comTime = comTime;
    }
}