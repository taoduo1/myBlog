package com.td.myblog.myblog.common.config.security;

import com.td.myblog.myblog.common.utils.DataUtil;
import com.td.myblog.myblog.dao.RoleMapper;
import com.td.myblog.myblog.entity.Role;
import com.td.myblog.myblog.entity.User;
import com.td.myblog.myblog.service.user.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;

@Component
public class MyUserDetailsService implements UserDetailsService {

    private final Logger logger = LoggerFactory.getLogger(getClass());

    @Resource
    private UserService userService;
    @Resource
    private RoleMapper roleMapper;


    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        logger.info("用户的用户名: {}", username);
        // TODO 根据用户名，查找到对应的密码，与权限
        User user = userService.selectUserByName(username);
        if (DataUtil.notNull(user)) {
            //查找权限
            List<Role> roles = roleMapper.getRolesByUserId(user.getId());
            user.setAuthorities(roles);
        }
        return user;
    }
}
