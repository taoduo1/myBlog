package com.example.myblog.common.config;

import com.baomidou.mybatisplus.mapper.MetaObjectHandler;
import com.example.myblog.common.utils.DateUtil;
import org.apache.ibatis.reflection.MetaObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * <p> MyBatisPlus自定义字段自动填充处理类 - 实体类中使用 @TableField注解 </p>
 *
 * @description: 注意前端传值时要为null
 * @author: duo.tao
 * @date: 2019/8/18 0018 1:46
 */
@Component
public class MyMetaObjectHandler extends MetaObjectHandler {

    private static final Logger LOG = LoggerFactory.getLogger(MyMetaObjectHandler.class);

    /**
     * 创建时间
     */
    @Override
    public void insertFill(MetaObject metaObject) {
        LOG.info(" -------------------- start insert fill ...  --------------------");
        if (metaObject.hasGetter("createTime") && metaObject.hasGetter("updateTime")) {
            setFieldValByName("createTime", new Date(), metaObject); //创建时间
            setFieldValByName("updateTime", new Date(), metaObject); //修改时间
        }

        // 日志输出 ================================================================================================
        Date createTime = (Date) this.getFieldValByName("createTime", metaObject);
        Date updateTime = (Date) this.getFieldValByName("updateTime", metaObject);
        if (createTime != null && updateTime != null) {
            LOG.info("MyBatisPlus自动填充处理 - gmtCreate:{} gmtModified:{}", DateUtil.format(createTime, DateUtil.YYYY_MM_DD), DateUtil.format(updateTime, DateUtil.YYYY_MM_DD));
        }

    }

    /**
     * 最后一次更新时间
     */
    @Override
    public void updateFill(MetaObject metaObject) {
        LOG.info(" -------------------- start update fill ...  --------------------");
        if (metaObject.hasGetter("et.updateTime")) {
            setFieldValByName("updateTime", new Date(), metaObject);
        }

        // 日志输出 ================================================================================================
        Date updateTime = (Date) this.getFieldValByName("updateTime", metaObject);
        if (updateTime != null) {
            LOG.info("MyBatisPlus自动填充处理 - gmtModified:{}", DateUtil.format(updateTime, DateUtil.YYYY_MM_DD));
        }
    }

}
