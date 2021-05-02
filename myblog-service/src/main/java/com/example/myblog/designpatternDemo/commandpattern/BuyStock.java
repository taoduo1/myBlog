package com.example.myblog.designpatternDemo.commandpattern;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/26 23:39
 */

public class BuyStock implements Order {
    private Stock abcStock;

    public BuyStock(Stock abcStock){
        this.abcStock = abcStock;
    }

    public void execute() {
        abcStock.buy();
    }
}
