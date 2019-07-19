package com.td.myblog.myblog.common.enums.interfaces;

public enum EmptyEnum implements EnumNameBool, EnumNameCode, EnumNameIndex {
    ;

    @Override
    public String getCode() {
        return null;
    }

    @Override
    public String getName() {
        return null;
    }

    @Override
    public int getIndex() {
        return 0;
    }

    @Override
    public boolean getBool() {
        return false;
    }

}
