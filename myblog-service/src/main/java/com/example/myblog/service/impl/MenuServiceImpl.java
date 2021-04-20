package com.example.myblog.service.impl;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.example.myblog.common.modules.dto.input.MenuQueryPara;
import com.example.myblog.entity.Menu;
import com.example.myblog.mapper.MenuMapper;
import com.example.myblog.service.IMenuService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p> 系统管理-菜单表  服务实现类 </p>
 *
 * @author: duo.tao
 * @date: 2019-08-19
 */
@Service
@Transactional
public class MenuServiceImpl extends ServiceImpl<MenuMapper, Menu> implements IMenuService {

    @Resource
    MenuMapper menuMapper;

    @Override
    public List <Menu> listTreeMenu() {
        return menuMapper.selectList(null);
    }

    @Override
    public void listPage(Page<Menu> page, MenuQueryPara filter) {
        page.setRecords(menuMapper.selectMenus(page, filter));
    }

    @Override
    public List<Menu> list(MenuQueryPara filter) {
        return menuMapper.selectMenus(filter);
    }

    @Override
    public Integer save(Menu para) {
        if (para.getId()!=null) {
            menuMapper.updateById(para);
        } else {
            menuMapper.insert(para);
        }
        return para.getId();
    }

}
