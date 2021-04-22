package com.example.myblog.test.adapterpattern;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/21 22:25
 */

public class VlcPlayer implements AdvancedMediaPlayer{
    @Override
    public void playVlc(String fileName) {
        System.out.println("Playing vlc file. Name: "+ fileName);
    }

    @Override
    public void playMp4(String fileName) {
        //什么也不做
    }
}