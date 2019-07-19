package com.td.myblog.myblog.common.utils.enums.interfaces;

import java.util.Optional;

/**
 * 枚举 接口
 *
 * @author TIM(JT)
 * @date 2017-05-22 18
 **/
public interface IBool {

	boolean getBool();

	/**
	 * 当前枚举项的值（code）是否匹配传入参数。
	 * @param value
	 * @return
	 */
	default boolean match(Boolean value) {
		return Optional.ofNullable(value).map(v -> v.equals(getBool())).orElse(false);
	}

	/**
	 * 当前枚举项的值（code）是否匹配传入参数。
	 * @param value
	 * @return
	 */
	default boolean notMatch(Boolean value) {
		return !match(value);
	}
}
