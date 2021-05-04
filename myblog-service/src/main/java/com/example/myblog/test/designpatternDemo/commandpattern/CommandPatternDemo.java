package com.example.myblog.test.designpatternDemo.commandpattern;

/**
 * @author : duo.tao
 * @description : 命令模式 把动作封装成一个对象，这个对象可以放入一个队列中 ，实现各个操作
 * @date : 2021/4/26 23:40
 */

public class CommandPatternDemo {
    public static void main(String[] args) {
        Stock abcStock = new Stock();

        BuyStock buyStockOrder = new BuyStock(abcStock);
        SellStock sellStockOrder = new SellStock(abcStock);

        Broker broker = new Broker();
        broker.takeOrder(buyStockOrder);
        broker.takeOrder(sellStockOrder);

        broker.placeOrders();
    }
}
