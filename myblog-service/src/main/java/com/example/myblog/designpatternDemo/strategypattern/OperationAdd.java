package com.example.myblog.designpatternDemo.strategypattern;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/25 22:48
 */

public class OperationAdd implements Strategy {
    @Override
    public int doOperation(int num1, int num2) {
        return num1 + num2;
    }
}
