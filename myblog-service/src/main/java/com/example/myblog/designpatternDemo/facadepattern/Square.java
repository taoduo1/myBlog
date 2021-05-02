package com.example.myblog.designpatternDemo.facadepattern;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/22 22:40
 */

public class Square implements Shape {

    @Override
    public void draw() {
        System.out.println("Square::draw()");
    }
}