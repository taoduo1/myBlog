package com.example.myblog.common.config.securityconfig.auth;


import com.example.myblog.common.config.securityconfig.dto.SecurityUser;
import com.example.myblog.common.config.securityconfig.user.UserDetailsServiceImpl;
import com.example.myblog.common.utils.PasswordUtils;
import com.example.myblog.entity.User;
import com.example.myblog.mapper.UserMapper;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;


@Component
public class AdminAuthenticationProvider implements AuthenticationProvider {

    @Resource
    UserDetailsServiceImpl userDetailsService;
    @Resource
    private UserMapper userMapper;

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        // 获取前端表单中输入后返回的用户名、密码
        String userName = (String) authentication.getPrincipal();
        String password = (String) authentication.getCredentials();

        SecurityUser userInfo = (SecurityUser) userDetailsService.loadUserByUsername(userName);

        boolean isValid = PasswordUtils.isValidPassword(password, userInfo.getPassword(), "duo.tao");//密码认证
        // 验证密码
        if (!isValid) {
            throw new BadCredentialsException("密码错误！");
        }

        // 前后端分离情况下 处理逻辑...
        // 更新登录令牌 - 之后访问系统其它接口直接通过token认证用户权限...
        String token = PasswordUtils.encodePassword(System.currentTimeMillis() + "duo.tao", "duo.tao");
        User user = userMapper.selectById(userInfo.getCurrentUserInfo().getId());
        /*user.setToken(token);*/ // TODO: 2021/5/8 token 写入redis
        userMapper.updateById(user);
        return new UsernamePasswordAuthenticationToken(userInfo, password, userInfo.getAuthorities());
    }

    @Override
    public boolean supports(Class<?> aClass) {
        return true;
    }
}
