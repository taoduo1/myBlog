package com.example.myblog.controller;


import com.example.myblog.entity.User;
import com.example.myblog.service.UserService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author duo.tao
 * @since 2021-03-22
 */
@RestController
@RequestMapping("/user")
public class UserController {

    @Resource
    private UserService service;


    @GetMapping("/{id}")
    public User getUserInfo(@PathVariable("id") Integer userId) {
        return service.getById(userId);
    }


    @GetMapping("/{name}/{password}")
    public List<User> getUserInfo(@PathVariable("name") String name, @PathVariable("password") String password) {
        return service.finByNameAndPsd(name,password);
    }

}
