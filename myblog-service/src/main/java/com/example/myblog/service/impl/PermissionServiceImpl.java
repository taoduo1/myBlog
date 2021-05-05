package com.example.myblog.service.impl;

import com.example.myblog.entity.Permission;
import com.example.myblog.mapper.PermissionMapper;
import com.example.myblog.service.PermissionService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 权限表 服务实现类
 * </p>
 *
 * @author duo.tao
 * @since 2021-05-05
 */
@Service
public class PermissionServiceImpl extends ServiceImpl<PermissionMapper, Permission> implements PermissionService {

}
