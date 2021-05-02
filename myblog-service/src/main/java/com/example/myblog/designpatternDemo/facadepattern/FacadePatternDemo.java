package com.example.myblog.designpatternDemo.facadepattern;

/**
 * @author : duo.tao
 * @description : 外观模式 就是把本来要调一堆接口的，整合成一个接口供外部调用，用来隐藏系统的复杂性
 * @date : 2021/4/22 22:41
 */

public class FacadePatternDemo {
    public static void main(String[] args) {
        ShapeMaker shapeMaker = new ShapeMaker();

        shapeMaker.drawCircle();
        shapeMaker.drawRectangle();
        shapeMaker.drawSquare();
    }
}
