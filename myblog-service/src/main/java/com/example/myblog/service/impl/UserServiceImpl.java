package com.example.myblog.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.myblog.entity.User;
import com.example.myblog.mapper.UserMapper;
import com.example.myblog.service.UserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author duo.tao
 * @since 2021-03-22
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

    @Resource
    private UserMapper userMapper;

    @Override
    public List<User> finByNameAndPsd(String name, String password) {
        Map<String,Object> map = new HashMap<>();
        map.put("name",name);
        map.put("password",password);
        return userMapper.selectByMap(map);
    }

    public IPage<User> finPageByNameAndPsd(String name, String password) {
        Map<String,Object> map = new HashMap<>();
        map.put("name",name);
        map.put("password",password);
        QueryWrapper<User> wrapper = new QueryWrapper();
        wrapper.eq("name", name).eq("password", password);

        Page<User> page = new Page<>(1,2);

        IPage<User> userIPage = userMapper.selectPage(page, wrapper);

        IPage<Map<String, Object>> mapIPage = userMapper.selectMapsPage(page, wrapper);
        return userIPage;
    }


}
