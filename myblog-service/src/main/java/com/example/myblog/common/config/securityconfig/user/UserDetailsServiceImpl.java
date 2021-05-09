package com.example.myblog.common.config.securityconfig.user;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.example.myblog.common.config.securityconfig.dto.SecurityUser;
import com.example.myblog.common.utils.DataUtil;
import com.example.myblog.entity.Role;
import com.example.myblog.entity.User;
import com.example.myblog.entity.UserRole;
import com.example.myblog.service.RoleService;
import com.example.myblog.service.UserRoleService;
import com.example.myblog.service.UserService;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/***
 * 认证用户类，此处查询用户密码是否匹配
 */
@Service("userDetailsService")
public class UserDetailsServiceImpl implements UserDetailsService {

    @Resource
    private UserService userService;
    @Resource
    private UserRoleService userRoleService;
    @Resource
    private RoleService roleService;

    /***
     * 根据账号获取用户信息
     * @param username:
     * @return: org.springframework.security.core.userdetails.UserDetails
     */
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        // 从数据库中取出用户信息
        List<User> userList = userService.selectList(new EntityWrapper<User>().eq("name", username));
        User user;
        // 判断用户是否存在
        if (!CollectionUtils.isEmpty(userList)) {
            user = userList.get(0);
        } else {
            throw new UsernameNotFoundException("用户名不存在！");
        }
        // 返回UserDetails实现类
        return new SecurityUser(user);
    }

    public User findById(Integer id) {
        return userService.selectById(id);
    }

    /***
     * 根据token获取用户权限与基本信息
     *
     */
    public SecurityUser getUserByToken(String token) {
        User user = userService.getUserContext(token);
        return user != null ? new SecurityUser(user, getUserRoles(user.getId()),token) : null;
    }


    /**
     * 根据用户id获取角色权限信息
     *
     * @param userId id
     * @return 权限列表
     */
    private List<Role> getUserRoles(Integer userId) {
        List<UserRole> userRoles = userRoleService.selectList(new EntityWrapper<UserRole>().eq("user_id", userId));
        if (DataUtil.isNullOrEmpty(userRoles)) return new ArrayList<>();
        return roleService.selectList(new EntityWrapper<Role>().in("id",userRoles.stream().map(UserRole::getRoleId).collect(Collectors.toList())));
    }




}
