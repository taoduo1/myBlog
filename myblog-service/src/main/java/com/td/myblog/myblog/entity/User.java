package com.td.myblog.myblog.entity;

/*
 *
 * @Company 太美医疗科技
 * @Description: 
 * @Author duo.tao
 * @Date 18/07/2019 17:24 
 */
public class User {

    private int id;
    private String name;
    private int age;
    private double money;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public double getMoney() {
        return money;
    }

    public void setMoney(double money) {
        this.money = money;
    }
}
