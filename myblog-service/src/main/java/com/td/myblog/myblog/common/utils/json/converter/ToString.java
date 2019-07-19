package com.td.myblog.myblog.common.utils.json.converter;

import com.fasterxml.jackson.databind.util.StdConverter;
import java.math.BigDecimal;

/**
 * 
 * 用户在JSON序列化和反序列化时，将对象转换为String对象。
 * 一般传入对象为Long。
 * 
 * @author heng.yao
 *
 * @param <T>
 */
public class ToString<T> extends StdConverter<T, String> {

	@Override
	public String convert(T in) {
		if (in == null) return null;
		if (in instanceof String) return (String) in;
		if (in instanceof Long) return ((Long) in).toString();
		if (in instanceof Integer) return ((Integer) in).toString();
		if (in instanceof BigDecimal) return ((BigDecimal) in).toString();
		return in.toString();
	}

}
