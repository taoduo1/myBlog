package com.example.myblog.test.singletonpattern;

/**
 * @author : duo.tao
 * @description : 单例模式
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
