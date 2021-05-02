package com.example.myblog.designpatternDemo.strategypattern;

/**
 * @author : duo.tao
 * @description : 策略模式
 *  定义一系列算法，使得它们可以替换，定一个 Strategy接口中有个 doOperation 方法，然后实现接口，通过传入不同的类来做不同的事
 * @date : 2021/4/25 22:50
 */

public class StrategyPatternDemo {
    public static void main(String[] args) {
        Context context = new Context(new OperationAdd());
        System.out.println("10 + 5 = " + context.executeStrategy(10, 5));

        context = new Context(new OperationSubtract());
        System.out.println("10 - 5 = " + context.executeStrategy(10, 5));

        context = new Context(new OperationMultiply());
        System.out.println("10 * 5 = " + context.executeStrategy(10, 5));
    }
}
