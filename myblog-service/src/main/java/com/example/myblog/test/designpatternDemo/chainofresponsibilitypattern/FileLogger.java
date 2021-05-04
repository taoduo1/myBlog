package com.example.myblog.test.designpatternDemo.chainofresponsibilitypattern;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/27 22:58
 */

public class FileLogger extends AbstractLogger {

    public FileLogger(int level){
        this.level = level;
    }

    @Override
    protected void write(String message) {
        System.out.println("File::Logger: " + message);
    }
}