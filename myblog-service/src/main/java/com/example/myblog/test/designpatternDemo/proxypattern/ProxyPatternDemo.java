package com.example.myblog.test.designpatternDemo.proxypattern;

/**
 * @author : duo.tao
 * @description : 代理模式 如果系统中存在不能直接访问对象的时候，比如不能访问 RealImage 这个对象，就需要代理模式进行访问
 * 创建一个ProxyImage 对象，来代替实现功能。
 * 访问真正的对象的时候其实是用子对象来进行访问，而不是直接进行访问
 * @date : 2021/4/22 23:01
 */

public class ProxyPatternDemo {

    public static void main(String[] args) {
        Image image = new ProxyImage("test_10mb.jpg");

        // 图像将从磁盘加载
        image.display();
        System.out.println("");
        // 图像不需要从磁盘加载
        image.display();
    }
}
