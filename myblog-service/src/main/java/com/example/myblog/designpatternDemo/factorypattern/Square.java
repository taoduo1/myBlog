package com.example.myblog.designpatternDemo.factorypattern;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/20 21:54
 */

public class Square implements Shape {

    @Override
    public void draw() {
        System.out.println("Inside Square::draw() method.");
    }
}