package com.example.myblog.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * <p>
 * 
 * </p>
 *
 * @author duo.tao
 * @since 2021-03-22
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@Entity
@Table(name = "user")
@JsonIgnoreProperties(value = { "hibernateLazyInitializer"})
public class User extends Model<User> {

    private static final long serialVersionUID = 1L;

    @Id
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
