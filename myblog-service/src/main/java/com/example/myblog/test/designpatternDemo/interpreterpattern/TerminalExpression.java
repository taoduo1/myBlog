package com.example.myblog.test.designpatternDemo.interpreterpattern;

/**
 * @author : duo.tao
 * @description : 解释器模式
 * @date : 2021/4/25 22:41
 */

public class TerminalExpression  implements Expression {

    private String data;

    public TerminalExpression(String data){
        this.data = data;
    }

    @Override
    public boolean interpret(String context) {
        if(context.contains(data)){
            return true;
        }
        return false;
    }
}