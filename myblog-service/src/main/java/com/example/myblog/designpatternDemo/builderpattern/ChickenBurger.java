package com.example.myblog.designpatternDemo.builderpattern;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/20 22:24
 */

public class ChickenBurger extends Burger {

    @Override
    public float price() {
        return 50.5f;
    }

    @Override
    public String name() {
        return "Chicken Burger";
    }
}
