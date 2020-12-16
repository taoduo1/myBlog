package com.td.myblog.myblog.dao;

import com.td.myblog.myblog.entity.Role;
import com.td.myblog.myblog.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface RoleMapper {

    /**
     * 通过名字查询用户信息
     */
    @Select("SELECT \n" +
            "p.*\n" +
            "FROM `user`  u \n" +
            "LEFT JOIN user_role ur ON ur.user_id = u.id\n" +
            "LEFT JOIN role r ON ur.role_id = r.id \n" +
            "LEFT JOIN role_permission rp ON rp.role_id = r.id\n" +
            "LEFT JOIN permission p ON p.id = rp.permission_id\n" +
            "WHERE u.id = #{id}")
    List<Role> getRolesByUserId(@Param("id") Long id);
}
