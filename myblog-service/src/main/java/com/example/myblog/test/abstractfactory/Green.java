package com.example.myblog.test.abstractfactory;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/20 21:59
 */

public class Green implements Color {

    @Override
    public void fill() {
        System.out.println("Inside Green::fill() method.");
    }
}
