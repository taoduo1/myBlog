package com.td.myblog.myblog.common.utils;

import com.td.myblog.myblog.common.utils.enums.interfaces.EnumNameBool;
import com.td.myblog.myblog.common.utils.enums.interfaces.EnumNameCode;
import com.td.myblog.myblog.common.utils.enums.interfaces.EnumNameIndex;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 枚举类转换成json
 *
 * @author TIM(JT)
 * @date 2017-05-22 18
 **/
@SuppressWarnings("unchecked")
public final class EnumUtil {

	private static final Logger LOGGER = LoggerFactory.getLogger(EnumUtil.class);

	private static Map<String, Class<EnumNameIndex>> mapNameIndexEnums = new HashMap<>();

	private static Map<String, Class<EnumNameCode>> mapNameCodeEnums = new HashMap<>();

	static {
		String rootPackageName = BooleanEnum.class.getPackage().getName();
		List<Class<?>> list = ClassUtil.findClasses(rootPackageName);
		for (Class<?> clazz : list) {
			Set<String> interfaces = Arrays.asList(clazz.getInterfaces()).stream().map(Class::getCanonicalName).collect(Collectors.toSet());
			if (clazz.isEnum() && interfaces.contains(EnumNameIndex.class.getName())) { //
				mapNameIndexEnums.put(clazz.getSimpleName(), (Class<EnumNameIndex>) clazz);
				mapNameIndexEnums.put(clazz.getName(), (Class<EnumNameIndex>) clazz);
				mapNameIndexEnums.put(StringUtils.removeStart(clazz.getName(), rootPackageName + "."), (Class<EnumNameIndex>) clazz);
			}
			if (clazz.isEnum() && interfaces.contains(EnumNameCode.class.getName())) { //
				mapNameCodeEnums.put(clazz.getSimpleName(), (Class<EnumNameCode>) clazz);
				mapNameCodeEnums.put(clazz.getName(), (Class<EnumNameCode>) clazz);
				mapNameCodeEnums.put(StringUtils.removeStart(clazz.getName(), rootPackageName + "."), (Class<EnumNameCode>) clazz);
			}
		}
		LOGGER.info("缓存枚举名称：{}", mapNameIndexEnums);
		LOGGER.info("缓存枚举名称：{}", mapNameCodeEnums);
	}

	private EnumUtil() {}

	/**
	 * 参数为类名，或包含包名的类名
	 * 
	 * @param enumname
	 * @return
	 */
	public static List<Map<String, Object>> getOptions(String enumname) {
		Class<EnumNameIndex> enu1 = findEnumNameIndexClass(enumname);
		if (enu1 != null) return buildListOfEnumNameIndex(enu1);
		Class<EnumNameCode> enu2 = findEnumNameCodeClass(enumname);
		if (enu2 != null) return buildListOfEnumNameCode(enu2);
		//
		throw new RuntimeException() ;
	}

	private static Class<EnumNameIndex> findEnumNameIndexClass(String enumname) {
		return mapNameIndexEnums.get(enumname);
	}

	private static Class<EnumNameCode> findEnumNameCodeClass(String enumname) {
		return mapNameCodeEnums.get(enumname);
	}

	private static <T extends EnumNameIndex> List<Map<String, Object>> buildListOfEnumNameIndex(Class<T> clazz) {
		T[] enumConstants = clazz.getEnumConstants();
		return Arrays.stream(enumConstants).map(o -> {
			Map<String, Object> map = new HashMap<>();
			map.put("name", o.getName());
			map.put("index", o.getIndex());
			return map;
		}).collect(Collectors.toList());
	}

	private static <T extends EnumNameCode> List<Map<String, Object>> buildListOfEnumNameCode(Class<T> clazz) {
		T[] enumConstants = clazz.getEnumConstants();
		return Arrays.stream(enumConstants).map(o -> {
			Map<String, Object> map = new HashMap<>();
			map.put("name", o.getName());
			map.put("code", o.getCode());
			return map;
		}).collect(Collectors.toList());
	}

	// ------------------------------------------------------------------------

	/**
	 * 根据值获取名称
	 * @param enumname
	 * @param index
	 * @return
	 */
	public static String getNameByIndex(String enumname, Integer index) {
		Class<EnumNameIndex> clazz = findEnumNameIndexClass(enumname);
		if (clazz == null) { throw new RuntimeException(); }
		return getNameByIndex(clazz, index);
	}

	/**
	 * 根据值获取名称
	 * @param enumname
	 * @param index
	 * @return
	 */
	public static String getNameByIndex(String enumname, String index) {
		Class<EnumNameIndex> clazz = findEnumNameIndexClass(enumname);
		if (clazz == null) { throw new RuntimeException(); }
		return getNameByIndex(clazz, index);
	}

	/**
	 * 根据值获取名称
	 * @param clazz
	 * @param index
	 * @return
	 */
	public static String getNameByIndex(Class<? extends EnumNameIndex> clazz, Integer index) {
		EnumNameIndex enu = enumOfIndex(clazz, index);
		return enu != null ? enu.getName() : "";
	}

	/**
	 * 根据值获取名称
	 * @param clazz
	 * @param index
	 * @return
	 */
	public static String getNameByIndex(Class<? extends EnumNameIndex> clazz, String index) {
		try {
			Integer indexvalue = Integer.valueOf(index);
			return getNameByIndex(clazz, indexvalue);
		} catch (NumberFormatException e) {
			return index;
		}
	}

	/**
	 * 根据值获取名称
	 * @param enumname
	 * @param code
	 * @return
	 */
	public static String getNameByCode(String enumname, String code) {
		Class<EnumNameCode> clazz = findEnumNameCodeClass(enumname);
		if (clazz == null) { throw new RuntimeException(); }
		return getNameByCode(clazz, code);
	}

	/**
	 * 根据值获取名称
	 * @param clazz
	 * @param code
	 * @return
	 */
	public static String getNameByCode(Class<? extends EnumNameCode> clazz, String code) {
		EnumNameCode enu = enumOfCode(clazz, code);
		return enu != null ? enu.getName() : "";
	}

	/**
	 * 根据值获取名称
	 * @param clazz
	 * @param bool
	 * @return
	 */
	public static String getNameByBool(Class<? extends EnumNameBool> clazz, Boolean bool) {
		EnumNameBool enu = enumOfBool(clazz, bool);
		return enu != null ? enu.getName() : "";
	}
	// ------------------------------------------------------------------------

	public static <T extends EnumNameIndex> T enumOfIndex(Class<T> clazz, Integer index) {
		if (index == null) return null;
		List<T> list = Arrays.asList(clazz.getEnumConstants());
		return list.stream().filter(o -> DataUtil.equals(o.getIndex(), index)).findFirst().orElse(null);
	}

	public static <T extends EnumNameIndex> T enumOfIndex(Class<T> clazz, String index) {
		if (index == null) return null;
		try {
			Integer indexvalue = Integer.valueOf(index);
			List<T> list = Arrays.asList(clazz.getEnumConstants());
			return list.stream().filter(o -> DataUtil.equals(o.getIndex(), indexvalue)).findFirst().orElse(null);
		} catch (NumberFormatException e) {
			return null;
		}
	}

	public static <T extends EnumNameCode> T enumOfCode(Class<T> clazz, String code) {
		if (code == null) return null;
		List<T> list = Arrays.asList(clazz.getEnumConstants());
		return list.stream().filter(o -> DataUtil.equals(o.getCode(), code)).findFirst().orElse(null);
	}

	public static <T extends EnumNameBool> T enumOfBool(Class<T> clazz, Boolean bool) {
		if (bool == null) return null;
		List<T> list = Arrays.asList(clazz.getEnumConstants());
		return list.stream().filter(o -> DataUtil.equals(o.getBool(), bool)).findFirst().orElse(null);
	}

}
