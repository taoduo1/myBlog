package com.example.myblog.common.config.securityconfig.filter;

import com.example.myblog.common.config.Constants;
import com.example.myblog.common.config.securityconfig.auth.AdminAuthenticationFailureHandler;
import com.example.myblog.common.config.securityconfig.auth.AdminAuthenticationSuccessHandler;
import com.example.myblog.common.config.securityconfig.auth.CusAuthenticationManager;
import com.example.myblog.common.exception.MyException;
import com.example.myblog.common.utils.DataUtil;
import com.example.myblog.common.utils.JsonUtil;
import com.example.myblog.common.utils.MultiReadHttpServletRequest;
import com.example.myblog.entity.User;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AbstractAuthenticationProcessingFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * <p> 自定义用户密码校验过滤器 </p>
 *
 * @author : zhengqing
 * @description :
 * @date : 2019/10/12 15:32
 */
@Slf4j
@Component
public class AdminAuthenticationProcessingFilter extends AbstractAuthenticationProcessingFilter {

    /**
     * @param authenticationManager:             认证管理器
     * @param adminAuthenticationSuccessHandler: 认证成功处理
     * @param adminAuthenticationFailureHandler: 认证失败处理
     */
    public AdminAuthenticationProcessingFilter(CusAuthenticationManager authenticationManager, AdminAuthenticationSuccessHandler adminAuthenticationSuccessHandler, AdminAuthenticationFailureHandler adminAuthenticationFailureHandler) {
        super(new AntPathRequestMatcher("/login", "POST"));
        this.setAuthenticationManager(authenticationManager);
        this.setAuthenticationSuccessHandler(adminAuthenticationSuccessHandler);
        this.setAuthenticationFailureHandler(adminAuthenticationFailureHandler);
    }

    @Override
    public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response) throws AuthenticationException {
        if (request.getContentType() == null || !request.getContentType().contains(Constants.REQUEST_HEADERS_CONTENT_TYPE)) {
            throw new AuthenticationServiceException("请求头类型不支持: " + request.getContentType());
        }

        UsernamePasswordAuthenticationToken authRequest;
        try {
            MultiReadHttpServletRequest wrappedRequest = new MultiReadHttpServletRequest(request);
            // 将前端传递的数据转换成jsonBean数据格式
            User user = JsonUtil.jsonToBean(wrappedRequest.getBodyJsonStrByJson(wrappedRequest), User.class);
            if (DataUtil.isNull(user)){
                throw new MyException("用户错误");
            }
            authRequest = new UsernamePasswordAuthenticationToken(user.getName(), user.getPassword(), null);
            authRequest.setDetails(authenticationDetailsSource.buildDetails(wrappedRequest));
        } catch (Exception e) {
            throw new AuthenticationServiceException(e.getMessage());
        }
        return this.getAuthenticationManager().authenticate(authRequest);
    }

}
