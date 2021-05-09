package com.example.myblog.common.config.securityconfig.url;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.example.myblog.common.config.Constants;
import com.example.myblog.entity.Permission;
import com.example.myblog.entity.Role;
import com.example.myblog.entity.RolePermission;
import com.example.myblog.mapper.PermissionMapper;
import com.example.myblog.mapper.RoleMapper;
import com.example.myblog.mapper.RolePermissionMapper;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

/**
 * 获取访问该url所需要的用户角色权限信息
 * 执行完之后到 `UrlAccessDecisionManager` 中认证权限
 */
@Component
public class UrlFilterInvocationSecurityMetadataSource implements FilterInvocationSecurityMetadataSource {

    @Resource
    PermissionMapper permissionMapper;
    @Resource
    RolePermissionMapper rolePermissionMapper;
    @Resource
    RoleMapper roleMapper;

    private final List<String> ignoreUrl = Arrays.asList("/login");

    /***
     * 返回该url所需要的用户权限信息
     *
     * @param object: 储存请求url信息
     * @return: null：标识不需要任何权限都可以访问
     */
    @Override
    public Collection<ConfigAttribute> getAttributes(Object object) throws IllegalArgumentException {
        // 获取当前请求url
        String requestUrl = ((FilterInvocation) object).getRequestUrl();
        // 忽略url请放在此处进行过滤放行
        if (ignoreUrl.contains(requestUrl) || requestUrl.contains("swagger") || "logout".contains(requestUrl)) {
            return null;
        }

        // 数据库中所有url
        List<Permission> permissionList = permissionMapper.selectList(null);
        for (Permission permission : permissionList) { // TODO: 2021/5/10 对路径进行校验，只留下干净的URL
            // 获取该url所对应的权限
            if (requestUrl.equals(permission.getUrl())) {
                List<RolePermission> permissions = rolePermissionMapper.selectList(new EntityWrapper<RolePermission>().eq("permission_id", permission.getId()));
                List<String> roles = new LinkedList<>();
                if (!CollectionUtils.isEmpty(permissions)){
                    Integer roleId = permissions.get(0).getRoleId();
                    Role role = roleMapper.selectById(roleId);
                    roles.add(role.getCode());
                }
                // 保存该url对应角色权限信息
                return SecurityConfig.createList(roles.toArray(new String[0]));
            }
        }
        // 如果数据中没有找到相应url资源则为非法访问，要求用户登录再进行操作
        return SecurityConfig.createList(Constants.ROLE_LOGIN);
    }

    @Override
    public Collection<ConfigAttribute> getAllConfigAttributes() {
        return null;
    }

    @Override
    public boolean supports(Class<?> aClass) {
        return FilterInvocation.class.isAssignableFrom(aClass);
    }
}
