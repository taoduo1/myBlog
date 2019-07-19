package com.td.myblog.myblog.common.utils;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Properties;
import java.util.Set;
import java.util.function.BiConsumer;
import java.util.function.Function;
import java.util.stream.Collectors;
import org.apache.commons.lang3.StringUtils;

/**
 * 该类提供对集合类的高效操作
 * @author Czp
 *
 */

public class CollectionUtil {

	private static final int SUB_SIZE_DEFAULT = 15;

	/**
	 * 不允许实例化
	 */
	private CollectionUtil() {}

	/**
	 *  获取两个集合的不同元素
	 * @param collmax
	 * @param collmin
	 * @return
	 */
	@SuppressWarnings({"rawtypes", "unchecked"})
	public static Collection getDiffent(Collection collmax, Collection collmin) {
		//使用LinkeList防止差异过大时,元素拷贝
		Collection csReturn = new LinkedList();
		Collection max = collmax;
		Collection min = collmin;
		//先比较大小,这样会减少后续map的if判断次数
		if (collmax.size() < collmin.size()) {
			max = collmin;
			min = collmax;
		}
		//直接指定大小,防止再散列
		Map<Object, Integer> map = new HashMap<>(max.size());
		for (Object object : max) {
			map.put(object, 1);
		}
		for (Object object : min) {
			if (map.get(object) == null) {
				csReturn.add(object);
			} else {
				map.put(object, 2);
			}
		}
		for (Map.Entry<Object, Integer> entry : map.entrySet()) {
			if (entry.getValue() == 1) {
				csReturn.add(entry.getKey());
			}
		}
		return csReturn;
	}

	/**
	 *  获取两个集合的不同元素,去除重复
	 * @param collmax
	 * @param collmin
	 * @return
	 */
	@SuppressWarnings({"rawtypes", "unchecked"})
	public static Collection getDiffentNoDuplicate(Collection collmax, Collection collmin) {
		return new HashSet(getDiffent(collmax, collmin));
	}

	public static Map<String, String> getMap(Properties props) {
		Map<String, String> map = new HashMap<>();
		props.forEach((key, val) -> {
			if (key == null || val == null) return;
			if (key instanceof String && val instanceof String) map.put((String) key, (String) val);
		});
		return map;
	}

    /**
     * 将set1和set2的内容，合并成一个set。
     * @param set1
     * @param set2
     * @return
     */
    public static <T> Set<T> mergeSet(Set<T> set1, Set<T> set2) {
        Set<T> set = new HashSet<>();
        if (!DataUtil.isNullOrEmpty(set1)) set.addAll(set1);
        if (!DataUtil.isNullOrEmpty(set2)) set.addAll(set2);
        return set;
    }

	/**
	 * 将list1和list2的内容，拼接成一个list。
	 * @param list1
	 * @param list2
	 * @return
	 */
	public static <T> List<T> mergeList(List<T> list1, List<T> list2) {
		List<T> list = new ArrayList<>();
		if (!DataUtil.isNullOrEmpty(list1)) list.addAll(list1);
		if (!DataUtil.isNullOrEmpty(list2)) list.addAll(list2);
		return list;
	}

	/**
	 * 将list1和array2的内容，拼接成一个list。
	 * @param list1
	 * @param ary
	 * @return List<T>
	 */
	public static <T> List<T> mergeList(List<T> list1, @SuppressWarnings("unchecked") T... ary) {
		List<T> list = new ArrayList<>();
		if (!DataUtil.isNullOrEmpty(list1)) list.addAll(list1);
		if (ary != null && ary.length > 0) list.addAll(Arrays.asList(ary));
		return list;
	}

	/**
	 * 将原String[]中非null非""的数据作为新值，新生成一个String[]返回。
	 * 
	 * @param array
	 * @return
	 */
	public static String[] removeNull(String[] array) {
		List<String> list = Arrays.stream(array).filter(s -> !DataUtil.isNullOrEmpty(s)).collect(Collectors.toList());
		return list.toArray(new String[list.size()]);
	}

	public static String listToString(List<String> list) {
		if (list == null) return "";
		return StringUtils.join(list.toArray(), ",");
	}

	public static List<String> stringToList(String str) {
		if (DataUtil.isNullOrEmpty(str)) return new ArrayList<>();
		return Arrays.asList(str.split(","));
	}

	/**
	 * 将原有list转为最大size=num的一个个子list，以供逐个子list进行处理。
	 * @param list
	 * @param num
	 * @return
	 */
	public static <T> List<List<T>> subListBySize(List<T> list, int num) {
		List<List<T>> pList = new ArrayList<>();
		if (list == null || num <= 0) return pList;
		int size = list.size();
		for (int index = 0; index < size; index += num) {
			int toIndex = index + num;
			pList.add(list.subList(index, toIndex > size ? size : toIndex));
		}
		return pList;
	}

	/**
	 * 将原有set 转为最大size=num的一个个子set ，以供逐个子set 进行处理。
	 * @param list
	 * @param num
	 * @return
	 */
	public static <T> List<Set<T>> subListBySize(Set<T> list, int num) {
		List<Set<T>> pList = new ArrayList<>();
		if (list == null || num <= 0) return pList;
		Set<T> subSet = new HashSet<>();
		int n = 0;
		for (T t : list) {
			subSet.add(t);
			n++;
			if (n >= num) {
				pList.add(subSet);
				subSet = new HashSet<>();
				n = 0;
			}
		}
		if (!subSet.isEmpty()) {
			pList.add(subSet);
		}
		return pList;
	}

	/**
	 * 
	 * <pre>
	 * 对srcList, 通过getterFunction取出A的某个数据项B, 通过batchQueryFunction进行数据库批量查询得到映射<B, C>，通过setterFunction将C写入A。
	 * 完成对A的数据更新。
	 * </pre>
	 * @param srcList
	 * @param getterFunction 
	 * @param batchQueryFunction
	 * @param setterFunction
	 * @return
	 */
	public static <A, B, C> void processList(List<A> srcList, Function<A, B> getterFunction, Function<Collection<B>, Map<B, C>> batchQueryFunction, BiConsumer<A, C> setterFunction) {
		processList(srcList, getterFunction, batchQueryFunction, setterFunction, SUB_SIZE_DEFAULT);
	}

	/**
	 * 
	 * <pre>
	 * 对srcList, 通过getterFunction取出A的某个数据项B, 通过batchQueryFunction进行数据库批量查询得到映射<B, C>，通过setterFunction将C写入A。
	 * 完成对A的数据更新。
	 * </pre>
	 * @param srcList
	 * @param getterFunction 
	 * @param batchQueryFunction
	 * @param setterFunction
	 * @return
	 */
	public static <A, B, C> void processList(List<A> srcList, Function<A, B> getterFunction, Function<Collection<B>, Map<B, C>> batchQueryFunction, BiConsumer<A, C> setterFunction, int subSize) {
		if (DataUtil.isNullOrEmpty(srcList)) return;
		//
		Set<B> bs = srcList.stream().map(getterFunction).filter(Objects::nonNull).collect(Collectors.toSet());
		if (DataUtil.isNullOrEmpty(bs)) return;

		Map<B, C> fullMap = new HashMap<>();
		List<Set<B>> subListBs = subListBySize(bs, subSize);
		for (Set<B> subListB : subListBs) {
			Map<B, C> subMap = batchQueryFunction.apply(subListB);
			fullMap.putAll(subMap);
		}

		srcList.forEach(a -> {
			B b = getterFunction.apply(a);
			C c = fullMap.get(b);
			if (c != null) setterFunction.accept(a, c);
		});
	}

	// 样例，勿删
	public static void main(String[] args) {
		List<Bean1> srcList = new ArrayList<>();
		for (int i = 1; i < 40; i++) {
			Bean1 bean1 = new Bean1();
			bean1.setX(i);
			srcList.add(bean1);
		}
		System.out.println(JSONUtil.toJSONString(srcList));
		processList(srcList, Bean1::getX, bs -> bs.stream().collect(Collectors.toMap(Function.identity(), i -> "=" + String.valueOf(i * i), (o1, o2) -> o1)), Bean1::setY);

		System.out.println(JSONUtil.toJSONString(srcList));

	}

	public static class Bean1 {
		private Integer x;

		private String y;

		public Integer getX() {
			return x;
		}

		public void setX(Integer x) {
			this.x = x;
		}

		public String getY() {
			return y;
		}

		public void setY(String y) {
			this.y = y;
		}

	}
}
