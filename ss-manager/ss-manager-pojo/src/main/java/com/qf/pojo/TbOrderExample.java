package com.qf.pojo;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class TbOrderExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public TbOrderExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andOrderIdIsNull() {
            addCriterion("order_id is null");
            return (Criteria) this;
        }

        public Criteria andOrderIdIsNotNull() {
            addCriterion("order_id is not null");
            return (Criteria) this;
        }

        public Criteria andOrderIdEqualTo(String value) {
            addCriterion("order_id =", value, "orderId");
            return (Criteria) this;
        }

        public Criteria andOrderIdNotEqualTo(String value) {
            addCriterion("order_id <>", value, "orderId");
            return (Criteria) this;
        }

        public Criteria andOrderIdGreaterThan(String value) {
            addCriterion("order_id >", value, "orderId");
            return (Criteria) this;
        }

        public Criteria andOrderIdGreaterThanOrEqualTo(String value) {
            addCriterion("order_id >=", value, "orderId");
            return (Criteria) this;
        }

        public Criteria andOrderIdLessThan(String value) {
            addCriterion("order_id <", value, "orderId");
            return (Criteria) this;
        }

        public Criteria andOrderIdLessThanOrEqualTo(String value) {
            addCriterion("order_id <=", value, "orderId");
            return (Criteria) this;
        }

        public Criteria andOrderIdLike(String value) {
            addCriterion("order_id like", value, "orderId");
            return (Criteria) this;
        }

        public Criteria andOrderIdNotLike(String value) {
            addCriterion("order_id not like", value, "orderId");
            return (Criteria) this;
        }

        public Criteria andOrderIdIn(List<String> values) {
            addCriterion("order_id in", values, "orderId");
            return (Criteria) this;
        }

        public Criteria andOrderIdNotIn(List<String> values) {
            addCriterion("order_id not in", values, "orderId");
            return (Criteria) this;
        }

        public Criteria andOrderIdBetween(String value1, String value2) {
            addCriterion("order_id between", value1, value2, "orderId");
            return (Criteria) this;
        }

        public Criteria andOrderIdNotBetween(String value1, String value2) {
            addCriterion("order_id not between", value1, value2, "orderId");
            return (Criteria) this;
        }

        public Criteria andPaymentIsNull() {
            addCriterion("payment is null");
            return (Criteria) this;
        }

        public Criteria andPaymentIsNotNull() {
            addCriterion("payment is not null");
            return (Criteria) this;
        }

        public Criteria andPaymentEqualTo(BigDecimal value) {
            addCriterion("payment =", value, "payment");
            return (Criteria) this;
        }

        public Criteria andPaymentNotEqualTo(BigDecimal value) {
            addCriterion("payment <>", value, "payment");
            return (Criteria) this;
        }

        public Criteria andPaymentGreaterThan(BigDecimal value) {
            addCriterion("payment >", value, "payment");
            return (Criteria) this;
        }

        public Criteria andPaymentGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("payment >=", value, "payment");
            return (Criteria) this;
        }

        public Criteria andPaymentLessThan(BigDecimal value) {
            addCriterion("payment <", value, "payment");
            return (Criteria) this;
        }

        public Criteria andPaymentLessThanOrEqualTo(BigDecimal value) {
            addCriterion("payment <=", value, "payment");
            return (Criteria) this;
        }

        public Criteria andPaymentIn(List<BigDecimal> values) {
            addCriterion("payment in", values, "payment");
            return (Criteria) this;
        }

        public Criteria andPaymentNotIn(List<BigDecimal> values) {
            addCriterion("payment not in", values, "payment");
            return (Criteria) this;
        }

        public Criteria andPaymentBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("payment between", value1, value2, "payment");
            return (Criteria) this;
        }

        public Criteria andPaymentNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("payment not between", value1, value2, "payment");
            return (Criteria) this;
        }

        public Criteria andPaymentTypeIsNull() {
            addCriterion("payment_type is null");
            return (Criteria) this;
        }

        public Criteria andPaymentTypeIsNotNull() {
            addCriterion("payment_type is not null");
            return (Criteria) this;
        }

        public Criteria andPaymentTypeEqualTo(Byte value) {
            addCriterion("payment_type =", value, "paymentType");
            return (Criteria) this;
        }

        public Criteria andPaymentTypeNotEqualTo(Byte value) {
            addCriterion("payment_type <>", value, "paymentType");
            return (Criteria) this;
        }

        public Criteria andPaymentTypeGreaterThan(Byte value) {
            addCriterion("payment_type >", value, "paymentType");
            return (Criteria) this;
        }

        public Criteria andPaymentTypeGreaterThanOrEqualTo(Byte value) {
            addCriterion("payment_type >=", value, "paymentType");
            return (Criteria) this;
        }

        public Criteria andPaymentTypeLessThan(Byte value) {
            addCriterion("payment_type <", value, "paymentType");
            return (Criteria) this;
        }

        public Criteria andPaymentTypeLessThanOrEqualTo(Byte value) {
            addCriterion("payment_type <=", value, "paymentType");
            return (Criteria) this;
        }

        public Criteria andPaymentTypeIn(List<Byte> values) {
            addCriterion("payment_type in", values, "paymentType");
            return (Criteria) this;
        }

        public Criteria andPaymentTypeNotIn(List<Byte> values) {
            addCriterion("payment_type not in", values, "paymentType");
            return (Criteria) this;
        }

        public Criteria andPaymentTypeBetween(Byte value1, Byte value2) {
            addCriterion("payment_type between", value1, value2, "paymentType");
            return (Criteria) this;
        }

        public Criteria andPaymentTypeNotBetween(Byte value1, Byte value2) {
            addCriterion("payment_type not between", value1, value2, "paymentType");
            return (Criteria) this;
        }

        public Criteria andOrderFreeIsNull() {
            addCriterion("order_free is null");
            return (Criteria) this;
        }

        public Criteria andOrderFreeIsNotNull() {
            addCriterion("order_free is not null");
            return (Criteria) this;
        }

        public Criteria andOrderFreeEqualTo(BigDecimal value) {
            addCriterion("order_free =", value, "orderFree");
            return (Criteria) this;
        }

        public Criteria andOrderFreeNotEqualTo(BigDecimal value) {
            addCriterion("order_free <>", value, "orderFree");
            return (Criteria) this;
        }

        public Criteria andOrderFreeGreaterThan(BigDecimal value) {
            addCriterion("order_free >", value, "orderFree");
            return (Criteria) this;
        }

        public Criteria andOrderFreeGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("order_free >=", value, "orderFree");
            return (Criteria) this;
        }

        public Criteria andOrderFreeLessThan(BigDecimal value) {
            addCriterion("order_free <", value, "orderFree");
            return (Criteria) this;
        }

        public Criteria andOrderFreeLessThanOrEqualTo(BigDecimal value) {
            addCriterion("order_free <=", value, "orderFree");
            return (Criteria) this;
        }

        public Criteria andOrderFreeIn(List<BigDecimal> values) {
            addCriterion("order_free in", values, "orderFree");
            return (Criteria) this;
        }

        public Criteria andOrderFreeNotIn(List<BigDecimal> values) {
            addCriterion("order_free not in", values, "orderFree");
            return (Criteria) this;
        }

        public Criteria andOrderFreeBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("order_free between", value1, value2, "orderFree");
            return (Criteria) this;
        }

        public Criteria andOrderFreeNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("order_free not between", value1, value2, "orderFree");
            return (Criteria) this;
        }

        public Criteria andOrderStatusIsNull() {
            addCriterion("order_status is null");
            return (Criteria) this;
        }

        public Criteria andOrderStatusIsNotNull() {
            addCriterion("order_status is not null");
            return (Criteria) this;
        }

        public Criteria andOrderStatusEqualTo(Byte value) {
            addCriterion("order_status =", value, "orderStatus");
            return (Criteria) this;
        }

        public Criteria andOrderStatusNotEqualTo(Byte value) {
            addCriterion("order_status <>", value, "orderStatus");
            return (Criteria) this;
        }

        public Criteria andOrderStatusGreaterThan(Byte value) {
            addCriterion("order_status >", value, "orderStatus");
            return (Criteria) this;
        }

        public Criteria andOrderStatusGreaterThanOrEqualTo(Byte value) {
            addCriterion("order_status >=", value, "orderStatus");
            return (Criteria) this;
        }

        public Criteria andOrderStatusLessThan(Byte value) {
            addCriterion("order_status <", value, "orderStatus");
            return (Criteria) this;
        }

        public Criteria andOrderStatusLessThanOrEqualTo(Byte value) {
            addCriterion("order_status <=", value, "orderStatus");
            return (Criteria) this;
        }

        public Criteria andOrderStatusIn(List<Byte> values) {
            addCriterion("order_status in", values, "orderStatus");
            return (Criteria) this;
        }

        public Criteria andOrderStatusNotIn(List<Byte> values) {
            addCriterion("order_status not in", values, "orderStatus");
            return (Criteria) this;
        }

        public Criteria andOrderStatusBetween(Byte value1, Byte value2) {
            addCriterion("order_status between", value1, value2, "orderStatus");
            return (Criteria) this;
        }

        public Criteria andOrderStatusNotBetween(Byte value1, Byte value2) {
            addCriterion("order_status not between", value1, value2, "orderStatus");
            return (Criteria) this;
        }

        public Criteria andOrderCreatedIsNull() {
            addCriterion("order_created is null");
            return (Criteria) this;
        }

        public Criteria andOrderCreatedIsNotNull() {
            addCriterion("order_created is not null");
            return (Criteria) this;
        }

        public Criteria andOrderCreatedEqualTo(Date value) {
            addCriterion("order_created =", value, "orderCreated");
            return (Criteria) this;
        }

        public Criteria andOrderCreatedNotEqualTo(Date value) {
            addCriterion("order_created <>", value, "orderCreated");
            return (Criteria) this;
        }

        public Criteria andOrderCreatedGreaterThan(Date value) {
            addCriterion("order_created >", value, "orderCreated");
            return (Criteria) this;
        }

        public Criteria andOrderCreatedGreaterThanOrEqualTo(Date value) {
            addCriterion("order_created >=", value, "orderCreated");
            return (Criteria) this;
        }

        public Criteria andOrderCreatedLessThan(Date value) {
            addCriterion("order_created <", value, "orderCreated");
            return (Criteria) this;
        }

        public Criteria andOrderCreatedLessThanOrEqualTo(Date value) {
            addCriterion("order_created <=", value, "orderCreated");
            return (Criteria) this;
        }

        public Criteria andOrderCreatedIn(List<Date> values) {
            addCriterion("order_created in", values, "orderCreated");
            return (Criteria) this;
        }

        public Criteria andOrderCreatedNotIn(List<Date> values) {
            addCriterion("order_created not in", values, "orderCreated");
            return (Criteria) this;
        }

        public Criteria andOrderCreatedBetween(Date value1, Date value2) {
            addCriterion("order_created between", value1, value2, "orderCreated");
            return (Criteria) this;
        }

        public Criteria andOrderCreatedNotBetween(Date value1, Date value2) {
            addCriterion("order_created not between", value1, value2, "orderCreated");
            return (Criteria) this;
        }

        public Criteria andOrderFinishedIsNull() {
            addCriterion("order_finished is null");
            return (Criteria) this;
        }

        public Criteria andOrderFinishedIsNotNull() {
            addCriterion("order_finished is not null");
            return (Criteria) this;
        }

        public Criteria andOrderFinishedEqualTo(Date value) {
            addCriterion("order_finished =", value, "orderFinished");
            return (Criteria) this;
        }

        public Criteria andOrderFinishedNotEqualTo(Date value) {
            addCriterion("order_finished <>", value, "orderFinished");
            return (Criteria) this;
        }

        public Criteria andOrderFinishedGreaterThan(Date value) {
            addCriterion("order_finished >", value, "orderFinished");
            return (Criteria) this;
        }

        public Criteria andOrderFinishedGreaterThanOrEqualTo(Date value) {
            addCriterion("order_finished >=", value, "orderFinished");
            return (Criteria) this;
        }

        public Criteria andOrderFinishedLessThan(Date value) {
            addCriterion("order_finished <", value, "orderFinished");
            return (Criteria) this;
        }

        public Criteria andOrderFinishedLessThanOrEqualTo(Date value) {
            addCriterion("order_finished <=", value, "orderFinished");
            return (Criteria) this;
        }

        public Criteria andOrderFinishedIn(List<Date> values) {
            addCriterion("order_finished in", values, "orderFinished");
            return (Criteria) this;
        }

        public Criteria andOrderFinishedNotIn(List<Date> values) {
            addCriterion("order_finished not in", values, "orderFinished");
            return (Criteria) this;
        }

        public Criteria andOrderFinishedBetween(Date value1, Date value2) {
            addCriterion("order_finished between", value1, value2, "orderFinished");
            return (Criteria) this;
        }

        public Criteria andOrderFinishedNotBetween(Date value1, Date value2) {
            addCriterion("order_finished not between", value1, value2, "orderFinished");
            return (Criteria) this;
        }

        public Criteria andOrderMessageIsNull() {
            addCriterion("order_message is null");
            return (Criteria) this;
        }

        public Criteria andOrderMessageIsNotNull() {
            addCriterion("order_message is not null");
            return (Criteria) this;
        }

        public Criteria andOrderMessageEqualTo(String value) {
            addCriterion("order_message =", value, "orderMessage");
            return (Criteria) this;
        }

        public Criteria andOrderMessageNotEqualTo(String value) {
            addCriterion("order_message <>", value, "orderMessage");
            return (Criteria) this;
        }

        public Criteria andOrderMessageGreaterThan(String value) {
            addCriterion("order_message >", value, "orderMessage");
            return (Criteria) this;
        }

        public Criteria andOrderMessageGreaterThanOrEqualTo(String value) {
            addCriterion("order_message >=", value, "orderMessage");
            return (Criteria) this;
        }

        public Criteria andOrderMessageLessThan(String value) {
            addCriterion("order_message <", value, "orderMessage");
            return (Criteria) this;
        }

        public Criteria andOrderMessageLessThanOrEqualTo(String value) {
            addCriterion("order_message <=", value, "orderMessage");
            return (Criteria) this;
        }

        public Criteria andOrderMessageLike(String value) {
            addCriterion("order_message like", value, "orderMessage");
            return (Criteria) this;
        }

        public Criteria andOrderMessageNotLike(String value) {
            addCriterion("order_message not like", value, "orderMessage");
            return (Criteria) this;
        }

        public Criteria andOrderMessageIn(List<String> values) {
            addCriterion("order_message in", values, "orderMessage");
            return (Criteria) this;
        }

        public Criteria andOrderMessageNotIn(List<String> values) {
            addCriterion("order_message not in", values, "orderMessage");
            return (Criteria) this;
        }

        public Criteria andOrderMessageBetween(String value1, String value2) {
            addCriterion("order_message between", value1, value2, "orderMessage");
            return (Criteria) this;
        }

        public Criteria andOrderMessageNotBetween(String value1, String value2) {
            addCriterion("order_message not between", value1, value2, "orderMessage");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}