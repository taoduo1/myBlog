package com.example.myblog.common.modules.dto.output;

import com.example.myblog.entity.User;
import com.google.common.collect.Lists;
import lombok.Data;

import java.util.List;

/**
 *  <p> 用户树节点 </p>
 *
 * @description :
 * @author : duo.tao
 * @date : 2019/8/20 19:16
 */
@Data
public class UserTreeNode extends User {

    List<UserTreeNode> children = Lists.newArrayList();

}
