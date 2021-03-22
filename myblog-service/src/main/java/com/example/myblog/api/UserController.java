package com.example.myblog.api;

import com.example.myblog.entity.User;
import com.example.myblog.service.UserService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
@RequestMapping("/users")
public class UserController {

    @Resource
    private UserService service;


    @GetMapping("/{id}")
    public User getUserInfo(@PathVariable("id") Integer userId) {
        return service.getUserById(userId);
    }
}
