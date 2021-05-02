package com.example.myblog.designpatternDemo.bridgepattern;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/21 23:03
 */

public class Circle extends Shape {
    private int x, y, radius;

    public Circle(int x, int y, int radius, DrawAPI drawAPI) {
        super(drawAPI);
        this.x = x;
        this.y = y;
        this.radius = radius;
    }

    public void draw() {
        drawAPI.drawCircle(radius,x,y);
    }
}
