package com.example.myblog.common.config.securityconfig.auth;


import com.example.myblog.common.resultdto.ApiResult;
import com.example.myblog.common.utils.ResponseUtils;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 认证成功处理
 */
@Component
public class AdminAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

   @Override
   public void onAuthenticationSuccess(HttpServletRequest httpServletRequest, HttpServletResponse response, Authentication auth) {
       ResponseUtils.out(response, ApiResult.ok("登录成功!", auth.getCredentials()));
   }

}
