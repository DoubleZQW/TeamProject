package com.qf.pojo;

import java.math.BigDecimal;
import java.util.Date;

public class TbOrder {
    private String orderId;

    private BigDecimal payment;

    private Byte paymentType;

    private BigDecimal orderFree;

    private Byte orderStatus;

    private Date orderCreated;

    private Date orderFinished;

    private String orderMessage;

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId == null ? null : orderId.trim();
    }

    public BigDecimal getPayment() {
        return payment;
    }

    public void setPayment(BigDecimal payment) {
        this.payment = payment;
    }

    public Byte getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(Byte paymentType) {
        this.paymentType = paymentType;
    }

    public BigDecimal getOrderFree() {
        return orderFree;
    }

    public void setOrderFree(BigDecimal orderFree) {
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

    public String getOrderMessage() {
        return orderMessage;
    }

    public void setOrderMessage(String orderMessage) {
        this.orderMessage = orderMessage == null ? null : orderMessage.trim();
    }
}