package com.example.myblog.service.impl;

import com.example.myblog.dao.UserDao;
import com.example.myblog.entity.User;
import com.example.myblog.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserDao dao;

    @Override
    public User getUserById(Integer id) {
        return dao.getOne(id);
    }
}
