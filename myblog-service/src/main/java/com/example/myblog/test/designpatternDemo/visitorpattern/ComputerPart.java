package com.example.myblog.test.designpatternDemo.visitorpattern;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/26 23:47
 */

public interface ComputerPart {
    public void accept(ComputerPartVisitor computerPartVisitor);
}
