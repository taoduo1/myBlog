package com.example.myblog.test.designpatternDemo.observerpattern;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/26 23:18
 */

public abstract class Observer {
    protected Subject subject;
    public abstract void update();
}