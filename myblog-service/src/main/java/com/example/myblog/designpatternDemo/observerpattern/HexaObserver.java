package com.example.myblog.designpatternDemo.observerpattern;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/26 23:19
 */

public class HexaObserver extends Observer{

    public HexaObserver(Subject subject){
        this.subject = subject;
        this.subject.attach(this);
    }

    @Override
    public void update() {
        System.out.println( "Hex String: "
                + Integer.toHexString( subject.getState() ).toUpperCase() );
    }
}