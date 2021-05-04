package com.example.myblog.test.designpatternDemo.statepattern;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/25 22:52
 */

public class StopState implements State {

    public void doAction(Context context) {
        System.out.println("Player is in stop state");
        context.setState(this);
    }

    public String toString(){
        return "Stop State";
    }
}
