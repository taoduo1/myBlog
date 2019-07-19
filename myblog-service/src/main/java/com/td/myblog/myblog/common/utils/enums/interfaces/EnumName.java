package com.td.myblog.myblog.common.utils.enums.interfaces;

import java.util.Optional;

/**
 * 枚举 接口
 *
 * @author TIM(JT)
 * @date 2017-05-22 18
 **/
public interface EnumName {

    String getName();

    /**
    * 当前枚举项的值（name）是否匹配传入参数。
    * @param name
    * @return
    */
    default boolean matchName(String name) {
        return Optional.ofNullable(name).map(v -> getName().equals(v)).orElse(false);
    }
}
