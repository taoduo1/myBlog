package com.example.myblog.common.config.securityconfig.auth;


import com.example.myblog.common.resultdto.ApiResult;
import com.example.myblog.common.utils.ResponseUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * 认证权限入口 - 未登录的情况下访问所有接口都会拦截到此
 * 前后端分离情况下返回json格式数据
 */
@Slf4j
@Component
public class AdminAuthenticationEntryPoint implements AuthenticationEntryPoint {

    @Override
    public void commence(HttpServletRequest request, HttpServletResponse response, AuthenticationException e) {
        log.error(e.getMessage());
        ResponseUtils.out(response, ApiResult.fail("未登录！！！"));
    }

}
