package com.albert.auth.controller;


import com.albert.auth.entity.SysMenuEntity;
import com.albert.auth.param.SysMenuParam;
import com.albert.auth.service.SysMenuService;
import com.albert.common.web.result.ApiModel;
import com.albert.common.web.result.ApiStatus;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Api(tags = "菜单管理")
@RestController
@RequestMapping(value = "/menu")
public class SysMenuController {

    private final Logger logger = LoggerFactory.getLogger(SysMenuController.class);
    private SysMenuService sysMenuService;

    @Autowired
    public void setSysMenuService(SysMenuService sysMenuService) {
        this.sysMenuService = sysMenuService;
    }

    @ApiOperation("test")
    @PreAuthorize("hasAuthority('test')")
    @GetMapping("/all")
    public ApiModel<ArrayList<SysMenuEntity>> findSysMenuTree(/*@RequestParam("a") String a*/) {
        List<SysMenuEntity> sysMenuTree = sysMenuService.findSysMenuTree();
        return ApiModel.ok2(sysMenuTree, ApiStatus.SUCCESS);
    }

    @ApiOperation("ROLE_test")
    @PreAuthorize("hasRole('ROLE_test')")
    @GetMapping("/date")
    public ApiModel<LocalDateTime> dateTest() {
        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter pattern = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String format = pattern.format(now);
        if (logger.isDebugEnabled()) {
            logger.debug(format);
        }
        LocalDateTime dateTime = LocalDateTime.parse(format, pattern);
        if (logger.isDebugEnabled()) {
            logger.debug(dateTime.toString());
        }
        return ApiModel.ok(now, ApiStatus.SUCCESS);
    }

    @ApiOperation("demo:read")
    @PreAuthorize("hasAuthority('demo:read')")
    @GetMapping("/param")
    public ApiModel<ArrayList<SysMenuEntity>> findAllByEntity(@Validated SysMenuParam param) {
        //List<SysMenuEntity> sysMenuTree = sysMenuService.findAllByEntity(param);
        return ApiModel.ok2(Collections.emptyList(), ApiStatus.SUCCESS);
    }

    @GetMapping("/test2")
    public ApiModel<LocalDateTime> test02() {
        LocalDateTime now = LocalDateTime.now();
        return ApiModel.ok(now, ApiStatus.SUCCESS);
    }
}
