package com.albert.auth.service;

import com.albert.auth.entity.SysMenuEntity;
import com.albert.common.web.result.ApiModel;

import java.util.List;

public interface SysMenuService {
    List<SysMenuEntity> findSysMenu();

    ApiModel<String> deleteSysMenuById(String id);
}
