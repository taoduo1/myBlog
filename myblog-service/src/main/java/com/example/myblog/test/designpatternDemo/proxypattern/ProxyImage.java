package com.example.myblog.test.designpatternDemo.proxypattern;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/22 23:00
 */

public class ProxyImage implements Image{

    private RealImage realImage;
    private String fileName;

    public ProxyImage(String fileName){
        this.fileName = fileName;
    }

    @Override
    public void display() {
        if(realImage == null){
            realImage = new RealImage(fileName);
        }
        realImage.display();
    }
}