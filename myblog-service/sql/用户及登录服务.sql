CREATE TABLE `t_user`
(
    `id`            bigint(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `name`          varchar(50)         DEFAULT '' COMMENT '员工姓名',
    `code`          varchar(50)         DEFAULT '' COMMENT '员工工号',
    `department_id` bigint(10)          DEFAULT 0 COMMENT '部门',
    `mobile`        varchar(50)         DEFAULT '' COMMENT '手机号',
    `email`         varchar(50)         DEFAULT '' COMMENT '邮箱',
    `password`      varchar(200)        DEFAULT '' COMMENT '密码',
    `create_time`   timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `update_time`   timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `create_by`     bigint(10)          DEFAULT 0 COMMENT '创建人id',
    `update_by`     bigint(10)          DEFAULT 0 COMMENT '更新人id',
    `delete_by`     bigint(10)          DEFAULT 0 COMMENT '删除人id',
    `is_deleted`    tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否作废0: 未删除 1: 删除',
    `tenant_id`     varchar(100)        DEFAULT '' COMMENT '用户唯一标识',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8mb4 COMMENT ='员工表';