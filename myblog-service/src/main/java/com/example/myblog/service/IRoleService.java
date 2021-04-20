package com.example.myblog.service;


import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;
import com.example.myblog.common.modules.dto.input.RoleQueryPara;
import com.example.myblog.entity.Role;

import java.util.List;

/**
 * <p>  系统管理-角色表  服务类 </p>
 *
 * @author: duo.tao
 * @date: 2019-08-20
 */
public interface IRoleService extends IService<Role> {

    /**
     * 系统管理-角色表 列表分页
     *
     * @param page
     * @param filter
     * @return
     */
    void listPage(Page<Role> page, RoleQueryPara filter);

    /**
     * 保存系统管理-角色表
     *
     * @param input
     */
    Integer save(Role input);

    /**
     * 系统管理-角色表 列表
     *
     * @param filter
     * @return
     */
    List<Role> list(RoleQueryPara filter);
}
