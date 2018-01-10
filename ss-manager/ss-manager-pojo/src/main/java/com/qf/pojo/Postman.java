package com.qf.pojo;

public class Postman {
    private Long id;

    private String pName;

    private String pMobie;

    private Byte gender;

    private Integer age;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName == null ? null : pName.trim();
    }

    public String getpMobie() {
        return pMobie;
    }

    public void setpMobie(String pMobie) {
        this.pMobie = pMobie == null ? null : pMobie.trim();
    }

    public Byte getGender() {
        return gender;
    }

    public void setGender(Byte gender) {
        this.gender = gender;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }
}