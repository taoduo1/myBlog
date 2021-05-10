package com.example.myblog.controller;


import com.example.myblog.common.api.BaseController;
import com.example.myblog.common.resultdto.ApiResult;
import com.example.myblog.entity.User;
import com.example.myblog.service.UserService;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;

/**
 * <p>
 * 用户表 前端控制器
 * </p>
 *
 * @author duo.tao
 * @since 2021-05-05
 */
@RestController
@RequestMapping("/user")
public class UserController extends BaseController {

    @Resource
    private UserService userService;

    @ApiOperation(value = "获取用户信息")
    @GetMapping(value = "/get/{id}")
    public ApiResult get(@PathVariable Integer id) {
        return new ApiResult(userService.selectById(id));
    }

    @PostMapping(value = "/save")
    public ApiResult save(@Valid @RequestBody User user) {
        return new ApiResult(userService.insert(user));
    }

}