package com.example.myblog.test.designpatternDemo.singletonpattern;

/**
 * @author : duo.tao
 * @description : 单例模式
 *  单例模式就是不管调用几次这个类，只创建一个实例，后续使用，都只使用这一个实例
 *  懒汉式是等到调用到这个类的时候再去创建这个类，饿汉式是还没调用这个类，我就先创建出来这个类为了以后准备着
 *  线程安全的实现就是先判断这个类有没有创建过，如果创建过则返回，如果未创建过，就对这个类加锁，然后在去创建
 * @date : 2021/4/20 22:17
 */

public class Singleton {

    /**
     * 懒汉式，线程安全
    private static Singleton instance;
    private Singleton (){}
    public static synchronized Singleton getInstance() {
        if (instance == null) {
            instance = new Singleton();
        }
        return instance;
    }*/

    /**
     * 饿汉式，线程安全
    private static final Singleton instance = new Singleton();

    private Singleton() {
    }

    public static Singleton getInstance() {
        return instance;
    }*/

    /**
     * 双检锁/双重校验锁
    private volatile static Singleton singleton;

    private Singleton() {
    }

    public static Singleton getSingleton() {
        if (singleton == null) {
            synchronized (Singleton.class) {
                if (singleton == null) {
                    singleton = new Singleton();
                }
            }
        }
        return singleton;
    }*/
}
