package com.example.myblog.test.designpatternDemo.statepattern;

/**
 * @author : duo.tao
 * @description : 状态模式 通过改变对象的状态来控制对象的操作
 * Context 这个有个状态，状态1的时候输出start 状态2的时候输出stop
 * @date : 2021/4/25 22:52
 */

public class StatePatternDemo {
    public static void main(String[] args) {
        Context context = new Context();

        StartState startState = new StartState();
        startState.doAction(context);

        System.out.println(context.getState().toString());

        StopState stopState = new StopState();
        stopState.doAction(context);

        System.out.println(context.getState().toString());
    }
}
