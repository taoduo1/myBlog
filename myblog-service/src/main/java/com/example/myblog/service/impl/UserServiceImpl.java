package com.example.myblog.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.example.myblog.common.redis.annotation.RedisCacheDelete;
import com.example.myblog.common.redis.annotation.RedisCacheGet;
import com.example.myblog.common.redis.annotation.RedisCachePut;
import com.example.myblog.common.utils.MBeanUtils;
import com.example.myblog.entity.User;
import com.example.myblog.mapper.UserMapper;
import com.example.myblog.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * <p>
 * 用户表 服务实现类
 * </p>
 *
 * @author duo.tao
 * @since 2021-05-05
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {
    @Resource
    private UserMapper dao;

    private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
    private final static String REDIS_TOKEN_KEY = "token";
    private final static String REDIS_OUT_TOKEN_KEY = "outToken";


    @Override
    public void loginOut(String token) {
        //删除token
        UserService bean = MBeanUtils.getBean(UserService.class);
        bean.cleanCache(token);
    }

    @RedisCachePut(key = REDIS_TOKEN_KEY, minutes = 2 * 60)
    @Override
    public void setUserContext(String token, User userContext) {
        // 由AOP实现
    }

    @RedisCacheGet(key = REDIS_TOKEN_KEY, minutes = 2 * 60)
    @Override
    public User getUserContext(String token) {
        logger.info("token无效");
        return null;
    }

    @RedisCacheDelete(key = REDIS_TOKEN_KEY)
    @Override
    public void cleanCache(String token) {
        // 由AOP实现
    }

    @RedisCachePut(key = REDIS_OUT_TOKEN_KEY, minutes = 2 * 60)
    @Override
    public void setUserToken(String token, String tokenStr) {
        // 由AOP实现
    }

    @RedisCacheGet(key = REDIS_OUT_TOKEN_KEY, minutes = 2 * 60)
    @Override
    public User getUserToken(String token) {
        logger.info("token无效");
        return null;
    }

    @RedisCacheDelete(key = REDIS_OUT_TOKEN_KEY)
    @Override
    public void cleanCacheUserToken(String token) {
        // 由AOP实现
    }

}
