package com.td.myblog.myblog.common.config.security;

import com.td.myblog.myblog.service.user.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

@Component
public class MyUserDetailsService implements UserDetailsService {

    private final Logger logger = LoggerFactory.getLogger(getClass());

    @Resource
    private UserService userService;


    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        logger.info("用户的用户名: {}", username);
        // TODO 根据用户名，查找到对应的密码，与权限
        com.td.myblog.myblog.entity.User myUser = userService.selectUserByName(username);
        // 封装用户信息，并返回。参数分别是：用户名，密码，用户权限
        User user = new User(username, myUser.getPassword(),
                AuthorityUtils.commaSeparatedStringToAuthorityList("admin"));
        return user;
    }
}
