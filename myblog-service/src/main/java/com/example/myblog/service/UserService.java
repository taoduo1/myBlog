package com.example.myblog.service;

import com.baomidou.mybatisplus.service.IService;
import com.example.myblog.entity.User;

/**
 * <p>
 * 用户表 服务类
 * </p>
 *
 * @author duo.tao
 * @since 2021-05-05
 */
public interface UserService extends IService<User> {


    void loginOut(String token);

    void setUserContext(String token, User userContext);

    User getUserContext(String token) ;

    void cleanCache(String token);


    void setUserToken(String token, String tokenStr);

    User getUserToken(String token) ;

    void cleanCacheUserToken(String token);



}
