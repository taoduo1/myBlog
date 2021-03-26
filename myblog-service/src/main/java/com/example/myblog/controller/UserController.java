package com.example.myblog.controller;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.example.myblog.entity.User;
import com.example.myblog.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author duo.tao
 * @since 2021-03-22
 */
@Api(value="用户controller",tags={"用户操作接口"})
@RestController
@RequestMapping("/user")
public class UserController {

    @Resource
    private UserService service;

    @ApiOperation(value = "查询个人信息")
    @GetMapping("/{id}")
    public User getUserInfo(@ApiParam(name="id",value="用户id",required=true) @PathVariable("id") Integer userId) {
        return service.getById(userId);
    }


    @GetMapping("/{name}/{password}")
    public List<User> getUserInfo(@PathVariable("name") String name, @PathVariable("password") String password) {
        return service.finByNameAndPsd(name,password);
    }

    @GetMapping("/finPageByNameAndPsd/{name}/{password}")
    public IPage<User> finPageByNameAndPsd(@PathVariable("name") String name, @PathVariable("password") String password) {
        return service.finPageByNameAndPsd(name,password);
    }



}
