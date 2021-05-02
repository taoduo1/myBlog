package com.example.myblog.designpatternDemo.visitorpattern;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/26 23:47
 */

public class Keyboard implements ComputerPart {

    @Override
    public void accept(ComputerPartVisitor computerPartVisitor) {
        computerPartVisitor.visit(this);
    }
}