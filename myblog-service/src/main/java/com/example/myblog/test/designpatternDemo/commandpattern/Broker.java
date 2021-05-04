package com.example.myblog.test.designpatternDemo.commandpattern;

import java.util.ArrayList;
import java.util.List;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/26 23:40
 */

public class Broker {
    private List<Order> orderList = new ArrayList<Order>();

    public void takeOrder(Order order){
        orderList.add(order);
    }

    public void placeOrders(){
        for (Order order : orderList) {
            order.execute();
        }
        orderList.clear();
    }
}
