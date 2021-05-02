package com.example.myblog.designpatternDemo.visitorpattern;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/26 23:47
 */

public class Computer  implements ComputerPart {

    ComputerPart[] parts;

    public Computer(){
        parts = new ComputerPart[] {new Mouse(), new Keyboard(), new Monitor()};
    }


    @Override
    public void accept(ComputerPartVisitor computerPartVisitor) {
        for (int i = 0; i < parts.length; i++) {
            parts[i].accept(computerPartVisitor);
        }
        computerPartVisitor.visit(this);
    }
}
