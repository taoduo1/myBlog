package com.td.myblog.myblog.common.enums.interfaces;

import java.util.Optional;

/**
 * 枚举 接口
 */
public interface EnumCode {

    String getCode();

    /**
     * 当前枚举项的值（code）是否匹配传入参数。
     * @param value
     * @return
     */
    default boolean match(String value) {
        return Optional.ofNullable(value).map(v -> getCode().equals(v)).orElse(false);
    }

    /**
     * 当前枚举项的值（code）是否匹配传入参数。
     * @param value
     * @return
     */
    default boolean notMatch(String value) {
        return !match(value);
    }
}
