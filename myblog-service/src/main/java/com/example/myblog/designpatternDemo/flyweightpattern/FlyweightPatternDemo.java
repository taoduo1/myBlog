package com.example.myblog.designpatternDemo.flyweightpattern;

/**
 * @author : duo.tao
 * @description : 享元模式 用于减少创建对象的数量，以减少主要矛盾，增加hashMap用来存放
 *  * 在对象要创建之前先进行查找，查看是否已经进行创建，如果还没有创建，那就创建一个对象，并丢入redis，如果已经创建了，就将这个思路进行到底
 *
 * @date : 2021/4/22 22:49
 */

public class FlyweightPatternDemo {
    private static final String colors[] =
            { "Red", "Green", "Blue", "White", "Black" };

    public static void main(String[] args) {

        for(int i=0; i < 20; ++i) {
            Circle circle =
                    (Circle)ShapeFactory.getCircle(getRandomColor());
            circle.setX(getRandomX());
            circle.setY(getRandomY());
            circle.setRadius(100);
            circle.draw();
        }
    }
    private static String getRandomColor() {
        return colors[(int)(Math.random()*colors.length)];
    }
    private static int getRandomX() {
        return (int)(Math.random()*100 );
    }
    private static int getRandomY() {
        return (int)(Math.random()*100);
    }
}
