package com.example.myblog.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.example.myblog.common.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * <p>
 * 角色权限表
 * </p>
 *
 * @author duo.tao
 * @since 2021-05-05
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("role_permission")
public class RolePermission extends BaseEntity<RolePermission> {

    /**
     * 角色id
     */
    @TableField("role_id")
    private Integer roleId;

    /**
     * 权限id
     */
    @TableField("permission_id")
    private Integer permissionId;



    @Override
    protected Serializable pkVal() {
        return super.getId();
    }

}
