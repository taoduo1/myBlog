package com.td.myblog.myblog.common.enums.interfaces;

import java.util.Objects;

/**
 * 枚举 接口
 *
 * @author TIM(JT)
 * @date 2017-05-22 18
 **/
public interface EnumIndex {

    int getIndex();

    /**
     * 当前枚举项的值（value）是否匹配传入参数。
     * @param value
     * @return
     */
    default boolean match(Integer value) {
        if (Objects.isNull(value)) return false;
        return value.intValue() == getIndex();
    }

    /**
     * 当前枚举项的值（value）是否匹配传入参数。
     * @param value
     * @return
     */
    default boolean notMatch(Integer value) {
        return !match(value);
    }
}
