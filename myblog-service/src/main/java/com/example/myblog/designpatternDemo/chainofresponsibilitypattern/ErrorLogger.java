package com.example.myblog.designpatternDemo.chainofresponsibilitypattern;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/27 22:58
 */

public class ErrorLogger extends AbstractLogger {

    public ErrorLogger(int level){
        this.level = level;
    }

    @Override
    protected void write(String message) {
        System.out.println("Error Console::Logger: " + message);
    }
}