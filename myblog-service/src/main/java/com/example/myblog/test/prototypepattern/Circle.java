package com.example.myblog.test.prototypepattern;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/20 22:42
 */

public class Circle extends Shape {

    public Circle(){
        type = "Circle";
    }

    @Override
    public void draw() {
        System.out.println("Inside Circle::draw() method.");
    }
}
