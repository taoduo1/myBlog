package com.example.myblog.designpatternDemo.flyweightpattern;

import java.util.HashMap;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/22 22:48
 */

public class ShapeFactory {
    private static final HashMap<String, Shape> circleMap = new HashMap<>();

    public static Shape getCircle(String color) {
        Circle circle = (Circle)circleMap.get(color);

        if(circle == null) {
            circle = new Circle(color);
            circleMap.put(color, circle);
            System.out.println("Creating circle of color : " + color);
        }
        return circle;
    }
}
