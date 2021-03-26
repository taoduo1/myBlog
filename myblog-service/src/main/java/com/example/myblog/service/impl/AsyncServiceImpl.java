package com.example.myblog.service.impl;

import com.example.myblog.service.AsyncService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service
public class AsyncServiceImpl implements AsyncService {

    private static final Logger logger = LoggerFactory.getLogger(AsyncServiceImpl.class);

    @Override
    public void executeAsync() {
        logger.info("start executeAsync");

        System.out.println("异步线程要做的事情");
        System.out.println("可以在这里执行批量插入等耗时的事情");

        logger.info("end executeAsync");
    }
}
