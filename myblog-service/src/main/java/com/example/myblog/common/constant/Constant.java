package com.example.myblog.common.constant;

/**
 * 系统常量
 *
 * @author duo.tao
 * @date 2018-08-24
 */
public interface Constant {

    String SYSTEM = "System";

    Integer OPTION_ALL = 1; // 某些场景，传入的下拉候选项“全部”。


    interface Str {
        /** 符号：竖线 */
        String VERTICAL_BAR = "|";
        /** 符号：逗号 */
        String COMMA        = ",";
        /** 符号：星号 */
        String ASTERISK     = "*";
        /** 符号：减号，连线 */
        String DASH         = "-";
        /** 符号：空串 */
        String EMPTY        = "";
        /** 符号：斜杠(上坡) */
        String SLASH        = "/";

        String POUND       = "#";
        String EMPTY_STRING = "";
        String AMPERSAND   = "&";
        String EQUAL       = "=";
        String QUESTION    = "?";
        String EXCLAMATION = "!";
        String DASH_DASH    = "--";
        String SEMICOLON   = ";";
        String UNDERSCORE  = "_";
        String CRLF        = "\r\n";
    }

    interface Chr {

    }

    interface Fields {
        // 公共的常用属性名称
        String ID          = "id";
        String IS_DELETED  = "isDeleted";
        String CREATE_BY   = "createBy";
        String CREATE_TIME = "createTime";
        String UPDATE_BY   = "updateBy";
        String UPDATE_TIME = "updateTime";

    }

}
