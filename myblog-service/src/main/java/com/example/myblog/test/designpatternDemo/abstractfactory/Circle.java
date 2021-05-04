package com.example.myblog.test.designpatternDemo.abstractfactory;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/20 21:58
 */

public class Circle implements Shape {

    @Override
    public void draw() {
        System.out.println("Inside Circle::draw() method.");
    }
}
