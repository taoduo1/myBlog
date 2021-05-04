package com.example.myblog.test.designpatternDemo.observerpattern;

/**
 * @author : duo.tao
 * @description : 观察者类
 * @date : 2021/4/26 23:18
 */

public class BinaryObserver extends Observer{

    public BinaryObserver(Subject subject){
        this.subject = subject;
        this.subject.attach(this);
    }

    @Override
    public void update() {
        System.out.println( "Binary String: "
                + Integer.toBinaryString( subject.getState() ) );
    }
}
