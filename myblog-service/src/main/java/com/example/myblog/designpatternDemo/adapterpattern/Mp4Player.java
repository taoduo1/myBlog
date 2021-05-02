package com.example.myblog.designpatternDemo.adapterpattern;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/21 22:26
 */

public class Mp4Player implements AdvancedMediaPlayer{

    @Override
    public void playVlc(String fileName) {
        //什么也不做
    }

    @Override
    public void playMp4(String fileName) {
        System.out.println("Playing mp4 file. Name: "+ fileName);
    }
}