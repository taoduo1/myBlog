package com.td.myblog.myblog.common.utils.json.converter;

import com.fasterxml.jackson.databind.util.StdConverter;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 用户在JSON序列化和反序列化时，将对象转换为Long对象。
 * 一般传入对象为String。
 * 
 * @author heng.yao
 *
 * @param <T>
 */
public class ToLongList<T> extends StdConverter<T, List<Long>> {

	private ToLong<Object> toLong = new ToLong<>();

	@Override
	public List<Long> convert(T in) {
		if (in instanceof Object[]) return Arrays.asList((Object[]) in).stream().map(o -> toLong.convert(o)).collect(Collectors.toList());
		if (in instanceof List) return ((List<?>) in).stream().map(o -> toLong.convert(o)).collect(Collectors.toList());
		return Collections.emptyList();
	}

}
