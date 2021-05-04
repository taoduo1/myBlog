package com.example.myblog.test.designpatternDemo.abstractfactory;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/20 21:58
 */

public class Square implements Shape {

    @Override
    public void draw() {
        System.out.println("Inside Square::draw() method.");
    }
}
