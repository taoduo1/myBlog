package com.example.myblog.test.designpatternDemo.interpreterpattern;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/25 22:41
 */

public interface Expression {
    public boolean interpret(String context);
}
