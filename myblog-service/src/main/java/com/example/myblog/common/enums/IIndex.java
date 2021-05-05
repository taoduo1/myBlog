package com.example.myblog.common.enums;

import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/5/5 10:09
 */

public interface IIndex extends IToMap {

    int getIndex();

    /**
     * 当前枚举项的值（value）是否匹配传入参数。
     * @param value value
     * @return boolean
     */
    default boolean match(Integer value) {
        if (Objects.isNull(value)) return false;
        return value == getIndex();
    }

    /**
     * 当前枚举项的值（value）是否匹配传入参数。
     * @param value value
     * @return boolean
     */
    default boolean notMatch(Integer value) {
        return !match(value);
    }

    @Override
    default Map<String, Object> toMap() {
        Map<String, Object> map = new HashMap<>();
        map.put("index", getIndex());
        map.put("value", getIndex()); // 统一key为：value，取bool值
        return map;
    }
}