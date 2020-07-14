package com.td.myblog.myblog.common.utils;

import org.apache.commons.lang3.ObjectUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.reflect.FieldUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;

import java.beans.BeanInfo;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.util.*;
import java.util.stream.Collectors;

import static java.util.stream.Collectors.toList;

public class DataUtil {

    private static final Logger LOGGER = LoggerFactory.getLogger(DateUtil.class);

    private DataUtil() {
    }

    // ------------------------------------------------------------------------

    public static boolean notNull(Object object) {
        return object != null;
    }

    public static boolean notNullOrEmpty(String string) {
        return !StringUtils.isEmpty(string);
    }

    public static boolean notNullOrEmpty(Collection<?> collection) {
        return collection != null && !collection.isEmpty();
    }
    // ------------------------------------------------------------------------

    public static boolean isNull(Object object) {
        return object == null;
    }

    public static boolean isNullOrEmpty(String string) {
        return StringUtils.isEmpty(string);
    }

    public static boolean isNullOrEmpty(Collection<?> collection) {
        return collection == null || collection.isEmpty();
    }

    public static String emptyToNull(String value) {
        return "".equals(value) ? null : value;
    }

    public static String toString(Object object) {
        if (object == null) {
            return null;
        } else if (object instanceof String) {
            return (String) object;
        } else if (object instanceof Date) {
            return DateUtil.getTimeInLongFormat((Date) object);
        } else if (object instanceof BigDecimal) { // BigDecimal情况下，对尾部的.00情况移除
            String string = String.valueOf(object);
            while (string.contains(".") && StringUtils.endsWith(string, "0"))
                string = StringUtils.removeEnd(string, "0");
            if (string.endsWith(".")) string = StringUtils.removeEnd(string, ".");
            return string;
        } else {
            return String.valueOf(object);
        }

    }

    /**
     * 返回第一个非空的对象
     *
     * @param values
     * @return
     */
    public static final Object firstNotNull(Object... values) {
        return ObjectUtils.firstNonNull(values);
    }

    /**
     * 返回第一个非空（及非""）的字符串。
     * 没有匹配的情况下，返回最后一个。
     *
     * @param strings
     * @return
     */
    public static final String firstNotNullOrBlank(String... strings) {
        if (strings == null) return null;
        if (strings.length == 0) return null;
        return Arrays.stream(strings).filter(DataUtil::notNullOrEmpty).findFirst().orElse(strings[strings.length - 1]);
    }

    /**
     * 转换为Long对象。
     *
     * @param object
     * @return
     */
    public static Long toLong(Object object) {
        if (Objects.isNull(object)) return null;
        if (object instanceof Long) return (Long) object;
        if (object instanceof Integer) return Long.valueOf((Integer) object);
        if (object instanceof String) return Long.parseLong((String) object);
        return Long.parseLong(String.valueOf(object));
    }

    /**
     * 转换为Integer对象。
     *
     * @param object
     * @return
     */
    public static Integer toInteger(Object object) {
        if (Objects.isNull(object)) return null;
        if (object instanceof Integer) return (Integer) object;
        if (object instanceof Long) return ((Long) object).intValue();
        if (object instanceof String) return Integer.parseInt((String) object);
        return Integer.parseInt(String.valueOf(object));
    }

    // ------------------------------------------------------------------------

    /**
     * 对mapper.clone(s, t)进行一次封装。
     *
     * @param s 原来
     * @param t 目标
     * @return 返回目标
     */
    public static <S, T> T cloneBean(S s, T t) {
        if (s != null && t != null) BeanUtils.copyProperties(s, t); //
        return t;
    }

    public static <S> S cloneBean(S s) {
        if (s == null) return null;
        @SuppressWarnings("unchecked")
        S result = (S) cloneBean(s, s.getClass());
        return result;
    }

    public static <S, T> T cloneBean(S s, Class<T> clazzT) {
        if (s == null) return null;
        //
        try {
            T t = clazzT.newInstance();
            cloneBean(s, t);
            return t;
        } catch (InstantiationException | IllegalAccessException e) {
            LOGGER.error("", e);
            return null;
        }
    }

    public static <S, T> T cloneBeanWithNonNullFields(S s, T t) {
        if (t == null) return t;
        if (s == null) return t;
        Set<Field> fields = getNonNullFields(s);
        if (isNullOrEmpty(fields)) return t;
        //
        fields.stream().map(Field::getName).forEach(name -> {
            try {
                Object value = FieldUtils.readField(s, name, true);
                FieldUtils.writeField(t, name, value, true);
            } catch (IllegalAccessException e) {
                LOGGER.error("", e);
            }
        });
        return t;
    }

    /**
     * 获取对象的属性Field（仅值非空的）
     *
     * @param object
     * @return
     */
    public static final Set<Field> getNonNullFields(Object object) {
        List<Field> fields = FieldUtils.getAllFieldsList(object.getClass());
        return getNonNullFields(object, fields);
    }

    /**
     * 获取对象的属性Field（仅值非空的）
     *
     * @param object
     * @return
     */
    public static final Set<Field> getNonNullFields(Object object, List<Field> fields) {
        return fields.stream().filter(field -> {
            boolean isNonNull = false;
            try {
                isNonNull = Objects.nonNull(FieldUtils.readField(field, object, true));
            } catch (IllegalAccessException e) {
                LOGGER.error(e.getMessage(), e);
            }
            return isNonNull;
        }).collect(Collectors.toSet());
    }

    // ------------------------------------------------------------------------

    /**
     * 相等
     * 前提：都不为null或""
     * 通过转为String进行判断的。
     *
     * @param a
     * @param b
     * @return
     */
    public static <T extends Comparable<T>> boolean equalsByStringNotNullOrEmpty(Object a, Object b) {
        if (isNull(a) || isNull(b)) return false;
        if (a instanceof String && isNullOrEmpty((String) a) || b instanceof String && isNullOrEmpty((String) b))
            return false;
        return Optional.ofNullable(toString(a)).map(e -> e.equals(toString(b))).orElse(false);
    }

    /**
     * 相等
     * 前提：都不为null或""
     *
     * @param a
     * @param b
     * @param <T>
     * @return
     */
    public static <T extends Comparable<T>> boolean equalsNotNullOrEmpty(T a, T b) {
        if (isNull(a) || isNull(b)) return false;
        if (a instanceof String && isNullOrEmpty((String) a) || b instanceof String && isNullOrEmpty((String) b))
            return false;
        return a.equals(b);
    }

    /**
     * 相等
     *
     * @param ary1
     * @param ary2
     * @return
     */
    public static boolean equals(byte[] ary1, byte[] ary2) {
        if (ary1 == null || ary2 == null) return false;
        if (ary1.length != ary2.length) return false;
        for (int i = 0; i < ary2.length; i++) {
            if (ary1[i] != ary2[i]) return false;
        }
        return true;
    }

    /**
     * 相等
     *
     * @param a
     * @param b
     * @return
     */
    public static <T extends Comparable<T>> boolean equals(T a, T b) {
        return !notEquals(a, b);
    }

    /**
     * 不等
     *
     * @param v1
     * @param v2
     * @return
     */
    public static <T extends Comparable<T>> boolean notEquals(T v1, T v2) {
        if (v1 == null && v2 == null) return false;
        if (v1 == null || v2 == null) return true;
        return v1.compareTo(v2) != 0;
    }

    // ------------------------------------------------------------------------

    /**
     * 转换为百分比字符串，指定留n位小数位
     *
     * @param bigDecimal
     * @return
     */
    public static String toPercentageString(BigDecimal bigDecimal, int scale) {
        BigDecimal result = bigDecimal.multiply(new BigDecimal(100)).setScale(scale);
        return result.toString() + "%";
    }

    /**
     * 转换为百分比字符串，默认留1位小数位
     *
     * @param bigDecimal
     * @return
     */
    public static String toPercentageString(BigDecimal bigDecimal) {
        return toPercentageString(bigDecimal, 1);
    }

    /**
     * 将null替换为默认值""
     *
     * @param value
     * @return
     */
    public static String nullToEmpty(String value) {
        return nullTo(value, "");
    }

    /**
     * 将null替换为默认值
     *
     * @param value
     * @param def
     * @return
     */
    public static <T> T nullTo(T value, T def) {
        return Objects.isNull(value) ? def : value;
    }

    /**
     * @param
     * @return
     * @Description: 清除字符串重复的数据，如“A,B,C,A,B”变成A,B,C
     * @Author taoduo
     * @Date 2018/11/28 16:03
     */
    public static String removeStrRepeat(String str, String split) {
        if (isNullOrEmpty(str)) return null;
        return Arrays.stream(StringUtils.splitPreserveAllTokens(str, split)).collect(Collectors.toSet()).stream().collect(Collectors.joining(split));
    }

    /**
     * @param
     * @return
     * @Description: 对象转Map todo 后续可以加入注解忽略字段
     * @Author taoduo
     * @Date 2018/12/6 19:39
     */
    public static Map<String, Object> objectToMap(Object obj) {
        if (obj == null) return null;

        Map<String, Object> map = new HashMap<>();

        try {
            BeanInfo beanInfo = Introspector.getBeanInfo(obj.getClass());
            PropertyDescriptor[] propertyDescriptors = beanInfo.getPropertyDescriptors();
            for (PropertyDescriptor property : propertyDescriptors) {
                String key = property.getName();
                if (key.compareToIgnoreCase("class") == 0 || key.equals("extData")) {
                    continue;
                }
                Method getter = property.getReadMethod();
                Object value = getter != null ? getter.invoke(obj) : null;
                map.put(key, value);
            }
        } catch (Exception e) {
            LOGGER.error("对象转Map报错，抛出异常e：{}", e);
        }

        return map;
    }

    /**
     * @param
     * @return
     * @Description: map转对象
     * @Author taoduo
     * @Date 2018/12/6 19:44
     */
    public static <T> T mapToObject(Map<String, Object> map, Class<T> beanClass) {
        if (map == null) return null;
        try {
            T t = beanClass.newInstance();

            BeanInfo beanInfo = Introspector.getBeanInfo(t.getClass());
            PropertyDescriptor[] propertyDescriptors = beanInfo.getPropertyDescriptors();
            for (PropertyDescriptor property : propertyDescriptors) {
                Method setter = property.getWriteMethod();
                if (DataUtil.isNull(setter)) continue;

                Object obj = DataUtil.notNull(map.get(property.getName())) ? convertValType(setter, map.get(property.getName())) : null;
                setter.invoke(t, obj);
            }
            return t;
        } catch (Exception e) {
            LOGGER.error("Map转对象报错，抛出异常e：{}", e);
        }
        return null;
    }

    /**
     * @param
     * @return
     * @Description: 针对日期类型做特殊处理
     * @Author taoduo
     * @Date 2018/12/10 16:51
     */
    private static Object convertValType(Method setter, Object value) {
        Object retVal = value;
        if ("java.util.Date".equals(setter.getParameterTypes()[0].getName())) {
            retVal = DateUtil.parseTimeInLongFormat(value.toString());
        } else if ("java.lang.Integer".equals(setter.getParameterTypes()[0].getName())) {
            retVal = Integer.valueOf(value.toString());
        }
        return retVal;
    }

    /**
     * 合并带逗号的字符串。
     *
     * @param oldStrings
     * @param newStrings
     * @return
     */
    public static final String mergeStrings(String oldStrings, String newStrings) {
        if (DataUtil.isNullOrEmpty(oldStrings) && DataUtil.isNullOrEmpty(newStrings)) return null;
        if (DataUtil.isNullOrEmpty(oldStrings)) return newStrings;
        if (DataUtil.isNullOrEmpty(newStrings)) return oldStrings;
        //
        List<String> oldList = Arrays.asList(oldStrings.split(",")).stream().collect(toList());
        List<String> newList = Arrays.asList(newStrings.split(",")).stream().collect(toList());
        newList.forEach(o -> {
            if (!oldList.contains(o)) oldList.add(o);
        });
        return String.join(",", oldList);
    }


    /**
     * 将从注解中获取的中文名称，进行切除冒号以后的文字，作为字段中文名称之用。
     *
     * @param name
     * @return
     */
    public static final String subStringToBizName(String name) {
        if (name.contains("：")) name = StringUtils.substringBefore(name, "：");
        if (name.contains(":")) name = StringUtils.substringBefore(name, ":");
        return name;
    }

    /**
     * 字符串数字保留一位小数
     * 如果能拆解，则吐出格式化后的字符串，如果不能拆解，吐出原字符串
     *
     * @param str 100   100.0  100.00  100%   100.0%  100.00%
     * @return
     */
    public static final String holdOneDecimalPlace(String str, boolean needChage) {
        if (DataUtil.isNullOrEmpty(str)) return null;
        if (!needChage) return str;
        String xx = str.substring(str.length() - 1, str.length());
        Number number = null;
        try {
            number = NumberFormat.getInstance().parse(str);
        } catch (ParseException e) {
            return null;
        }
        DecimalFormat df = new DecimalFormat("0.0");
        String result = df.format(number);
        if (xx.equals("%")) {
            result += xx;
        }
        return result;
    }

    public static final BigDecimal stripTrailingZeros(BigDecimal bigDecimal) {
        if (isNull(bigDecimal)) {
            return null;
        }
        return bigDecimal.stripTrailingZeros();
    }

}
