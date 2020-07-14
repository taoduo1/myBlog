package com.td.myblog.myblog.common.utils.json.converter;

import com.fasterxml.jackson.databind.util.StdConverter;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 用户在JSON序列化和反序列化时，将对象转换为Long对象。
 * 一般传入对象为String。
 *
 * @param <T>
 * @author heng.yao
 */
public class ToLong<T> extends StdConverter<T, Long> {

    @Override
    public Long convert(T in) {
        if (in == null) return null;
        if (in instanceof Long) return (Long) in;
        if (in instanceof Integer) return Long.valueOf(((Integer) in));
        if (in instanceof Date) return Long.valueOf(((Date) in).getTime());
        if (in instanceof BigDecimal) return Long.valueOf(((BigDecimal) in).longValue());
        if (in instanceof String) return Long.valueOf((String) in);
        return Long.valueOf(String.valueOf(in));
    }

}
