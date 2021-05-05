package com.example.myblog.entity;

import com.example.myblog.common.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * <p>
 * 权限表
 * </p>
 *
 * @author duo.tao
 * @since 2021-05-05
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
public class Permission extends BaseEntity<Permission> {

    private static final long serialVersionUID = 1L;

    /**
     * 名称
     */
    private String name;

    /**
     * 路径地址
     */
    private String url;


    @Override
    protected Serializable pkVal() {
        return super.getId();
    }

}
