package com.example.myblog.test.designpatternDemo.builderpattern;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/20 22:24
 */

public abstract class ColdDrink implements Item {

    @Override
    public Packing packing() {
        return new Bottle();
    }

    @Override
    public abstract float price();
}
