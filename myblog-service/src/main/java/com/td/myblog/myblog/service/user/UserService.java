package com.td.myblog.myblog.service.user;

/*
 *
 * @Company 太美医疗科技
 * @Description:
 * @Author duo.tao
 * @Date 18/07/2019 17:26
 */

import com.td.myblog.myblog.entity.User;

import java.util.List;

public interface UserService {


    User selectUserByName(String name);


    List<User> selectAllUser();

    void deleteService(int id);

    List<User> findByAge(int age);

}
