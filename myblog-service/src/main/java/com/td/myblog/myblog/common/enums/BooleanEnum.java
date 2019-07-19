package com.td.myblog.myblog.common.enums;


import com.td.myblog.myblog.common.enums.interfaces.EnumNameBool;
import com.td.myblog.myblog.common.enums.interfaces.EnumNameCode;
import com.td.myblog.myblog.common.enums.interfaces.EnumNameIndex;

/**
 *  bool 值枚举
 */
public enum BooleanEnum implements EnumNameIndex, EnumNameCode, EnumNameBool {

	FALSE(0, "否", "0", false),
	TRUE(1, "是", "1", true);

	private String	name;
	private int		index;
	private String	code;
	private boolean	value;

	BooleanEnum(int index, String name, String code, boolean value) {
		this.index = index;
		this.name = name;
		this.code = code;
		this.value = value;
	}

	@Override
	public int getIndex() {
		return index;
	}

	@Override
	public String getCode() {
		return code;
	}

	@Override
	public boolean getBool() {
		return value;
	}

	@Override
	public String getName() {
		return name;
	}

}
