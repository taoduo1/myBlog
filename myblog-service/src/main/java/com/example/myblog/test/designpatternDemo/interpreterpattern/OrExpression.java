package com.example.myblog.test.designpatternDemo.interpreterpattern;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/25 22:41
 */

public class OrExpression implements Expression {

    private Expression expr1 = null;
    private Expression expr2 = null;

    public OrExpression(Expression expr1, Expression expr2) {
        this.expr1 = expr1;
        this.expr2 = expr2;
    }

    @Override
    public boolean interpret(String context) {
        return expr1.interpret(context) || expr2.interpret(context);
    }
}
