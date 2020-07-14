package com.td.myblog.myblog.common.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;


public class ApplicationContextUtil {

    private static final Logger LOGGER = LoggerFactory.getLogger(ApplicationContextUtil.class);
    private static ApplicationContext applicationContext;
    private static boolean dbPatchDone = false;

    private ApplicationContextUtil() {
    }

    public static ApplicationContext getApplicationContext() {
        return applicationContext;
    }

    public static void setApplicationContext(ApplicationContext applicationContext) {
        LOGGER.info("设置applicationContext:{}", applicationContext);
        ApplicationContextUtil.applicationContext = applicationContext;
    }

    /**
     * 简化的获取bean方法
     *
     * @param <T>
     * @param requiredType
     * @return
     */
    public static <T> T getBean(Class<T> requiredType) {
        return applicationContext.getBean(requiredType);
    }

    public static boolean isDbPatchDone() {
        return dbPatchDone;
    }

    public static void setDbPatchDone(boolean bln) {
        dbPatchDone = bln;
    }

}
