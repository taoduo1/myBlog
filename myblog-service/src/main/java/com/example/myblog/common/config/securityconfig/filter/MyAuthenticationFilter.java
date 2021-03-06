package com.example.myblog.common.config.securityconfig.filter;


import com.example.myblog.common.config.Constants;
import com.example.myblog.common.config.securityconfig.dto.SecurityUser;
import com.example.myblog.common.config.securityconfig.user.UserDetailsServiceImpl;
import com.example.myblog.common.exception.MyException;
import com.example.myblog.common.utils.DateUtil;
import com.example.myblog.common.utils.MultiReadHttpServletRequest;
import com.example.myblog.common.utils.MultiReadHttpServletResponse;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

/**
 * 访问鉴权 - 每次访问接口都会经过此
 */
@Slf4j
@Component
public class MyAuthenticationFilter extends OncePerRequestFilter {

    private final UserDetailsServiceImpl userDetailsService;

    protected MyAuthenticationFilter(UserDetailsServiceImpl userDetailsService) {
        this.userDetailsService = userDetailsService;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        if ((request.getContentType() == null && request.getContentLength() > 0) || (request.getContentType() != null && !request.getContentType().contains(Constants.REQUEST_HEADERS_CONTENT_TYPE))) {
            filterChain.doFilter(request, response);
            return;
        }

        MultiReadHttpServletRequest wrappedRequest = new MultiReadHttpServletRequest(request);
        MultiReadHttpServletResponse wrappedResponse = new MultiReadHttpServletResponse(response);
        StopWatch stopWatch = new StopWatch();
        try {
            stopWatch.start();
            // 记录请求的消息体
            logRequestBody(wrappedRequest);

            // 前后端分离情况下，前端登录后将token储存在cookie中，每次访问接口时通过token去拿用户权限
            String jwtToken = wrappedRequest.getHeader(Constants.REQUEST_HEADER);
            log.debug("后台检查令牌:{}", jwtToken);
            if (StringUtils.isNotBlank(jwtToken)) {
                // 检查token
                // JWT相关start ===========================================
                // 获取jwt中的信息
                Claims claims = Jwts.parser().setSigningKey(Constants.SALT).parseClaimsJws(jwtToken.replace("Bearer", "")).getBody();
                // 获取当前登录用户名
                System.out.println("获取当前登录用户名: " + DateUtil.format(claims.getExpiration(),DateUtil.YYYY_MM_DD_HH_MM_SS));
                // TODO 如需使用jwt特性在此做处理~ 增加续期作用  续期就是删除原来的并重新申请新的，这里拿的到时间，在时间还有10分钟时进操作
                // JWT相关end ===========================================

                SecurityUser securityUser = userDetailsService.getUserByToken(jwtToken);
                if (securityUser == null || securityUser.getCurrentUserInfo() == null) {
                    throw new MyException("TOKEN已过期，请重新登录！");
                }
                UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(securityUser, null, securityUser.getAuthorities());
                // 全局注入角色权限信息和登录用户基本信息
                SecurityContextHolder.getContext().setAuthentication(authentication);
            }
            filterChain.doFilter(wrappedRequest, wrappedResponse);
        }finally {
            stopWatch.stop();
            long usedTimes = stopWatch.getTotalTimeMillis();
            // 记录响应的消息体
            logResponseBody(wrappedRequest, wrappedResponse, usedTimes);
        }

    }

    private void logRequestBody(MultiReadHttpServletRequest request) {
        if (request != null) {
            try {
                String bodyJson = request.getBodyJsonStrByJson(request);
                String url = request.getRequestURI().replace("//", "/");
                System.out.println("-------------------------------- 请求url: " + url + " --------------------------------");
                Constants.URL_MAPPING_MAP.put(url, url);
                log.info("`{}` 接收到的参数: {}",url , bodyJson);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    private void logResponseBody(MultiReadHttpServletRequest request, MultiReadHttpServletResponse response, long useTime) {
        if (response != null) {
            byte[] buf = response.getBody();
            if (buf.length > 0) {
                String payload;
                try {
                    payload = new String(buf, 0, buf.length, response.getCharacterEncoding());
                } catch (UnsupportedEncodingException ex) {
                    payload = "[unknown]";
                }
                log.info("`{}`  耗时:{}ms  返回的参数: {}", Constants.URL_MAPPING_MAP.get(request.getRequestURI()), useTime, payload);
            }
        }
    }

}
