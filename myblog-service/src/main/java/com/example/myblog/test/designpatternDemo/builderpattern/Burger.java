package com.example.myblog.test.designpatternDemo.builderpattern;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/20 22:23
 */

public abstract class Burger implements Item {

    @Override
    public Packing packing() {
        return new Wrapper();
    }

    @Override
    public abstract float price();
}
