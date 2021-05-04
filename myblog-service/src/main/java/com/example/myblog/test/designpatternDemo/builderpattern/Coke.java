package com.example.myblog.test.designpatternDemo.builderpattern;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/20 22:24
 */

public class Coke extends ColdDrink {

    @Override
    public float price() {
        return 30.0f;
    }

    @Override
    public String name() {
        return "Coke";
    }
}