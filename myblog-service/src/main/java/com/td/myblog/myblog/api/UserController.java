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
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/user")
public class UserController {


    @Autowired
    private UserService userService;

    @ApiOperation(value = "获取用户", notes = "获取用户")
    @GetMapping(value = "/query")
    public User testQuery(@RequestParam("name") String name) {
        return userService.selectUserByName(name);
    }


    @ApiOperation(value = "获取用户", notes = "获取用户")
    @GetMapping(value = "/findByAge")
    public List<User> findByAge(@RequestParam Integer age) {
        return userService.findByAge(age);
    }

}
