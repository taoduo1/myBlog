package com.example.myblog.designpatternDemo.decoratorpattern;

/**
 * @author : duo.tao
 * @description : 装饰器模式
 * 需要对原有的功能新增加方法时，我们可以通过定义一个抽象装饰器类，然后在装饰器类的实现类中实现父类的接口，并增加新的功能来以供使用
 * @date : 2021/4/22 22:26
 */

public class DecoratorPatternDemo {
    public static void main(String[] args) {

        Shape circle = new Circle();
        Shape redCircle = new RedShapeDecorator(new Circle());
        Shape redRectangle = new RedShapeDecorator(new Rectangle());

        System.out.println("Circle with normal border");
        circle.draw();

        System.out.println("\nCircle of red border");
        redCircle.draw();

        System.out.println("\nRectangle of red border");
        redRectangle.draw();
    }
}
