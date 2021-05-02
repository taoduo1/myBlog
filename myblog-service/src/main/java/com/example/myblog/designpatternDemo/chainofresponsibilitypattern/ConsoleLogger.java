package com.example.myblog.designpatternDemo.chainofresponsibilitypattern;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/27 22:57
 */

public class ConsoleLogger extends AbstractLogger {

    public ConsoleLogger(int level){
        this.level = level;
    }

    @Override
    protected void write(String message) {
        System.out.println("Standard Console::Logger: " + message);
    }
}