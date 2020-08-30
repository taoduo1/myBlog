package com.td.myblog.myblog.common.config.redis.annotation;

import java.lang.annotation.*;

@Documented
@Inherited
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface RedisCacheGet {

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
    int minutes() default 30;

    /**
     * enable HashOperations
     *
     * @return
     */
    boolean enableMap() default false;

}
