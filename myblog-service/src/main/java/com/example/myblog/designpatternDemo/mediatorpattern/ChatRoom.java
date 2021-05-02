package com.example.myblog.designpatternDemo.mediatorpattern;

import java.util.Date;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/26 23:31
 */

public class ChatRoom {
    public static void showMessage(User user, String message){
        System.out.println(new Date().toString()
                + " [" + user.getName() +"] : " + message);
    }
}
