package com.td.myblog.myblog.common.utils.json.converter;

import com.fasterxml.jackson.databind.util.StdConverter;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 
 * 用户在JSON序列化和反序列化时，将对象转换为String对象。
 * 一般传入对象为Long。
 * 
 * @author heng.yao
 *
 * @param <T>
 */
public class ToStringList<T> extends StdConverter<T, List<String>> {

	private ToString<Object> toString = new ToString<>();

	@Override
	public List<String> convert(T in) {
		if (in instanceof Object[]) return Arrays.asList((Object[]) in).stream().map(o -> toString.convert(o)).collect(Collectors.toList());
		if (in instanceof List) return ((List<?>) in).stream().map(o -> toString.convert(o)).collect(Collectors.toList());
		return Collections.emptyList();
	}

}
