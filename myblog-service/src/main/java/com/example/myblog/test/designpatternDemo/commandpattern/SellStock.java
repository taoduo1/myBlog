package com.example.myblog.test.designpatternDemo.commandpattern;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/26 23:40
 */

public class SellStock implements Order {
    private Stock abcStock;

    public SellStock(Stock abcStock){
        this.abcStock = abcStock;
    }

    public void execute() {
        abcStock.sell();
    }
}