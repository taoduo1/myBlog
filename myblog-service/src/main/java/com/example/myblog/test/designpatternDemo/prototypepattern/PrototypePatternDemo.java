package com.example.myblog.test.designpatternDemo.prototypepattern;

/**
 * @author : duo.tao
 * @description : 原型模式 创建重复的对象，同时又能保证性能，
 * 实现 Cloneable接口，并重写clone方法 ，在使用的时候直接clone就行，避免了重复创建对象的操作
 * @date : 2021/4/20 22:43
 */

public class PrototypePatternDemo {
    public static void main(String[] args) {
        ShapeCache.loadCache();

        Shape clonedShape = (Shape) ShapeCache.getShape("1");
        System.out.println("Shape : " + clonedShape.getType());

        Shape clonedShape2 = (Shape) ShapeCache.getShape("2");
        System.out.println("Shape : " + clonedShape2.getType());

        Shape clonedShape3 = (Shape) ShapeCache.getShape("3");
        System.out.println("Shape : " + clonedShape3.getType());
    }
}
