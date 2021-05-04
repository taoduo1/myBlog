package com.example.myblog.test.designpatternDemo.mementopattern;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/26 23:23
 */

public class Memento {
    private String state;

    public Memento(String state){
        this.state = state;
    }

    public String getState(){
        return state;
    }
}
