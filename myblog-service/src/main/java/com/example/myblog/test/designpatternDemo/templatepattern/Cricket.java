package com.example.myblog.test.designpatternDemo.templatepattern;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/25 22:38
 */

public class Cricket extends Game {

    @Override
    void endPlay() {
        System.out.println("Cricket Game Finished!");
    }

    @Override
    void initialize() {
        System.out.println("Cricket Game Initialized! Start playing.");
    }

    @Override
    void startPlay() {
        System.out.println("Cricket Game Started. Enjoy the game!");
    }
}
