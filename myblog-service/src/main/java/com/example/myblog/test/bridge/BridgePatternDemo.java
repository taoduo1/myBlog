package com.example.myblog.test.bridge;

/**
 * @author : duo.tao
 * @description : 桥接模式
 * @date : 2021/4/21 23:03
 */

public class BridgePatternDemo {
    public static void main(String[] args) {
        Shape redCircle = new Circle(100,100, 10, new RedCircle());
        Shape greenCircle = new Circle(100,100, 10, new GreenCircle());

        redCircle.draw();
        greenCircle.draw();
    }
}
