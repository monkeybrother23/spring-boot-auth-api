package com.albert.auth.controller;


import com.albert.auth.entity.SysMenuEntity;
import com.albert.auth.model.SysMenuModel;
import com.albert.auth.service.SysMenuService;
import com.albert.common.web.result.ApiModel;
import com.albert.common.web.result.ApiStatus;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotBlank;
import java.util.ArrayList;
import java.util.List;

@Api(tags = "菜单管理")
//@PreAuthorize("hasRole('ROLE_manager')")
@RestController
@RequestMapping(value = "/menu")
@Validated
public class SysMenuController {

    private final Logger logger = LoggerFactory.getLogger(SysMenuController.class);
    private SysMenuService sysMenuService;

    @Autowired
    public void setSysMenuService(SysMenuService sysMenuService) {
        this.sysMenuService = sysMenuService;
    }

    @ApiOperation("查看")
    @GetMapping("/show")
    public ApiModel<ArrayList<SysMenuModel>> findSysMenu() {
        List<SysMenuModel> sysMenuTree = sysMenuService.findSysMenu();
        return ApiModel.ok2(sysMenuTree, ApiStatus.QUERY_SUCCESS);
    }

    @ApiOperation("删除")
    @GetMapping("/delete")
    public ApiModel<String> deleteSysMenuById(@RequestParam @NotBlank String id) {
        return sysMenuService.deleteSysMenuById(id);
    }

    @ApiOperation("新增")
    @PostMapping("/save")
    public ApiModel<String> addSysMenu(@RequestBody SysMenuEntity entity) {
        if (logger.isDebugEnabled()) {
            logger.debug(entity.toString());
        }
        return sysMenuService.addSysMenu(entity);
    }
}
