package com.example.myblog.common;

import com.p6spy.engine.spy.appender.MessageFormattingStrategy;

import java.time.LocalDateTime;

public class P6SpyLogger implements MessageFormattingStrategy {
    /**
     * @Desc: 重写日志格式方法
     * now:当前时间
     * elapsed:执行耗时
     * category：执行分组
     * prepared：预编译sql语句
     * sql:执行的真实SQL语句，已替换占位
     */
    @Override
    public String formatMessage(int connectionId, String now, long elapsed, String category, String prepared, String sql) {
        return !"".equals(sql.trim())
                ?
                "[ " + LocalDateTime.now() + " ] --- | took " + elapsed + "ms | " + prepared + "|" + category + " | connection " + connectionId + "\n "
                        + sql + ";"
                : "";
    }
}
