package com.td.myblog.myblog.common.utils;

import java.util.Map;
import java.util.Objects;
import java.util.concurrent.ConcurrentHashMap;
import java.util.function.Function;
import java.util.function.Predicate;


public class LambdaUtils {

    private LambdaUtils() {
    }

    /**
     * 根据对象属性对集合元素去重
     * <p>
     * 用法: list.stream().filter(distinctByKey(e -> e.getName()));
     * </p>
     *
     * @param keyExtractor
     * @param <T>
     * @return
     */
    public static <T> Predicate<T> distinctByKey(Function<? super T, ?> keyExtractor) {
        Map<Object, Boolean> seen = new ConcurrentHashMap<>();
        return t -> Objects.isNull(seen.putIfAbsent(keyExtractor.apply(t), Boolean.TRUE));
    }
}
