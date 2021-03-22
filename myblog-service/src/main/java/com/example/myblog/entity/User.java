package com.example.myblog.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import javax.persistence.Column;

/**
 * <p>
 * 
 * </p>
 *
 * @author zkb
 * @since 2021-03-22
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class User extends Model<User> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 年龄
     */
    @Column(name = "age" ,columnDefinition = "int DEFAULT NULL COMMENT '年龄'")
    private Integer age;

    /**
     * 名字
     */
    @Column(name = "name" , columnDefinition = "varchar(50) DEFAULT NULL COMMENT '名字'")
    private String name;

    /**
     * 密码
     */
    @Column(name = "password" , columnDefinition = "varchar(50) DEFAULT NULL COMMENT '密码'")
    private String password;

    /**
     * 性别：1男，2女
     */
    @Column(name = "sex" ,columnDefinition = "int DEFAULT NULL COMMENT '性别：1男，2女'")
    private Integer sex;


    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
