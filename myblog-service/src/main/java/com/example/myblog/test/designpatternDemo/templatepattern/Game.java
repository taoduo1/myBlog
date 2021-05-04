package com.example.myblog.test.designpatternDemo.templatepattern;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/25 22:38
 */

public abstract class Game {
    abstract void initialize();
    abstract void startPlay();
    abstract void endPlay();

    //模板
    public final void play(){

        //初始化游戏
        initialize();

        //开始游戏
        startPlay();

        //结束游戏
        endPlay();
    }
}