package com.example.myblog.designpatternDemo.mediatorpattern;

/**
 * @author : duo.tao
 * @description : 中介者模式，通过调用一个第三方类，达到同时调用的效果，
 * 比如有个微信用户表，有个qq用户表，关联的是同一个用户，微信用户表中存了用户名称，qq用户表也存了用户名称，
 * 修改了用户名称就要同时修改微信用户表及qq用户表， 这时候引入第三方操作类，在修改的时候调用第三方操作类，第三方操作类负责修改所有需要修改的表
 * @date : 2021/4/26 23:31
 */

public class MediatorPatternDemo {
    public static void main(String[] args) {
        User robert = new User("Robert");
        User john = new User("John");

        robert.sendMessage("Hi! John!");
        john.sendMessage("Hello! Robert!");
    }

}
