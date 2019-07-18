package com.td.myblog.myblog.api;

/*
 *
 * @Company 无
 * @Description:
 * @Author duo.tao
 * @Date 18/07/2019 17:23
 */

import com.td.myblog.myblog.entity.User;
import com.td.myblog.myblog.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/user")
public class UserController {


    @Autowired
    private UserService userService;


    @RequestMapping("/query")
    public User testQuery() {
        return userService.selectUserByName("1");
    }

}
