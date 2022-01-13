package com.albert.auth.service;

import com.albert.auth.entity.SysMenuEntity;

import java.util.List;

public interface SysMenuService {
    List<SysMenuEntity> findSysMenuTree();
}
