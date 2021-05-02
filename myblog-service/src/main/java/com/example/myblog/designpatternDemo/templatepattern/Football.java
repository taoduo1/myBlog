package com.example.myblog.designpatternDemo.templatepattern;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/25 22:38
 */

public class Football extends Game {

    @Override
    void endPlay() {
        System.out.println("Football Game Finished!");
    }

    @Override
    void initialize() {
        System.out.println("Football Game Initialized! Start playing.");
    }

    @Override
    void startPlay() {
        System.out.println("Football Game Started. Enjoy the game!");
    }
}