package com.example.myblog.common.config.securityconfig.dto;


import com.example.myblog.entity.Role;
import com.example.myblog.entity.User;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.StringJoiner;

/**
 * 安全认证用户详情信息
 */
@Data
@Slf4j
public class SecurityUser implements UserDetails {
    /**
     * 当前登录用户
     */
    private transient User currentUserInfo;
    /**
     * 角色
     */
    private transient List<Role> roleList;

    /**
     * 当前用户所拥有角色代码
     */
    private transient String roleCodes;

    private String jwtToken;

    public SecurityUser() { }

    public SecurityUser(User user) {
        if (user != null) {
            this.currentUserInfo = user;
        }
    }

    public SecurityUser(User user, List<Role> roleList,String jwtToken) {
        if (user != null) {
            this.currentUserInfo = user;
            this.roleList = roleList;
            this.jwtToken = jwtToken;
            if (!CollectionUtils.isEmpty(roleList)){
                StringJoiner roleCodes = new StringJoiner(",", "[", "]");
                roleList.forEach(e -> roleCodes.add(e.getCode()));
                this.roleCodes = roleCodes.toString();
            }
        }
    }

    /**
     * 获取当前用户所具有的角色
     *
     * @return
     */
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        Collection<GrantedAuthority> authorities = new ArrayList<>();
        if (!CollectionUtils.isEmpty(this.roleList)) {
            for (Role role : this.roleList) {
                SimpleGrantedAuthority authority = new SimpleGrantedAuthority(role.getCode());
                authorities.add(authority);
            }
        }
        return authorities;
    }

    @Override
    public String getPassword() {
        return currentUserInfo.getPassword();
    }

    @Override
    public String getUsername() {
        return currentUserInfo.getName();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }
}
