package com.example.myblog.test.builderpattern;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/20 22:24
 */

public class Pepsi extends ColdDrink {

    @Override
    public float price() {
        return 35.0f;
    }

    @Override
    public String name() {
        return "Pepsi";
    }
}
