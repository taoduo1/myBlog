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
public @interface RedisCachePut {

    /**
     * Key.
     *
     * @return the string
     */
    String key();

    /**
     * Minutes.
     *
     * @return the int
     */
    int minutes() default 8 * 60;

    /**
     * enable HashOperations
     *
     * @return
     */
    boolean enableMap() default false;

}
