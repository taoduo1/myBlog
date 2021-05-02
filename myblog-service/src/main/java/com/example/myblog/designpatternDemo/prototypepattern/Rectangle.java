package com.example.myblog.designpatternDemo.prototypepattern;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/20 22:42
 */

public class Rectangle extends Shape {

    public Rectangle(){
        type = "Rectangle";
    }

    @Override
    public void draw() {
        System.out.println("Inside Rectangle::draw() method.");
    }
}