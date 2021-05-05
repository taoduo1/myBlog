package com.example.myblog.entity;

import com.example.myblog.common.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * <p>
 * 角色表
 * </p>
 *
 * @author duo.tao
 * @since 2021-05-05
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
public class Role extends BaseEntity<Role> {

    /**
     * 名称
     */
    private String name;

    /**
     * 编号
     */
    private String code;


    @Override
    protected Serializable pkVal() {
        return super.getId();
    }

}
