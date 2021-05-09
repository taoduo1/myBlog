package com.example.myblog.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.example.myblog.common.redis.annotation.RedisCacheDelete;
import com.example.myblog.common.redis.annotation.RedisCacheGet;
import com.example.myblog.common.redis.annotation.RedisCachePut;
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
    private final static String REDIS_KEY = "token";


    @RedisCachePut(key = REDIS_KEY, minutes = 2 * 60)
    @Override
    public void setUserContext(String sessionId, User userContext) {
        // 由AOP实现
    }

    @RedisCacheGet(key = REDIS_KEY, minutes = 2 * 60)
    @Override
    public User getUserContext(String sessionId) {
        logger.info("token无效");
        return null;
    }

    @RedisCacheDelete(key = REDIS_KEY)
    @Override
    public void cleanCache(String sessionId) {
        // 由AOP实现
    }

}
