package com.example.myblog.test.designpatternDemo.observerpattern;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/26 23:19
 */

public class OctalObserver extends Observer{

    public OctalObserver(Subject subject){
        this.subject = subject;
        this.subject.attach(this);
    }

    @Override
    public void update() {
        System.out.println( "Octal String: "
                + Integer.toOctalString( subject.getState() ) );
    }
}