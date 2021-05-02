package com.example.myblog.designpatternDemo.proxypattern;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/22 23:00
 */

public class RealImage implements Image {

    private String fileName;

    public RealImage(String fileName){
        this.fileName = fileName;
        loadFromDisk(fileName);
    }

    @Override
    public void display() {
        System.out.println("Displaying " + fileName);
    }

    private void loadFromDisk(String fileName){
        System.out.println("Loading " + fileName);
    }
}
