package com.example.myblog.test.abstractfactory;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/20 22:00
 */

public class FactoryProducer {
    public static AbstractFactory getFactory(String choice){
        if(choice.equalsIgnoreCase("SHAPE")){
            return new ShapeFactory();
        } else if(choice.equalsIgnoreCase("COLOR")){
            return new ColorFactory();
        }
        return null;
    }
}
