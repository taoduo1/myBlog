package com.example.myblog.common.config.securityconfig.auth;


import com.example.myblog.common.config.Constants;
import com.example.myblog.common.config.securityconfig.dto.SecurityUser;
import com.example.myblog.common.config.securityconfig.user.UserDetailsServiceImpl;
import com.example.myblog.common.utils.PasswordUtils;
import com.example.myblog.entity.User;
import com.example.myblog.service.UserService;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.Date;


/**
 * 用户账号密码认证类，获取数据库数据，认证成功后写入redis
 */
@Component
public class AdminAuthenticationProvider implements AuthenticationProvider {

    @Resource
    UserDetailsServiceImpl userDetailService;
    @Resource
    private UserService userService;

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        // 获取前端表单中输入后返回的用户名、密码
        String userName = (String) authentication.getPrincipal();
        String password = (String) authentication.getCredentials();

        SecurityUser userInfo = (SecurityUser) userDetailService.loadUserByUsername(userName);

        boolean isValid = PasswordUtils.isValidPassword(password, userInfo.getPassword(), "duo.tao");//密码认证
        // 验证密码
        if (!isValid) {
            throw new BadCredentialsException("密码错误！");
        }

        String roleCodes = userInfo.getRoleCodes();
        // 生成jwt访问令牌
        String jwt = Jwts.builder()
                // 用户角色
                .claim(Constants.ROLE_LOGIN, roleCodes)
                // 主题 - 存用户名
                .setSubject(authentication.getName())
                // 过期时间 - 30分钟
                .setExpiration(new Date(System.currentTimeMillis() + 120 * 60 * 1000))
                // 加密算法和密钥
                .signWith(SignatureAlgorithm.HS512, Constants.SALT)
                .compact();

        // 前后端分离情况下 处理逻辑...
        // 在此处写入前端返回
        User user = userDetailService.findById(userInfo.getCurrentUserInfo().getId());
        userService.setUserContext(jwt,user);
        return new UsernamePasswordAuthenticationToken(userInfo, jwt, userInfo.getAuthorities());
    }

    @Override
    public boolean supports(Class<?> aClass) {
        return true;
    }
}
