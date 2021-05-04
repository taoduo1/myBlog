package com.example.myblog.test.designpatternDemo.interpreterpattern;

/**
 * @author : duo.tao
 * @description : 解释器模式
 * 就是写死一个逻辑 ，然后调用的时候按写死逻辑，让写进去的东西按逻辑执行 下面的就是 是否 John 或 Robert
 * @date : 2021/4/25 22:43
 */

public class InterpreterPatternDemo {
    //规则：Robert 和 John 是男性
    public static Expression getMaleExpression(){
        Expression robert = new TerminalExpression("Robert");
        Expression john = new TerminalExpression("John");
        return new OrExpression(robert, john);
    }

    //规则：Julie 是一个已婚的女性
    public static Expression getMarriedWomanExpression(){
        Expression julie = new TerminalExpression("Julie");
        Expression married = new TerminalExpression("Married");
        return new AndExpression(julie, married);
    }

    public static void main(String[] args) {
        Expression isMale = getMaleExpression();
        Expression isMarriedWoman = getMarriedWomanExpression();

        System.out.println("John is male? " + isMale.interpret("John"));
        System.out.println("Julie is a married women? "
                + isMarriedWoman.interpret("Married Julie"));
    }
}
