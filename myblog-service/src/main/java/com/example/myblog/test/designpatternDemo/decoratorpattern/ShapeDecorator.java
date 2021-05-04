package com.example.myblog.test.designpatternDemo.decoratorpattern;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/22 22:26
 */

public abstract class ShapeDecorator implements Shape {
    protected Shape decoratedShape;

    public ShapeDecorator(Shape decoratedShape){
        this.decoratedShape = decoratedShape;
    }

    public void draw(){
        decoratedShape.draw();
    }
}