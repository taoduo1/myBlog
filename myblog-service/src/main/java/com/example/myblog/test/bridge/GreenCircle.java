package com.example.myblog.test.bridge;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/21 23:02
 */

public class GreenCircle implements DrawAPI {
    @Override
    public void drawCircle(int radius, int x, int y) {
        System.out.println("Drawing Circle[ color: green, radius: "
                + radius +", x: " +x+", "+ y +"]");
    }
}
