package com.albert.auth.service.impl;

import com.albert.auth.entity.SysMenuEntity;
import com.albert.auth.mapper.SysMenuMapper;
import com.albert.auth.service.SysMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service
public class SysMenuServiceImpl implements SysMenuService {
    private SysMenuMapper sysMenuMapper;

    @Autowired
    public void setSysMenuMapper(SysMenuMapper sysMenuMapper) {
        this.sysMenuMapper = sysMenuMapper;
    }

    @Override
    public List<SysMenuEntity> findSysMenuTree() {
        List<SysMenuEntity> allSysMenu = sysMenuMapper.findAll();
        //根节点
        List<SysMenuEntity> rootSysMenu = new ArrayList<>();
        for (SysMenuEntity nav : allSysMenu) {
            if (StringUtils.hasText(nav.getPid())) { //父节点是0的，为根节点。
                rootSysMenu.add(nav);
            }
        }
        //为根菜单设置子菜单 getChild是递归调用的
        for (SysMenuEntity nav : rootSysMenu) {
            /* 获取根节点下的所有子节点 使用getChild方法*/
            List<SysMenuEntity> childList = getChild(nav.getId(), allSysMenu);
            nav.setChildren(childList);//给根节点设置子节点
        }
        rootSysMenu.sort(((o1, o2) -> {
            if (o1.getOrderNo() != o2.getOrderNo()) {
                return o1.getOrderNo() - o2.getOrderNo();
            }
            return 0;
        }));
        return rootSysMenu;
    }


    /**
     * 获取子节点
     *
     * @param id         父节点id
     * @param allSysMenu 所有菜单列表
     * @return 每个根节点下，所有子菜单列表
     */
    private List<SysMenuEntity> getChild(String id, List<SysMenuEntity> allSysMenu) {
        //子菜单
        List<SysMenuEntity> childList = new ArrayList<>();
        for (SysMenuEntity temp : allSysMenu) {
            // 遍历所有节点，将所有菜单的父id与传过来的根节点的id比较
            //相等说明：为该根节点的子节点。
            if (id.equals(temp.getPid())) {
                childList.add(temp);
            }
        }
        //如果节点下没有子节点，返回一个空List（递归退出）
        if (childList.isEmpty()) {
            return Collections.emptyList();
        }
        //递归
        for (SysMenuEntity nav : childList) {
            nav.setChildren(getChild(nav.getId(), allSysMenu));
        }
        return childList;
    }

}
