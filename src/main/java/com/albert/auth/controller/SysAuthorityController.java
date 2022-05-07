package com.albert.auth.controller;


import com.albert.auth.entity.SysAuthorityEntity;
import com.albert.auth.service.SysAuthorityService;
import com.albert.common.web.result.ApiModel;
import com.albert.common.web.result.ApiStatus;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@Api(tags = "Authority管理")
//@PreAuthorize("hasRole('ROLE_manager')")
@RestController
@RequestMapping(value = "/Authority")
@Validated
public class SysAuthorityController {

    //private final Logger logger = LoggerFactory.getLogger(SysAuthorityController.class);
    private SysAuthorityService sysAuthorityService;

    @Autowired
    public void setSysAuthorityService(SysAuthorityService sysAuthorityService) {
        this.sysAuthorityService = sysAuthorityService;
    }


    @ApiOperation("查看")
    @GetMapping("/findAll")
    public ApiModel<ArrayList<SysAuthorityEntity>> findSysMenu() {
        List<SysAuthorityEntity> sysAuthority = sysAuthorityService.findSysAuthority();
        return ApiModel.ok(sysAuthority, ApiStatus.QUERY_SUCCESS);
    }
}
