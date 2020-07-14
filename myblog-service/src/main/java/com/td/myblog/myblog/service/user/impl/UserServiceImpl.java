package com.td.myblog.myblog.service.user.impl;

import com.td.myblog.myblog.dao.UserMapper;
import com.td.myblog.myblog.entity.User;
import com.td.myblog.myblog.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/*
 *
 * @Company 太美医疗科技
 * @Description:
 * @Author duo.tao
 * @Date 18/07/2019 17:26
 */
@Service
public class UserServiceImpl implements UserService {


    @Autowired
    private UserMapper userMapper;


    @Override
    public User selectUserByName(String name) {
        return userMapper.findUserByName(name);
    }

    @Override
    public List<User> selectAllUser() {
        return userMapper.findAllUser();
    }

    @Override
    public void deleteService(int id) {
        userMapper.deleteUser(id);
    }

    @Override
    public List<User> findByAge(int age) {
        return userMapper.selectByAge(age);
    }
}
