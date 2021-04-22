package com.example.myblog.test.builderpattern;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/20 22:24
 */

public class VegBurger  extends Burger {

    @Override
    public float price() {
        return 25.0f;
    }

    @Override
    public String name() {
        return "Veg Burger";
    }
}
