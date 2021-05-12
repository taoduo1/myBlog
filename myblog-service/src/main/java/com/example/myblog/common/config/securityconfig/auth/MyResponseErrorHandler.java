package com.example.myblog.common.config.securityconfig.auth;

import org.springframework.http.client.ClientHttpResponse;
import org.springframework.web.client.ResponseErrorHandler;

import java.io.IOException;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/5/10 23:05
 */

public class MyResponseErrorHandler implements ResponseErrorHandler  {

    @Override
    public boolean hasError(ClientHttpResponse response) throws IOException {
        // 这里返回false
        return false;
    }

    @Override
    public void handleError(ClientHttpResponse response) throws IOException {

    }

}