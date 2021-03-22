package com.example.myblog.service;

import com.example.myblog.entity.User;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author duo.tao
 * @since 2021-03-22
 */
public interface UserService extends IService<User> {

    List<User> finByNameAndPsd(String name,String password);
}
