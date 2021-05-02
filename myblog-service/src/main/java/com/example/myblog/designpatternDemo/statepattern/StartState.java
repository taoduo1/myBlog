package com.example.myblog.designpatternDemo.statepattern;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/25 22:52
 */

public class StartState implements State {

    public void doAction(Context context) {
        System.out.println("Player is in start state");
        context.setState(this);
    }

    public String toString(){
        return "Start State";
    }
}
