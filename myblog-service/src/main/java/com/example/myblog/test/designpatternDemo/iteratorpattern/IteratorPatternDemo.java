package com.example.myblog.test.designpatternDemo.iteratorpattern;

/**
 * @author : duo.tao
 * @description :迭代器模式  集合迭代器的应用
 * @date : 2021/4/27 23:19
 */

public class IteratorPatternDemo {

    public static void main(String[] args) {
        NameRepository namesRepository = new NameRepository();

        for(Iterator iter = namesRepository.getIterator(); iter.hasNext();){
            String name = (String)iter.next();
            System.out.println("Name : " + name);
        }
    }
}
