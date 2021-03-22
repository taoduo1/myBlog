package com.example.myblog.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "user")
@Data
@JsonIgnoreProperties(value = { "hibernateLazyInitializer"})
public class User {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "name" , columnDefinition = "varchar(50) DEFAULT NULL COMMENT '名字'")
    private String name;

    @Column(name = "password" , columnDefinition = "varchar(50) DEFAULT NULL COMMENT '密码'")
    private String password;

    @Column(name = "age" ,columnDefinition = "int DEFAULT NULL COMMENT '年龄'")
    private Integer age;

    @Column(name = "sex" ,columnDefinition = "int DEFAULT NULL COMMENT '性别：1男，2女'")
    private Integer sex;

}
