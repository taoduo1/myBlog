package com.example.myblog.test.designpatternDemo.filterpattern;

import lombok.Data;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/22 22:01
 */

@Data
public class Person {
    private String name;
    private String gender;
    private String maritalStatus;

    public Person(String name,String gender,String maritalStatus){
        this.name = name;
        this.gender = gender;
        this.maritalStatus = maritalStatus;
    }

}
