-- 用户表关联角色表 建立用户角色表

CREATE TABLE `user`
(
    `id`          bigint(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `name`        varchar(50)         DEFAULT null COMMENT '姓名',
    `code`        varchar(50)         DEFAULT null COMMENT '编号',
    `mobile`      varchar(50)         DEFAULT null COMMENT '手机号',
    `email`       varchar(50)         DEFAULT null COMMENT '邮箱',
    `password`    varchar(50)         DEFAULT null COMMENT '密码',
    `create_time` timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `update_time` timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `create_by`   bigint(10)          DEFAULT 0 COMMENT '创建人id',
    `update_by`   bigint(10)          DEFAULT 0 COMMENT '更新人id',
    `delete_by`   bigint(10)          DEFAULT 0 COMMENT '删除人id',
    `is_deleted`  tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否作废0: 未删除 1: 删除',
    `remark`      varchar(255)        DEFAULT null COMMENT '备注',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8mb4 COMMENT ='用户表';

CREATE TABLE `role`
(
    `id`          bigint(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `name`        varchar(50)         DEFAULT null COMMENT '名称',
    `code`        varchar(50)         DEFAULT null COMMENT '编号',
    `create_time` timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `update_time` timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `create_by`   bigint(10)          DEFAULT 0 COMMENT '创建人id',
    `update_by`   bigint(10)          DEFAULT 0 COMMENT '更新人id',
    `delete_by`   bigint(10)          DEFAULT 0 COMMENT '删除人id',
    `is_deleted`  tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否作废0: 未删除 1: 删除',
    `remark`      varchar(255)        DEFAULT null COMMENT '备注',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8mb4 COMMENT ='角色表';

CREATE TABLE `user_role`
(
    `id`          bigint(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `user_id`     bigint(10)          DEFAULT 0 COMMENT '用户id',
    `role_id`     bigint(10)          DEFAULT 0 COMMENT '角色id',
    `create_time` timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `update_time` timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `create_by`   bigint(10)          DEFAULT 0 COMMENT '创建人id',
    `update_by`   bigint(10)          DEFAULT 0 COMMENT '更新人id',
    `delete_by`   bigint(10)          DEFAULT 0 COMMENT '删除人id',
    `is_deleted`  tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否作废0: 未删除 1: 删除',
    `remark`      varchar(255)        DEFAULT null COMMENT '备注',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8mb4 COMMENT ='用户角色表';

-- 角色表关联权限表 建立角色权限表

CREATE TABLE `permission`
(
    `id`          bigint(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `name`        varchar(50)         DEFAULT null COMMENT '名称',
    `url`         varchar(255)        DEFAULT null COMMENT '路径地址',
    `create_time` timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `update_time` timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `create_by`   bigint(10)          DEFAULT 0 COMMENT '创建人id',
    `update_by`   bigint(10)          DEFAULT 0 COMMENT '更新人id',
    `delete_by`   bigint(10)          DEFAULT 0 COMMENT '删除人id',
    `is_deleted`  tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否作废0: 未删除 1: 删除',
    `remark`      varchar(255)        DEFAULT null COMMENT '备注',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8mb4 COMMENT ='权限表';


CREATE TABLE `role_permission`
(
    `id`            bigint(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `role_id`       bigint(10)          DEFAULT 0 COMMENT '角色id',
    `permission_id` bigint(10)          DEFAULT 0 COMMENT '权限id',
    `create_time`   timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `update_time`   timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `create_by`     bigint(10)          DEFAULT 0 COMMENT '创建人id',
    `update_by`     bigint(10)          DEFAULT 0 COMMENT '更新人id',
    `delete_by`     bigint(10)          DEFAULT 0 COMMENT '删除人id',
    `is_deleted`    tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否作废0: 未删除 1: 删除',
    `remark`        varchar(255)        DEFAULT null COMMENT '备注',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8mb4 COMMENT ='角色权限表';


