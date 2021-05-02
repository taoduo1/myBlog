package com.example.myblog.designpatternDemo.observerpattern;

/**
 * @author : duo.tao
 * @description : 观察者模式 对象发生改变的时候，依赖它的相关对象都会得到通知
 * 这个 Subject 类下有3个依赖类 当subject 类的状态发生改变的时候，就调用notify 方法，来通知依赖它的相关的类
 * @date : 2021/4/26 23:19
 */

public class ObserverPatternDemo {
    public static void main(String[] args) {
        Subject subject = new Subject();

        new HexaObserver(subject);
        new OctalObserver(subject);
        new BinaryObserver(subject);

        System.out.println("First state change: 15");
        subject.setState(15);
        System.out.println("Second state change: 10");
        subject.setState(10);
    }
}
