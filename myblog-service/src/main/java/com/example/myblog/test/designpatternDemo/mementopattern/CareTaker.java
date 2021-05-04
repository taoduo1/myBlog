package com.example.myblog.test.designpatternDemo.mementopattern;

import java.util.ArrayList;
import java.util.List;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/26 23:23
 */

public class CareTaker {
    private List<Memento> mementoList = new ArrayList<Memento>();

    public void add(Memento state){
        mementoList.add(state);
    }

    public Memento get(int index){
        return mementoList.get(index);
    }
}
