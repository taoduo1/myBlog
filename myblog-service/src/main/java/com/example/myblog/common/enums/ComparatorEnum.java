package com.example.myblog.common.enums;

import java.util.function.BiPredicate;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/5/5 10:07
 */

public enum ComparatorEnum {

    //"小于"
    LT((a, b) -> {
        return a.compareTo(b) < 0;
    }),
    //"小于等于"
    LE((a, b) -> {
        return a.compareTo(b) <= 0;
    }),
    //"等于",
    EQ((a, b) -> {
        return a.compareTo(b) == 0;
    }),
    //"不等于",
    NOTEQ((a, b) -> {
        return a.compareTo(b) != 0;
    }),
    //"大于",
    GT((a, b) -> {
        return a.compareTo(b) > 0;
    }),
    //"大于等于"
    GE((a, b) -> {
        return a.compareTo(b) >= 0;
    }),
    ;

    private BiPredicate<Comparable<Object>, Comparable<Object>> predicate;

    <T> ComparatorEnum(BiPredicate<Comparable<Object>, Comparable<Object>> predicate) {
        this.predicate = predicate;
    }

    /**
     * Match.
     *
     * @param comparator the comparator
     * @return true, if successful
     */
    public boolean match(ComparatorEnum comparator) {
        if (this == NOTEQ
                && (comparator == NOTEQ || comparator == LT || comparator == GT)) {
            return true;
        } else if (this == LE
                && (comparator == EQ || comparator == LT)) {
            return true;
        } else if (this == GE
                && (comparator == EQ || comparator == GT)) {
            return true;
        }
        return this == comparator;
    }

    /**
     * Gets the.
     *
     * @param <T>    the generic type
     * @param source the source
     * @param target the target
     * @return the comparator enum
     */
    public static <T> ComparatorEnum get(Comparable<T> source, Comparable<T> target) {
        if (LT.test(source, target)) {
            return LT;
        } else if (EQ.test(source, target)) {
            return EQ;
        } else if (GT.test(source, target)) {
            return GT;
        }
        return NOTEQ;
    }

    /**
     * 比较大小.
     *
     * @param <T>    the generic type
     * @param source the source
     * @param target the target
     * @return true, if successful
     */
    @SuppressWarnings("unchecked")
    private <T> boolean test(Comparable<T> source, Comparable<T> target) {
        if (source == null || target == null) {
            if (this != NOTEQ) {
                return false;
            } else {
                return true;
            }
        }
        return predicate.test((Comparable<Object>) source, (Comparable<Object>) target);
    }
}