package com.example.myblog.test.abstractfactory;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/20 21:59
 */

public abstract class AbstractFactory {
    public abstract Color getColor(String color);
    public abstract Shape getShape(String shape) ;
}
