package com.example.myblog.common.utils;

import com.example.myblog.common.constant.Constant;
import com.example.myblog.common.enums.ComparatorEnum;
import com.example.myblog.common.enums.ICode;
import com.example.myblog.common.enums.IIndex;
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
import java.text.NumberFormat;
import java.text.ParseException;
import java.util.*;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

import static java.util.stream.Collectors.toList;

/**
 * The Class DataUtil.
 */
public class DataUtil {


    private static final Logger LOGGER = LoggerFactory.getLogger(DataUtil.class);

    /**
     * Description: 判断换行的正则表达式
     */
    private static final String REGEXP_LINE_CRLF = "((\\r\\n)|\\r|\\n)";
    /**
     * Description:变量名称。
     */
    private static final String REGEXP_VAR_NAME  = "\\w+";

    private static final String CHR_EQUAL = "=";

	private DataUtil() {}

	// ------------------------------------------------------------------------

	/**
     * Not null.
     *
     * @param object the object
     * @return true, if successful
     */
	public static boolean notNull(Object object) {
		return object != null;
	}

	/**
     * Not null or empty.
     *
     * @param string the string
     * @return true, if successful
     */
	public static boolean notNullOrEmpty(String string) {
		return !StringUtils.isEmpty(string);
	}

	/**
     * Not null or empty.
     *
     * @param collection the collection
     * @return true, if successful
     */
	public static boolean notNullOrEmpty(Collection<?> collection) {
		return collection != null && !collection.isEmpty();
	}
	// ------------------------------------------------------------------------

	/**
     * Checks if is null.
     *
     * @param object the object
     * @return true, if is null
     */
	public static boolean isNull(Object object) {
		return object == null;
	}

	/**
     * Checks if is null or empty.
     *
     * @param string the string
     * @return true, if is null or empty
     */
	public static boolean isNullOrEmpty(String string) {
		return StringUtils.isEmpty(string);
	}

	/**
     * Checks if is null or empty.
     *
     * @param collection the collection
     * @return true, if is null or empty
     */
	public static boolean isNullOrEmpty(Collection<?> collection) {
		return collection == null || collection.isEmpty();
	}

    /**
     * Checks if is null or empty.
     *
     * @param map the map
     * @return true, if is null or empty
     */
    public static boolean isNullOrEmpty(Map<?, ?> map) {
        return map == null || map.isEmpty();
    }

	/**
     * Empty to null.
     *
     * @param value the value
     * @return the string
     */
	public static String emptyToNull(String value) {
		return "".equals(value) ? null : value;
	}

	/**
     * To string.
     *
     * @param object the object
     * @return the string
     */
	public static String toString(Object object) {
		if (object == null) {
			return null;
		} else if (object instanceof String) {
		    return (String)object;
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
     * 返回第一个非空的对象.
     *
     * @param values the values
     * @return the object
     */
	public static final Object firstNotNull(Object... values) {
		return ObjectUtils.firstNonNull(values);
	}

	/**
     * 返回第一个非空（及非""）的字符串。
     * 没有匹配的情况下，返回最后一个。.
     *
     * @param strings the strings
     * @return the string
     */
	public static final String firstNotNullOrBlank(String... strings) {
		if (strings == null) return null;
		if (strings.length == 0) return null;
		return Arrays.stream(strings).filter(DataUtil::notNullOrEmpty).findFirst().orElse(strings[strings.length - 1]);
	}

	/**
     * 转换为Long对象。.
     *
     * @param object the object
     * @return the long
     */
	public static Long toLong(Object object) {
		if (Objects.isNull(object)) return null;
		if (object instanceof Long) return (Long) object;
		if (object instanceof Integer) return Long.valueOf((Integer) object);
		if (object instanceof String) return Long.parseLong((String) object);
		return Long.parseLong(String.valueOf(object));
	}

	/**
     * 转换为Integer对象。.
     *
     * @param object the object
     * @return the integer
     */
	public static Integer toInteger(Object object) {
		if (Objects.isNull(object)) return null;
		if (object instanceof Integer) return (Integer) object;
		if (object instanceof Long) return ((Long) object).intValue();
		if (object instanceof String) return Integer.parseInt((String) object);
		return Integer.parseInt(String.valueOf(object));
	}
	
	/**
     * 将字符串值转换为指定类型的数据。
     * 
     * @param value
     * @param clazz
     * @return
     */
    public static Object toType(String value, Class<?> clazz) {
        if (clazz == String.class) {
            return value;
        } else if (clazz == Integer.class) {
            return Integer.valueOf(value);
        } else if (clazz == Boolean.class) {
            return Boolean.valueOf(value);
        } else if (clazz == Date.class) {
            return DateUtil.parseTime(value, DateUtil.YYYY_MM_DD_HH_MM_SS);
        } else if (clazz == Long.class) {
            return Long.valueOf(value);
        } else if (clazz == BigDecimal.class) {
            return new BigDecimal(value);
        } else {
            return value;
        }
    }

	// ------------------------------------------------------------------------

	/**
     * 对mapper.clone(s, t)进行一次封装。
     *
     * @param <S> the generic type
     * @param <T> the generic type
     * @param s 原来
     * @param t 目标
     * @return 返回目标
     */
	public static <S, T> T cloneBean(S s, T t) {
		if (s != null && t != null) BeanUtils.copyProperties(s, t); //
		return t;
	}

	/**
     * Clone bean.
     *
     * @param <S> the generic type
     * @param s the s
     * @return the s
     */
	public static <S> S cloneBean(S s) {
		if (s == null) return null;
		@SuppressWarnings("unchecked")
		S result = (S) cloneBean(s, s.getClass());
		return result;
	}

	/**
     * Clone bean.
     *
     * @param <S> the generic type
     * @param <T> the generic type
     * @param s the s
     * @param clazzT the clazz T
     * @return the t
     */
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

	/**
     * Clone bean with non null fields.
     *
     * @param <S> the generic type
     * @param <T> the generic type
     * @param s the s
     * @param t the t
     * @return the t
     */
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
     * 获取对象的属性Field（仅值非空的）.
     *
     * @param object the object
     * @return the non null fields
     */
	public static final Set<Field> getNonNullFields(Object object) {
		List<Field> fields = FieldUtils.getAllFieldsList(object.getClass());
		return getNonNullFields(object, fields);
	}

	/**
     * 获取对象的属性Field（仅值非空的）.
     *
     * @param object the object
     * @param fields the fields
     * @return the non null fields
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
     * 通过转为String进行判断的。.
     *
     * @param <T> the generic type
     * @param a the a
     * @param b the b
     * @return true, if successful
     */
	public static <T extends Comparable<T>> boolean equalsByStringNotNullOrEmpty(Object a, Object b) {
		if (isNull(a) || isNull(b)) return false;
		if (a instanceof String && isNullOrEmpty((String) a) || b instanceof String && isNullOrEmpty((String) b)) return false;
		return Optional.ofNullable(toString(a)).map(e -> e.equals(toString(b))).orElse(false);
	}

	/**
     * 相等
     * 前提：都不为null或"".
     *
     * @param <T> the generic type
     * @param a the a
     * @param b the b
     * @return true, if successful
     */
	public static <T extends Comparable<T>> boolean equalsNotNullOrEmpty(T a, T b) {
		if (isNull(a) || isNull(b)) return false;
		if (a instanceof String && isNullOrEmpty((String) a) || b instanceof String && isNullOrEmpty((String) b)) return false;
		return a.equals(b);
	}

	/**
     * 相等.
     *
     * @param ary1 the ary 1
     * @param ary2 the ary 2
     * @return true, if successful
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
     * 相等.
     *
     * @param <T> the generic type
     * @param a the a
     * @param b the b
     * @return true, if successful
     */
	public static <T extends Comparable<T>> boolean equals(T a, T b) {
		return !notEquals(a, b);
	}

	/**
     * 不等.
     *
     * @param <T> the generic type
     * @param v1 the v 1
     * @param v2 the v 2
     * @return true, if successful
     */
	public static <T extends Comparable<T>> boolean notEquals(T v1, T v2) {
		if (v1 == null && v2 == null) return false;
		if (v1 == null || v2 == null) return true;
		return v1.compareTo(v2) != 0;
	}
	
	// ------------------------------------------------------------------------

	/**
     * 转换为百分比字符串，指定留n位小数位.
     *
     * @param bigDecimal the big decimal
     * @param scale the scale
     * @return the string
     */
	public static String toPercentageString(BigDecimal bigDecimal, int scale) {
        BigDecimal result = bigDecimal.multiply(BigDecimal.valueOf(100)).setScale(scale);
		return result.toString() + "%";
	}

	/**
     * 转换为百分比字符串，默认留1位小数位.
     *
     * @param bigDecimal the big decimal
     * @return the string
     */
	public static String toPercentageString(BigDecimal bigDecimal) {
		return toPercentageString(bigDecimal, 1);
	}

	/**
     * 将null替换为默认值"".
     *
     * @param value the value
     * @return the string
     */
	public static String nullToEmpty(String value) {
		return nullTo(value, "");
	}

	/**
     * 将null替换为默认值.
     *
     * @param <T> the generic type
     * @param value the value
     * @param def the def
     * @return the t
     */
	public static <T> T nullTo(T value, T def) {
		return Objects.isNull(value) ? def : value;
	}


    /**
     * Gets the val not null. 尝试获取对象的属性，为空判断返回nulldef值。
     * <pre>
     * Sample 没有使用该方法的代码:
     * DataUtil.notNull(n.getLdi()) ? n.getLdi().toPlainString() : null
     * Sample 切换使用该方法的代码:
     * DataUtil.getBeanProp(n.getLdi(), null, BigDecimal::toPlainString)
     * 
     * </pre>
     *
     * @param <T> the generic type
     * @param <R> the generic type
     * @param bean the bean
     * @param nulldef the nulldef
     * @param getter the getter
     * @return the val not null
     */
    public static <T, R> R getBeanProp(T bean, R nulldef, Function<T, R> getter) {
        R result = nulldef;
        if (notNull(bean)) {
            R temp = getter.apply(bean);
            if (notNull(temp)) {
                result = temp;
            }
        }
        return result;
    }

    /**
     * Gets the val not null. 尝试获取对象的属性，为空判断返回nulldef值。
     *
     * @param <T> the generic type
     * @param <R> the generic type
     * @param <S> the generic type
     * @param bean the bean
     * @param nulldef the nulldef
     * @param getter1 the getter 1
     * @param getter2 the getter 2
     * @return the val not null
     */
    public static <T, R, S> S getBeanProp(T bean, S nulldef, Function<T, R> getter1, Function<R, S> getter2) {
        S result = nulldef;
        if (notNull(bean)) {
            R temp1 = getter1.apply(bean);
            if (notNull(temp1)) {
                S temp2 = getter2.apply(temp1);
                if (notNull(temp2)) {
                    result = temp2;
                }
            }
        }
        return result;
    }

    /**
     * Gets the val not null or empty. 尝试获取对象的属性，为空判断返回nulldef值。
     *
     * @param <T> the generic type
     * @param bean the bean
     * @param nullDef the nulldef
     * @param getter the getter
     * @return the val not null or empty
     */
    public static <T> String getBeanProp(T bean, String nullDef, Function<T, String> getter) {
        String result = nullDef;
        if (notNull(bean)) {
            String temp = getter.apply(bean);
            if (notNullOrEmpty(temp)) {
                result = temp;
            }
        }
        return result;
    }

    /**
     * Gets the val not null or empty. 尝试获取对象的属性，为空判断返回nulldef值。
     *
     * @param <T> the generic type
     * @param <R> the generic type
     * @param bean the bean
     * @param nullDef the nulldef
     * @param getter1 the getter 1
     * @param getter2 the getter 2
     * @return the val not null or empty
     */
    public static <T, R> String getBeanProp(T bean, String nullDef, Function<T, R> getter1, Function<R, String> getter2) {
        String result = nullDef;
        if (notNull(bean)) {
            R temp1 = getter1.apply(bean);
            if (notNull(temp1)) {
                String temp2 = getter2.apply(temp1);
                if (notNullOrEmpty(temp2)) {
                    result = temp2;
                }
            }
        }
        return result;
    }

	/**
     * Removes the str repeat.
     *
     * @param str the str
     * @param split the split
     * @return the string
     * @Description: 清除字符串重复的数据，如“A,B,C,A,B”变成A,B,C
     */
	public static String removeStrRepeat(String str, String split) {
		if (isNullOrEmpty(str)) return null;
		return Arrays.stream(StringUtils.splitPreserveAllTokens(str, split)).collect(Collectors.toSet()).stream().collect(Collectors.joining(split));
	}

	/**
     * Object to map.
     *
     * @param obj the obj
     * @return the map
     * @Description: 对象转Map
     */
	public static Map<String, Object> objectToMap(Object obj) {
		return objectToMap(obj, true);
	}
	
	public static Map<String, Object> objectToMapNoNull(Object obj) {
		return objectToMap(obj, false);
	}
	
	private static Map<String, Object> objectToMap(Object obj , boolean withNull) {
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
				if (value != null || withNull) map.put(key, value);
			}
		} catch (Exception e) {
			LOGGER.error("对象转Map报错，抛出异常e：{}", e);
		}

		return map;
	}

	/**
     * Map to object.
     *
     * @param <T> the generic type
     * @param map the map
     * @param beanClass the bean class
     * @return the t
     * @Description: map转对象
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
	* @Description: 针对日期类型做特殊处理
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
     * 合并带逗号的字符串。.
     *
     * @param oldStrings the old strings
     * @param newStrings the new strings
     * @return the string
     */
	public static final String mergeStrings(String oldStrings, String newStrings) {
		if (DataUtil.isNullOrEmpty(oldStrings) && DataUtil.isNullOrEmpty(newStrings)) return null;
		if (DataUtil.isNullOrEmpty(oldStrings)) return newStrings;
		if (DataUtil.isNullOrEmpty(newStrings)) return oldStrings;
		//
		List<String> oldList = Arrays.asList(oldStrings.split(Constant.Str.COMMA)).stream().collect(toList());
		List<String> newList = Arrays.asList(newStrings.split(Constant.Str.COMMA)).stream().collect(toList());
		newList.forEach(o -> {
			if (!oldList.contains(o)) oldList.add(o);
		});
		return String.join(Constant.Str.COMMA, oldList);
	}
	
	
	/**
     * 将从注解中获取的中文名称，进行切除冒号以后的文字，作为字段中文名称之用。.
     *
     * @param name the name
     * @return the string
     */
	public static final String subStringToBizName(String name) {
        if (name.contains("：")) name = StringUtils.substringBefore(name, "：");
        if (name.contains(":")) name = StringUtils.substringBefore(name, ":");
        return name;
    }

	/**
     * 字符串数字保留一位小数
     * 如果能拆解，则吐出格式化后的字符串，如果不能拆解，吐出原字符串.
     *
     * @param str 100   100.0  100.00  100%   100.0%  100.00%
     * @param needChage the need chage
     * @return the string
     */
	public static final String holdOneDecimalPlace(String str,boolean needChage){
		if (DataUtil.isNullOrEmpty(str)) return null;
		if (!needChage) return str;
		String xx = str.substring(str.length() - 1, str.length());
		Number number = null;
		try {
			number = NumberFormat.getInstance().parse(str);
		} catch (ParseException e) {
			return null;
		}
		String result = new BigDecimal(number.toString()).setScale(1,BigDecimal.ROUND_HALF_UP).toString();
		if (xx.equals("%")){
			result += xx;
		}
		return result;
	}

	/**
     * Strip trailing zeros.
     *
     * @param bigDecimal the big decimal
     * @return the big decimal
     */
	public static final BigDecimal stripTrailingZeros(BigDecimal bigDecimal){
		if (isNull(bigDecimal)){
			return  null;
		}
		return bigDecimal.stripTrailingZeros();
	}
	
	/**
	 * Gets the big decimal.
	 *
	 * @param data        the data
	 * @param defaultData the default data
	 * @return the big decimal
	 */
	public static final BigDecimal getBigDecimal(String data, BigDecimal defaultData){
		if (DataUtil.isNullOrEmpty(data)) {
			return defaultData;
		}
		Pattern pattern = Pattern.compile("([-]?\\d+\\.?\\d*).*");
		Matcher matcher = pattern.matcher(data);
		if (!matcher.matches()) {
			return defaultData;
		}
		String dataPart = matcher.group(1);
		if (DataUtil.notNullOrEmpty(dataPart)) {
			return new BigDecimal(dataPart);
		}
		return defaultData;
	}
	
	/**
	 * Gets the big decimal.
	 *
	 * @param data        the data
	 * @param defaultData the default data
	 * @return the big decimal
	 */
	public static final BigDecimal getBigDecimal(Object data, BigDecimal defaultData){
		BigDecimal result = defaultData;
		if (data != null) {
			if (data instanceof BigDecimal) {
				return (BigDecimal) data;
			} else if(data instanceof String) {
				return getBigDecimal((String)data, defaultData);
			} else {
				LOGGER.warn("not support type {}", data.getClass().getName());
			}
		}
		return result;
	}
	
	/**
	 * Compare big decimal.
	 *
	 * @param data   the data
	 * @param target the target
	 * @return the comparator enum
	 */
	public static final ComparatorEnum compareBigDecimal(Object data, BigDecimal target) {
		BigDecimal source = getBigDecimal(data, null);
		return ComparatorEnum.get(source, target);
	}
	
	/**
	 * Compare big decimal.
	 *
	 * @param data       the data
	 * @param comparator the comparator
	 * @param target     the target
	 * @return true, if successful
	 */
	public static final boolean compareBigDecimal(Object data, ComparatorEnum comparator, BigDecimal target) {
		BigDecimal source = getBigDecimal(data, null);
		return comparator.match(compareBigDecimal(source, target));
	}

    /**
     * Compare big decimal between.
     *
     * @param v the v
     * @param v1 the v 1
     * @param v2 the v 2
     * @return true, if successful
     */
    public static final boolean compareBetween(BigDecimal v, BigDecimal v1, BigDecimal v2) {
        return v.compareTo(v1) >= 0 && v.compareTo(v2) <= 0;
    }

    public static final boolean compareBetween(BigDecimal v, long v1, long v2) {
        return v.compareTo(BigDecimal.valueOf(v1)) >= 0 && v.compareTo(BigDecimal.valueOf(v2)) <= 0;
    }

    /**
     * Convert content to list.
     *
     * @param content the content
     * @return the list
     */
    public static final List<String> convertContentToList(String content) {
        if (content == null) return new ArrayList<String>();
        String[] tempAry = content.split(REGEXP_LINE_CRLF);
        return Arrays.stream(tempAry).collect(Collectors.toList());
    }

    /**
     * Convert content to list.
     *
     * @param content the content
     * @param predicate the predicate
     * @return the list
     */
    public static final List<String> convertContentToList(String content, Predicate<String> predicate){
        List<String> list = convertContentToList(content);
        if (predicate != null) list = list.stream().filter(predicate).collect(Collectors.toList());
        return list;
    }

    /**
     * Convert lines to map.
     *
     * @param lines the lines
     * @return the map
     */
    public static final Map<String, String> convertLinesToMap(List<String> lines) {
        return lines.stream().map(String::trim).filter(s -> StringUtils.contains(s, CHR_EQUAL) && StringUtils.substringBefore(s, CHR_EQUAL).trim().matches(REGEXP_VAR_NAME))
                .collect(Collectors.toMap(line -> StringUtils.substringBefore(line, CHR_EQUAL).trim(), line -> StringUtils.substringAfter(line, CHR_EQUAL).trim(), (o1, o2) -> o2));
    }

    /**
     * Description: 获取均值，并转换为文本。供导出程序简化使用。
     * @param arg0
     * @param arg1
     * @return
     */
    public static final String calcAverageStr(BigDecimal arg0, BigDecimal arg1) {
        return arg0.add(arg1).divide(BigDecimal.valueOf(2)).setScale(2, BigDecimal.ROUND_DOWN).toPlainString();
    }

    // ------------------------------------------------------------------------

    /**
     * 判断匹配任何一个
     * 
     * @param x
     * @param ary
     * @return
     */
    public static boolean anyMatch(Integer x, IIndex... ary) {
        if (ary == null) return false;
        return Arrays.stream(ary).filter(Objects::nonNull).anyMatch(o -> o.match(x));
    }

    /**
     * 判断匹配任何一个
     * 
     * @param x
     * @param ary
     * @return
     */
    public static boolean anyMatch(String x, ICode... ary) {
        if (ary == null) return false;
        return Arrays.stream(ary).filter(Objects::nonNull).anyMatch(o -> o.match(x));
    }

}
