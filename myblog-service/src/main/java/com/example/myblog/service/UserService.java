package com.example.myblog.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.example.myblog.entity.User;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;

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

    IPage<User> finPageByNameAndPsd(String name, String password);
}
