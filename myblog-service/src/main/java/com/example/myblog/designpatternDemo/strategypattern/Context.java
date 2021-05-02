package com.example.myblog.designpatternDemo.strategypattern;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/25 22:49
 */

public class Context {
    private Strategy strategy;

    public Context(Strategy strategy){
        this.strategy = strategy;
    }

    public int executeStrategy(int num1, int num2){
        return strategy.doOperation(num1, num2);
    }
}
