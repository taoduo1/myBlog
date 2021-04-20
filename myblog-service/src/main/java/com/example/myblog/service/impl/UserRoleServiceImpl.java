package com.example.myblog.service.impl;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.example.myblog.common.modules.dto.input.UserRoleQueryPara;
import com.example.myblog.entity.UserRole;
import com.example.myblog.mapper.UserRoleMapper;
import com.example.myblog.service.IUserRoleService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p> 系统管理 - 用户角色关联表  服务实现类 </p>
 *
 * @author: duo.tao
 * @date: 2019-08-20
 */
@Service
@Transactional
public class UserRoleServiceImpl extends ServiceImpl<UserRoleMapper, UserRole> implements IUserRoleService {

    @Resource
    UserRoleMapper userRoleMapper;

    @Override
    public void listPage(Page<UserRole> page, UserRoleQueryPara filter) {
        page.setRecords(userRoleMapper.selectUserRoles(page, filter));
    }

    @Override
    public List<UserRole> list(UserRoleQueryPara filter) {
        return userRoleMapper.selectUserRoles(filter);
    }

    @Override
    public Integer save(UserRole para) {
        if (para.getId()!=null) {
            userRoleMapper.updateById(para);
        } else {
            userRoleMapper.insert(para);
        }
        return para.getId();
    }

    @Override
    public void saveUserRole(UserRoleQueryPara para) {
        Integer roleId = para.getRoleId();
        String userIds = para.getUserIds();
        userRoleMapper.deleteByRoleId( roleId );
        if( StringUtils.isNotBlank( userIds ) ){
            String[] userIdArrays = userIds.split( "," );
            if( userIdArrays.length > 0 ){
                for (String userId : userIdArrays) {
                    UserRole userRole = new UserRole();
                    userRole.setRoleId( roleId );
                    userRole.setUserId( Integer.parseInt( userId ) );
                    userRoleMapper.insert( userRole );
                }
            }
        }
    }

}
