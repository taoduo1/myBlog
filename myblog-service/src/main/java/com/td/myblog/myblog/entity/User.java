package com.td.myblog.myblog.entity;

/*
 *
 * @Company
 * @Description: 
 * @Author duo.tao
 * @Date 18/07/2019 17:24 
 */
public class User {

    private Integer id;

    private String name;

    private Integer age;

    private Double money;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }

    public void getMoneys(){
        System.out.println(1);
    }
}
