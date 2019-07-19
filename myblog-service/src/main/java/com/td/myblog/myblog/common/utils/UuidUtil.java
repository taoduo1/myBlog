package com.td.myblog.myblog.common.utils;

import java.util.UUID;

public class UuidUtil {

	private UuidUtil() {
	}

	public static String nextId() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}