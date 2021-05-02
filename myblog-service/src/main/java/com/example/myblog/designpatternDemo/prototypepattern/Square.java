package com.example.myblog.designpatternDemo.prototypepattern;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/20 22:42
 */

public class Square extends Shape {

    public Square(){
        type = "Square";
    }

    @Override
    public void draw() {
        System.out.println("Inside Square::draw() method.");
    }
}
