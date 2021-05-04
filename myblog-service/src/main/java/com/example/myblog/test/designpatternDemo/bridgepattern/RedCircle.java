package com.example.myblog.test.designpatternDemo.bridgepattern;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/21 23:02
 */

public class RedCircle implements DrawAPI {
    @Override
    public void drawCircle(int radius, int x, int y) {
        System.out.println("Drawing Circle[ color: red, radius: "
                + radius +", x: " +x+", "+ y +"]");
    }
}