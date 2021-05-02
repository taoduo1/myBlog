package com.example.myblog.designpatternDemo.mementopattern;

/**
 * @author : duo.tao
 * @description : 备忘录模式 用一个list 存储对象的状态，调用 getStateFromMemento 方法，将list中保存的状态 覆盖到对象中去，达到备忘录的效果
 * @date : 2021/4/26 23:24
 */

public class MementoPatternDemo {
    public static void main(String[] args) {
        Originator originator = new Originator();
        CareTaker careTaker = new CareTaker();
        originator.setState("State #1");
        originator.setState("State #2");
        careTaker.add(originator.saveStateToMemento());
        originator.setState("State #3");
        careTaker.add(originator.saveStateToMemento());
        originator.setState("State #4");

        System.out.println("Current State: " + originator.getState());
        originator.getStateFromMemento(careTaker.get(0));
        System.out.println("First saved State: " + originator.getState());
        originator.getStateFromMemento(careTaker.get(1));
        System.out.println("Second saved State: " + originator.getState());
    }
}
