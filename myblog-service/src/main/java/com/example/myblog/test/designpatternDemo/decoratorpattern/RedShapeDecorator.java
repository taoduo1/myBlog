package com.example.myblog.test.designpatternDemo.decoratorpattern;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/22 22:26
 */

public class RedShapeDecorator extends ShapeDecorator {

    public RedShapeDecorator(Shape decoratedShape) {
        super(decoratedShape);
    }

    @Override
    public void draw() {
        decoratedShape.draw();
        setRedBorder(decoratedShape);
    }

    private void setRedBorder(Shape decoratedShape){
        System.out.println("Border Color: Red");
    }
}