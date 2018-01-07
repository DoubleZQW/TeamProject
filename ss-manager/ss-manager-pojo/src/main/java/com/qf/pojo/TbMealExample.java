package com.qf.pojo;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class TbMealExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public TbMealExample() {
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

        public Criteria andMealIdIsNull() {
            addCriterion("meal_id is null");
            return (Criteria) this;
        }

        public Criteria andMealIdIsNotNull() {
            addCriterion("meal_id is not null");
            return (Criteria) this;
        }

        public Criteria andMealIdEqualTo(Integer value) {
            addCriterion("meal_id =", value, "mealId");
            return (Criteria) this;
        }

        public Criteria andMealIdNotEqualTo(Integer value) {
            addCriterion("meal_id <>", value, "mealId");
            return (Criteria) this;
        }

        public Criteria andMealIdGreaterThan(Integer value) {
            addCriterion("meal_id >", value, "mealId");
            return (Criteria) this;
        }

        public Criteria andMealIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("meal_id >=", value, "mealId");
            return (Criteria) this;
        }

        public Criteria andMealIdLessThan(Integer value) {
            addCriterion("meal_id <", value, "mealId");
            return (Criteria) this;
        }

        public Criteria andMealIdLessThanOrEqualTo(Integer value) {
            addCriterion("meal_id <=", value, "mealId");
            return (Criteria) this;
        }

        public Criteria andMealIdIn(List<Integer> values) {
            addCriterion("meal_id in", values, "mealId");
            return (Criteria) this;
        }

        public Criteria andMealIdNotIn(List<Integer> values) {
            addCriterion("meal_id not in", values, "mealId");
            return (Criteria) this;
        }

        public Criteria andMealIdBetween(Integer value1, Integer value2) {
            addCriterion("meal_id between", value1, value2, "mealId");
            return (Criteria) this;
        }

        public Criteria andMealIdNotBetween(Integer value1, Integer value2) {
            addCriterion("meal_id not between", value1, value2, "mealId");
            return (Criteria) this;
        }

        public Criteria andMealNameIsNull() {
            addCriterion("meal_name is null");
            return (Criteria) this;
        }

        public Criteria andMealNameIsNotNull() {
            addCriterion("meal_name is not null");
            return (Criteria) this;
        }

        public Criteria andMealNameEqualTo(String value) {
            addCriterion("meal_name =", value, "mealName");
            return (Criteria) this;
        }

        public Criteria andMealNameNotEqualTo(String value) {
            addCriterion("meal_name <>", value, "mealName");
            return (Criteria) this;
        }

        public Criteria andMealNameGreaterThan(String value) {
            addCriterion("meal_name >", value, "mealName");
            return (Criteria) this;
        }

        public Criteria andMealNameGreaterThanOrEqualTo(String value) {
            addCriterion("meal_name >=", value, "mealName");
            return (Criteria) this;
        }

        public Criteria andMealNameLessThan(String value) {
            addCriterion("meal_name <", value, "mealName");
            return (Criteria) this;
        }

        public Criteria andMealNameLessThanOrEqualTo(String value) {
            addCriterion("meal_name <=", value, "mealName");
            return (Criteria) this;
        }

        public Criteria andMealNameLike(String value) {
            addCriterion("meal_name like", value, "mealName");
            return (Criteria) this;
        }

        public Criteria andMealNameNotLike(String value) {
            addCriterion("meal_name not like", value, "mealName");
            return (Criteria) this;
        }

        public Criteria andMealNameIn(List<String> values) {
            addCriterion("meal_name in", values, "mealName");
            return (Criteria) this;
        }

        public Criteria andMealNameNotIn(List<String> values) {
            addCriterion("meal_name not in", values, "mealName");
            return (Criteria) this;
        }

        public Criteria andMealNameBetween(String value1, String value2) {
            addCriterion("meal_name between", value1, value2, "mealName");
            return (Criteria) this;
        }

        public Criteria andMealNameNotBetween(String value1, String value2) {
            addCriterion("meal_name not between", value1, value2, "mealName");
            return (Criteria) this;
        }

        public Criteria andMealPriceIsNull() {
            addCriterion("meal_price is null");
            return (Criteria) this;
        }

        public Criteria andMealPriceIsNotNull() {
            addCriterion("meal_price is not null");
            return (Criteria) this;
        }

        public Criteria andMealPriceEqualTo(BigDecimal value) {
            addCriterion("meal_price =", value, "mealPrice");
            return (Criteria) this;
        }

        public Criteria andMealPriceNotEqualTo(BigDecimal value) {
            addCriterion("meal_price <>", value, "mealPrice");
            return (Criteria) this;
        }

        public Criteria andMealPriceGreaterThan(BigDecimal value) {
            addCriterion("meal_price >", value, "mealPrice");
            return (Criteria) this;
        }

        public Criteria andMealPriceGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("meal_price >=", value, "mealPrice");
            return (Criteria) this;
        }

        public Criteria andMealPriceLessThan(BigDecimal value) {
            addCriterion("meal_price <", value, "mealPrice");
            return (Criteria) this;
        }

        public Criteria andMealPriceLessThanOrEqualTo(BigDecimal value) {
            addCriterion("meal_price <=", value, "mealPrice");
            return (Criteria) this;
        }

        public Criteria andMealPriceIn(List<BigDecimal> values) {
            addCriterion("meal_price in", values, "mealPrice");
            return (Criteria) this;
        }

        public Criteria andMealPriceNotIn(List<BigDecimal> values) {
            addCriterion("meal_price not in", values, "mealPrice");
            return (Criteria) this;
        }

        public Criteria andMealPriceBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("meal_price between", value1, value2, "mealPrice");
            return (Criteria) this;
        }

        public Criteria andMealPriceNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("meal_price not between", value1, value2, "mealPrice");
            return (Criteria) this;
        }

        public Criteria andMealNumIsNull() {
            addCriterion("meal_num is null");
            return (Criteria) this;
        }

        public Criteria andMealNumIsNotNull() {
            addCriterion("meal_num is not null");
            return (Criteria) this;
        }

        public Criteria andMealNumEqualTo(Integer value) {
            addCriterion("meal_num =", value, "mealNum");
            return (Criteria) this;
        }

        public Criteria andMealNumNotEqualTo(Integer value) {
            addCriterion("meal_num <>", value, "mealNum");
            return (Criteria) this;
        }

        public Criteria andMealNumGreaterThan(Integer value) {
            addCriterion("meal_num >", value, "mealNum");
            return (Criteria) this;
        }

        public Criteria andMealNumGreaterThanOrEqualTo(Integer value) {
            addCriterion("meal_num >=", value, "mealNum");
            return (Criteria) this;
        }

        public Criteria andMealNumLessThan(Integer value) {
            addCriterion("meal_num <", value, "mealNum");
            return (Criteria) this;
        }

        public Criteria andMealNumLessThanOrEqualTo(Integer value) {
            addCriterion("meal_num <=", value, "mealNum");
            return (Criteria) this;
        }

        public Criteria andMealNumIn(List<Integer> values) {
            addCriterion("meal_num in", values, "mealNum");
            return (Criteria) this;
        }

        public Criteria andMealNumNotIn(List<Integer> values) {
            addCriterion("meal_num not in", values, "mealNum");
            return (Criteria) this;
        }

        public Criteria andMealNumBetween(Integer value1, Integer value2) {
            addCriterion("meal_num between", value1, value2, "mealNum");
            return (Criteria) this;
        }

        public Criteria andMealNumNotBetween(Integer value1, Integer value2) {
            addCriterion("meal_num not between", value1, value2, "mealNum");
            return (Criteria) this;
        }

        public Criteria andMealPictureIsNull() {
            addCriterion("meal_picture is null");
            return (Criteria) this;
        }

        public Criteria andMealPictureIsNotNull() {
            addCriterion("meal_picture is not null");
            return (Criteria) this;
        }

        public Criteria andMealPictureEqualTo(String value) {
            addCriterion("meal_picture =", value, "mealPicture");
            return (Criteria) this;
        }

        public Criteria andMealPictureNotEqualTo(String value) {
            addCriterion("meal_picture <>", value, "mealPicture");
            return (Criteria) this;
        }

        public Criteria andMealPictureGreaterThan(String value) {
            addCriterion("meal_picture >", value, "mealPicture");
            return (Criteria) this;
        }

        public Criteria andMealPictureGreaterThanOrEqualTo(String value) {
            addCriterion("meal_picture >=", value, "mealPicture");
            return (Criteria) this;
        }

        public Criteria andMealPictureLessThan(String value) {
            addCriterion("meal_picture <", value, "mealPicture");
            return (Criteria) this;
        }

        public Criteria andMealPictureLessThanOrEqualTo(String value) {
            addCriterion("meal_picture <=", value, "mealPicture");
            return (Criteria) this;
        }

        public Criteria andMealPictureLike(String value) {
            addCriterion("meal_picture like", value, "mealPicture");
            return (Criteria) this;
        }

        public Criteria andMealPictureNotLike(String value) {
            addCriterion("meal_picture not like", value, "mealPicture");
            return (Criteria) this;
        }

        public Criteria andMealPictureIn(List<String> values) {
            addCriterion("meal_picture in", values, "mealPicture");
            return (Criteria) this;
        }

        public Criteria andMealPictureNotIn(List<String> values) {
            addCriterion("meal_picture not in", values, "mealPicture");
            return (Criteria) this;
        }

        public Criteria andMealPictureBetween(String value1, String value2) {
            addCriterion("meal_picture between", value1, value2, "mealPicture");
            return (Criteria) this;
        }

        public Criteria andMealPictureNotBetween(String value1, String value2) {
            addCriterion("meal_picture not between", value1, value2, "mealPicture");
            return (Criteria) this;
        }

        public Criteria andMealStatusIsNull() {
            addCriterion("meal_status is null");
            return (Criteria) this;
        }

        public Criteria andMealStatusIsNotNull() {
            addCriterion("meal_status is not null");
            return (Criteria) this;
        }

        public Criteria andMealStatusEqualTo(Byte value) {
            addCriterion("meal_status =", value, "mealStatus");
            return (Criteria) this;
        }

        public Criteria andMealStatusNotEqualTo(Byte value) {
            addCriterion("meal_status <>", value, "mealStatus");
            return (Criteria) this;
        }

        public Criteria andMealStatusGreaterThan(Byte value) {
            addCriterion("meal_status >", value, "mealStatus");
            return (Criteria) this;
        }

        public Criteria andMealStatusGreaterThanOrEqualTo(Byte value) {
            addCriterion("meal_status >=", value, "mealStatus");
            return (Criteria) this;
        }

        public Criteria andMealStatusLessThan(Byte value) {
            addCriterion("meal_status <", value, "mealStatus");
            return (Criteria) this;
        }

        public Criteria andMealStatusLessThanOrEqualTo(Byte value) {
            addCriterion("meal_status <=", value, "mealStatus");
            return (Criteria) this;
        }

        public Criteria andMealStatusIn(List<Byte> values) {
            addCriterion("meal_status in", values, "mealStatus");
            return (Criteria) this;
        }

        public Criteria andMealStatusNotIn(List<Byte> values) {
            addCriterion("meal_status not in", values, "mealStatus");
            return (Criteria) this;
        }

        public Criteria andMealStatusBetween(Byte value1, Byte value2) {
            addCriterion("meal_status between", value1, value2, "mealStatus");
            return (Criteria) this;
        }

        public Criteria andMealStatusNotBetween(Byte value1, Byte value2) {
            addCriterion("meal_status not between", value1, value2, "mealStatus");
            return (Criteria) this;
        }

        public Criteria andPublisherIsNull() {
            addCriterion("publisher is null");
            return (Criteria) this;
        }

        public Criteria andPublisherIsNotNull() {
            addCriterion("publisher is not null");
            return (Criteria) this;
        }

        public Criteria andPublisherEqualTo(String value) {
            addCriterion("publisher =", value, "publisher");
            return (Criteria) this;
        }

        public Criteria andPublisherNotEqualTo(String value) {
            addCriterion("publisher <>", value, "publisher");
            return (Criteria) this;
        }

        public Criteria andPublisherGreaterThan(String value) {
            addCriterion("publisher >", value, "publisher");
            return (Criteria) this;
        }

        public Criteria andPublisherGreaterThanOrEqualTo(String value) {
            addCriterion("publisher >=", value, "publisher");
            return (Criteria) this;
        }

        public Criteria andPublisherLessThan(String value) {
            addCriterion("publisher <", value, "publisher");
            return (Criteria) this;
        }

        public Criteria andPublisherLessThanOrEqualTo(String value) {
            addCriterion("publisher <=", value, "publisher");
            return (Criteria) this;
        }

        public Criteria andPublisherLike(String value) {
            addCriterion("publisher like", value, "publisher");
            return (Criteria) this;
        }

        public Criteria andPublisherNotLike(String value) {
            addCriterion("publisher not like", value, "publisher");
            return (Criteria) this;
        }

        public Criteria andPublisherIn(List<String> values) {
            addCriterion("publisher in", values, "publisher");
            return (Criteria) this;
        }

        public Criteria andPublisherNotIn(List<String> values) {
            addCriterion("publisher not in", values, "publisher");
            return (Criteria) this;
        }

        public Criteria andPublisherBetween(String value1, String value2) {
            addCriterion("publisher between", value1, value2, "publisher");
            return (Criteria) this;
        }

        public Criteria andPublisherNotBetween(String value1, String value2) {
            addCriterion("publisher not between", value1, value2, "publisher");
            return (Criteria) this;
        }

        public Criteria andMealIntroIsNull() {
            addCriterion("meal_intro is null");
            return (Criteria) this;
        }

        public Criteria andMealIntroIsNotNull() {
            addCriterion("meal_intro is not null");
            return (Criteria) this;
        }

        public Criteria andMealIntroEqualTo(String value) {
            addCriterion("meal_intro =", value, "mealIntro");
            return (Criteria) this;
        }

        public Criteria andMealIntroNotEqualTo(String value) {
            addCriterion("meal_intro <>", value, "mealIntro");
            return (Criteria) this;
        }

        public Criteria andMealIntroGreaterThan(String value) {
            addCriterion("meal_intro >", value, "mealIntro");
            return (Criteria) this;
        }

        public Criteria andMealIntroGreaterThanOrEqualTo(String value) {
            addCriterion("meal_intro >=", value, "mealIntro");
            return (Criteria) this;
        }

        public Criteria andMealIntroLessThan(String value) {
            addCriterion("meal_intro <", value, "mealIntro");
            return (Criteria) this;
        }

        public Criteria andMealIntroLessThanOrEqualTo(String value) {
            addCriterion("meal_intro <=", value, "mealIntro");
            return (Criteria) this;
        }

        public Criteria andMealIntroLike(String value) {
            addCriterion("meal_intro like", value, "mealIntro");
            return (Criteria) this;
        }

        public Criteria andMealIntroNotLike(String value) {
            addCriterion("meal_intro not like", value, "mealIntro");
            return (Criteria) this;
        }

        public Criteria andMealIntroIn(List<String> values) {
            addCriterion("meal_intro in", values, "mealIntro");
            return (Criteria) this;
        }

        public Criteria andMealIntroNotIn(List<String> values) {
            addCriterion("meal_intro not in", values, "mealIntro");
            return (Criteria) this;
        }

        public Criteria andMealIntroBetween(String value1, String value2) {
            addCriterion("meal_intro between", value1, value2, "mealIntro");
            return (Criteria) this;
        }

        public Criteria andMealIntroNotBetween(String value1, String value2) {
            addCriterion("meal_intro not between", value1, value2, "mealIntro");
            return (Criteria) this;
        }

        public Criteria andCategoryIsNull() {
            addCriterion("category is null");
            return (Criteria) this;
        }

        public Criteria andCategoryIsNotNull() {
            addCriterion("category is not null");
            return (Criteria) this;
        }

        public Criteria andCategoryEqualTo(String value) {
            addCriterion("category =", value, "category");
            return (Criteria) this;
        }

        public Criteria andCategoryNotEqualTo(String value) {
            addCriterion("category <>", value, "category");
            return (Criteria) this;
        }

        public Criteria andCategoryGreaterThan(String value) {
            addCriterion("category >", value, "category");
            return (Criteria) this;
        }

        public Criteria andCategoryGreaterThanOrEqualTo(String value) {
            addCriterion("category >=", value, "category");
            return (Criteria) this;
        }

        public Criteria andCategoryLessThan(String value) {
            addCriterion("category <", value, "category");
            return (Criteria) this;
        }

        public Criteria andCategoryLessThanOrEqualTo(String value) {
            addCriterion("category <=", value, "category");
            return (Criteria) this;
        }

        public Criteria andCategoryLike(String value) {
            addCriterion("category like", value, "category");
            return (Criteria) this;
        }

        public Criteria andCategoryNotLike(String value) {
            addCriterion("category not like", value, "category");
            return (Criteria) this;
        }

        public Criteria andCategoryIn(List<String> values) {
            addCriterion("category in", values, "category");
            return (Criteria) this;
        }

        public Criteria andCategoryNotIn(List<String> values) {
            addCriterion("category not in", values, "category");
            return (Criteria) this;
        }

        public Criteria andCategoryBetween(String value1, String value2) {
            addCriterion("category between", value1, value2, "category");
            return (Criteria) this;
        }

        public Criteria andCategoryNotBetween(String value1, String value2) {
            addCriterion("category not between", value1, value2, "category");
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