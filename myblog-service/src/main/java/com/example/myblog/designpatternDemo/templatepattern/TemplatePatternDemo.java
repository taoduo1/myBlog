package com.example.myblog.designpatternDemo.templatepattern;

/**
 * @author : duo.tao
 * @description : 模板模式  父类控制流程，子类具体实现
 * 父类 规定流程 ：初始化游戏，开始游戏，结束游戏
 * 子类 实现父类的方法描述具体的动作：初始化干啥，开始游戏干啥，结束游戏干啥
 * @date : 2021/4/25 22:39
 */

public class TemplatePatternDemo {
    public static void main(String[] args) {

        Game game = new Cricket();
        game.play();
        System.out.println();
        game = new Football();
        game.play();
    }
}
