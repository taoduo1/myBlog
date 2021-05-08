package com.example.myblog.common.config.securityconfig.auth;


import com.example.myblog.common.resultdto.ApiResult;
import com.example.myblog.common.utils.ResponseUtils;
import com.example.myblog.entity.User;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *  <p> 认证成功处理 </p>
 *
 * @description :
 * @author : zhengqing
 * @date : 2019/10/12 15:31
 */
@Component
public class AdminAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    @Override
    public void onAuthenticationSuccess(HttpServletRequest httpServletRequest, HttpServletResponse response, Authentication auth) throws IOException, ServletException {
        User user = new User();
        //SecurityUser securityUser = ((SecurityUser) auth.getPrincipal());
        /*user.setToken(securityUser.getCurrentUserInfo().getToken());*/ // TODO: 2021/5/8  此处写入token转为写入redis
        ResponseUtils.out(response, ApiResult.ok("登录成功!", user));
    }

}
