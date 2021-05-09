package com.example.myblog.common.redis.annotation;

import java.lang.annotation.*;

/**
 * 缓存注解。.
 *
 * @author heng.yao
 */
@Documented
@Inherited
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface RedisCacheDelete {

    /**
     * Key.
     *
     * @return the string
     */
    String key();


}
