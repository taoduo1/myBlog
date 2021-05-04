package com.example.myblog.test.designpatternDemo.bridgepattern;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/21 23:03
 */

public abstract class Shape {
    protected DrawAPI drawAPI;
    protected Shape(DrawAPI drawAPI){
        this.drawAPI = drawAPI;
    }
    public abstract void draw();
}