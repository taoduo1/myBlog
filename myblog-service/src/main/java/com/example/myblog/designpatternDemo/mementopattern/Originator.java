package com.example.myblog.designpatternDemo.mementopattern;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/26 23:23
 */

public class Originator {
    private String state;

    public void setState(String state){
        this.state = state;
    }

    public String getState(){
        return state;
    }

    public Memento saveStateToMemento(){
        return new Memento(state);
    }

    public void getStateFromMemento(Memento Memento){
        state = Memento.getState();
    }
}
