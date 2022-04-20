package com.albert.auth.service.impl;

import com.albert.auth.entity.SysMenuEntity;
import com.albert.auth.mapper.SysMenuMapper;
import com.albert.auth.service.SysMenuService;
import com.albert.common.web.result.ApiModel;
import com.albert.common.web.result.ApiStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Objects;

@Service
public class SysMenuServiceImpl implements SysMenuService {
    private SysMenuMapper sysMenuMapper;

    @Autowired
    public void setSysMenuMapper(SysMenuMapper sysMenuMapper) {
        this.sysMenuMapper = sysMenuMapper;
    }

    @Override
    public List<SysMenuEntity> findSysMenu() {
        List<SysMenuEntity> allSysMenu = sysMenuMapper.findSysMenu();
        //根节点
        List<SysMenuEntity> rootSysMenu = new ArrayList<>();
        for (SysMenuEntity nav : allSysMenu) {
            if (Objects.isNull(nav.getPid())) { //根节点
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

    @Override
    public ApiModel<String> deleteSysMenuById(String id) {
        List<SysMenuEntity> sysMenuEntities = sysMenuMapper.findSysMenuByPid(id);
        if (sysMenuEntities.isEmpty()) {
            int i = sysMenuMapper.deleteSysMenuById(id);
            if (i > 0) {
                return ApiModel.ok(ApiStatus.DELETE_SUCCESS);
            } else {
                return ApiModel.fail(ApiStatus.DELETE_FAIL);
            }
        } else {
            return ApiModel.fail("存在子菜单无法删除", ApiStatus.DELETE_FAIL);
        }
    }
}
