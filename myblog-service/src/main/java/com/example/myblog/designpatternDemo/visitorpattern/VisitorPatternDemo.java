package com.example.myblog.designpatternDemo.visitorpattern;

/**
 * @author : duo.tao
 * @description : 访问者模式  定义一个访问者类，来封装新的操作，不需要改变原有数据结构，通过暴露方法来访问数据元素
 * @date : 2021/4/26 23:48
 */

public class VisitorPatternDemo {
    public static void main(String[] args) {

        ComputerPart computer = new Computer();
        computer.accept(new ComputerPartDisplayVisitor());
    }
}
