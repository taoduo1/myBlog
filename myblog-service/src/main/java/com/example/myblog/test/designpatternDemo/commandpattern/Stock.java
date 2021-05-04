package com.example.myblog.test.designpatternDemo.commandpattern;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/26 23:39
 */

public class Stock {
    private String name = "ABC";
    private int quantity = 10;

    public void buy(){
        System.out.println("Stock [ Name: "+name+", Quantity: " + quantity +" ] bought");
    }
    public void sell(){
        System.out.println("Stock [ Name: "+name+", Quantity: " + quantity +" ] sold");
    }
}
