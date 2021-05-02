package com.example.myblog.designpatternDemo.decoratorpattern;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/22 22:25
 */

public class Rectangle implements Shape {

    @Override
    public void draw() {
        System.out.println("Shape: Rectangle");
    }
}