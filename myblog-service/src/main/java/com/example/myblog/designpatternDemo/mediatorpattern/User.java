package com.example.myblog.designpatternDemo.mediatorpattern;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/26 23:31
 */

public class User {
    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public User(String name){
        this.name  = name;
    }

    public void sendMessage(String message){
        ChatRoom.showMessage(this,message);
    }
}
