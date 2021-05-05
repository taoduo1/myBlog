package com.example.myblog.entity;

import com.example.myblog.common.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;

/**
 * <p>
 * 用户表
 * </p>
 *
 * @author duo.tao
 * @since 2021-05-05
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
public class User extends BaseEntity<User> {

    /**
     * 姓名
     */
    @NotBlank(message = "用户名不能为空")
    private String name;

    /**
     * 编号
     */
    @NotBlank(message = "编号不能为空")
    private String code;

    /**
     * 手机号
     */
    private String mobile;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 密码
     */
    @NotBlank(message = "密码不能为空")
    private String password;


    @Override
    protected Serializable pkVal() {
        return super.getId();
    }

}
