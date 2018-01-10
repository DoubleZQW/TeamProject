package com.qf.pojo;

import java.util.Date;

public class TbOrder {
    private Long orderId;

    private Long uId;

    private Long mId;

    private Integer payment;

    private Byte paymentType;

    private Integer orderFree;

    private Byte orderStatus;

    private Date orderCreated;

    private Date orderFinished;

    private Integer addrId;

    private Long pId;

    private String orderMessage;

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public Long getuId() {
        return uId;
    }

    public void setuId(Long uId) {
        this.uId = uId;
    }

    public Long getmId() {
        return mId;
    }

    public void setmId(Long mId) {
        this.mId = mId;
    }

    public Integer getPayment() {
        return payment;
    }

    public void setPayment(Integer payment) {
        this.payment = payment;
    }

    public Byte getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(Byte paymentType) {
        this.paymentType = paymentType;
    }

    public Integer getOrderFree() {
        return orderFree;
    }

    public void setOrderFree(Integer orderFree) {
        this.orderFree = orderFree;
    }

    public Byte getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(Byte orderStatus) {
        this.orderStatus = orderStatus;
    }

    public Date getOrderCreated() {
        return orderCreated;
    }

    public void setOrderCreated(Date orderCreated) {
        this.orderCreated = orderCreated;
    }

    public Date getOrderFinished() {
        return orderFinished;
    }

    public void setOrderFinished(Date orderFinished) {
        this.orderFinished = orderFinished;
    }

    public Integer getAddrId() {
        return addrId;
    }

    public void setAddrId(Integer addrId) {
        this.addrId = addrId;
    }

    public Long getpId() {
        return pId;
    }

    public void setpId(Long pId) {
        this.pId = pId;
    }

    public String getOrderMessage() {
        return orderMessage;
    }

    public void setOrderMessage(String orderMessage) {
        this.orderMessage = orderMessage == null ? null : orderMessage.trim();
    }
}