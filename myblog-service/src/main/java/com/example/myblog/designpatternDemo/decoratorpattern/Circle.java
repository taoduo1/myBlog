package com.example.myblog.designpatternDemo.decoratorpattern;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/22 22:26
 */

public class Circle implements Shape {

    @Override
    public void draw() {
        System.out.println("Shape: Circle");
    }
}