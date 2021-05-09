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
     * @return
     */
    boolean enableMap() default false;

    /**
     * 是否自动将tenantId作为key的一部分。
     * <pre>
     * 默认false，表示不会将tenantId放入key。
     * true时，则会将tenantId作为key的一部分。
     * </pre>.
     *
     * @return true, if successful
     */
    boolean autoIncludeTenantId() default false;

}
