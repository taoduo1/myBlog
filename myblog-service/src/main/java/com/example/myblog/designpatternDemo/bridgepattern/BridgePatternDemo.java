package com.example.myblog.designpatternDemo.bridgepattern;

/**
 * @author : duo.tao
 * @description : 桥接模式 就是解耦，有一个shape类，要分别使用两个类的方法，shape调用类1 的方法和shape调用类2的方法
 * 我们为了编码方便及简化，将类1与类2 抽象出一个接口，同时实现这个接口
 * shape调用的时候就只需要调用接口就可以了，而不用每次都写一遍方法的调用
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
