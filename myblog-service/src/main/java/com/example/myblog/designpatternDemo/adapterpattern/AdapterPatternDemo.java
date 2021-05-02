package com.example.myblog.designpatternDemo.adapterpattern;

/**
 * @author : duo.tao
 * @description : 适配器模式 想调用一个类中的接口，这个接口没有的时候，可以通过适配器，继承有这个接口的类，然后再重写类的方法，让类也支持某个方法
 *  我要调用mp3方法，但是这个类没有mp3方法，mp3方法在另一个类中，我可以写一个子类，继承父类，然后在子类中重写父类方法，判断如果是mp3的话，调用另外一个类的方法
 * @date : 2021/4/21 22:26
 */

public class AdapterPatternDemo {
    public static void main(String[] args) {
        AudioPlayer audioPlayer = new AudioPlayer();

        audioPlayer.play("mp3", "beyond the horizon.mp3");
        audioPlayer.play("mp4", "alone.mp4");
        audioPlayer.play("vlc", "far far away.vlc");
        audioPlayer.play("avi", "mind me.avi");
    }
}
