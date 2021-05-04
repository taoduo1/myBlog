package com.example.myblog.test.designpatternDemo.strategypattern;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/25 22:49
 */

public class OperationMultiply implements Strategy{
    @Override
    public int doOperation(int num1, int num2) {
        return num1 * num2;
    }
}