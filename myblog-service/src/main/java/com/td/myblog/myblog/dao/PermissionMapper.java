package com.td.myblog.myblog.dao;

import com.td.myblog.myblog.dto.RolePermissionDto;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface PermissionMapper {

    /**
     * 通过名字查询用户信息
     */
    @Select("SELECT\n" +
            "r.`name` AS role_name,\n" +
            "p.url\n" +
            "FROM role r \n" +
            "LEFT JOIN role_permission rp ON rp.role_id = r.id \n" +
            "LEFT JOIN permission p ON p.id = rp.permission_id\n")
    List<RolePermissionDto> getRolePermissions();
}
