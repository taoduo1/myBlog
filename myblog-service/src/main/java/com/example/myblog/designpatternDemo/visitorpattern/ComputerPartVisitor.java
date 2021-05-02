package com.example.myblog.designpatternDemo.visitorpattern;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/26 23:48
 */

public interface ComputerPartVisitor {
    public void visit(Computer computer);
    public void visit(Mouse mouse);
    public void visit(Keyboard keyboard);
    public void visit(Monitor monitor);
}