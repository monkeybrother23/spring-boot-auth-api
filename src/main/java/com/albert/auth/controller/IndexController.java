package com.albert.auth.controller;


import com.albert.auth.entity.SysMenuEntity;
import com.albert.auth.param.SysMenuParam;
import com.albert.common.web.result.ApiModel;
import com.albert.common.web.result.ApiStatus;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;

//@Tag(name = "页面初始化")
@RestController
@RequestMapping("/index")
public class IndexController {
    private final Logger logger = LoggerFactory.getLogger(IndexController.class);

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
