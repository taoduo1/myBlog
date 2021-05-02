package com.example.myblog.designpatternDemo.chainofresponsibilitypattern;

/**
 * @author : duo.tao
 * @description : 责任链模式，用链表的方式，在对象中构建下一级执行方法对象，
 * 类1 下链接类2 类2下链接类3 类3下链接类4 调用类1查看类1是否处理，如果类1不能处理调用类2、、、
 * 以链表形式展示调用方式
 * @date : 2021/4/27 22:58
 */

public class ChainPatternDemo {

    private static AbstractLogger getChainOfLoggers(){

        AbstractLogger errorLogger = new ErrorLogger(AbstractLogger.ERROR);
        AbstractLogger fileLogger = new FileLogger(AbstractLogger.DEBUG);
        AbstractLogger consoleLogger = new ConsoleLogger(AbstractLogger.INFO);

        errorLogger.setNextLogger(fileLogger);
        fileLogger.setNextLogger(consoleLogger);

        return errorLogger;
    }

    public static void main(String[] args) {
        AbstractLogger loggerChain = getChainOfLoggers();
        System.out.println(1);
        loggerChain.logMessage(AbstractLogger.INFO, "This is an information.");
        System.out.println(2);
        loggerChain.logMessage(AbstractLogger.DEBUG,
                "This is a debug level information.");
        System.out.println(3);
        loggerChain.logMessage(AbstractLogger.ERROR,
                "This is an error information.");
    }
}
