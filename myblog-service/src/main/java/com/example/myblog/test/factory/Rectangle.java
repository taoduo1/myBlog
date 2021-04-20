package com.example.myblog.test.factory;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/20 21:54
 */

public class Rectangle  implements Shape {

    @Override
    public void draw() {
        System.out.println("Inside Rectangle::draw() method.");
    }
}