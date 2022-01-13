package com.albert.auth.mapper;

import com.albert.auth.entity.SysMenuEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author Albert
 */
@Mapper
public interface SysMenuMapper {
    List<SysMenuEntity> findAll();
}
