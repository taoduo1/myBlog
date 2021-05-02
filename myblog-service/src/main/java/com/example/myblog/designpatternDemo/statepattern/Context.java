package com.example.myblog.designpatternDemo.statepattern;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/25 22:51
 */

public class Context {
    private State state;

    public Context(){
        state = null;
    }

    public void setState(State state){
        this.state = state;
    }

    public State getState(){
        return state;
    }
}