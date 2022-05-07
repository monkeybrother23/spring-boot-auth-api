package com.albert.auth.service.impl;

import com.albert.auth.entity.SysAuthorityEntity;
import com.albert.auth.mapper.SysAuthorityMapper;
import com.albert.auth.service.SysAuthorityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SysAuthorityServiceImpl implements SysAuthorityService {
    private SysAuthorityMapper sysAuthorityMapper;

    @Autowired
    public void setSysAuthorityMapper(SysAuthorityMapper sysAuthorityMapper) {
        this.sysAuthorityMapper = sysAuthorityMapper;
    }

    @Override
    public List<SysAuthorityEntity> findSysAuthority() {
        return sysAuthorityMapper.findSysAuthority();
    }
}
