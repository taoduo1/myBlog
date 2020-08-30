package com.td.myblog.myblog.common.config.redis.annotation;

import java.lang.annotation.*;

/**
 * 缓存注解。.
 *
 * @author
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
