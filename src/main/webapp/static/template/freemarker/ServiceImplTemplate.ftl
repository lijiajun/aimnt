package com.ai.mnt.service.${module}.impl;


import java.util.List;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ai.mnt.common.shiro.UserRealm;
import com.ai.mnt.model.${module}.${modelName};
import com.ai.mnt.model.sys.SysUser;
import com.ai.mnt.persistence.${module}.${modelName}Mapper;
import com.ai.mnt.service.${module}.${modelName}Service;

/**
 * @Title: ${modelName}ServiceImpl 
 * @Description: ${modelName}ServiceImpl ServiceImplPackage
 * @Author: Auto Generate.
 * @Date: ${.now?date}
 */
@Service
public class ${modelName}ServiceImpl implements ${modelName}Service{

    @Autowired
    ${modelName}Mapper ${modelName?uncap_first}Mapper;
    
    @Autowired
    UserRealm userRealm;
    
    /**
     * 获取所有${modelNameCn}列表
     * @return List<${modelName}>
     */
    @Override
    public List<${modelName}> findAll${modelName}() {
        List<${modelName}> ${modelName?uncap_first}List = ${modelName?uncap_first}Mapper.findAll();
        //cvtContentList(${modelName?uncap_first}List);
        return ${modelName?uncap_first}List;
    }

    /**
     * 获取${modelNameCn}列表
     * @param ${module?uncap_first}
     * @return List<${modelName}>
     */
    @Override
    public List<${modelName}> find${modelName}List(${modelName} ${modelName?uncap_first}) {
        List<${modelName}> ${modelName?uncap_first}List = ${modelName?uncap_first}Mapper.findList(${modelName?uncap_first});
        //cvtContentList(${modelName?uncap_first}List);
        return ${modelName?uncap_first}List;
    }

    /**
     * 通过主键ID获取${modelNameCn}
     * @param ${pkJavaField} Primary key
     * @return ${modelName}
     */
    @Override
    public ${modelName} find${modelName}By${pkJavaField?cap_first}(Integer ${pkJavaField}) {
        ${modelName} ${modelName?uncap_first} = ${modelName?uncap_first}Mapper.findByPrimaryKey(${pkJavaField});
        return ${modelName?uncap_first};
    }

    /**
     * 添加${modelNameCn}
     * @param ${modelName}
     */
    @Override
    public void save${modelName}(${modelName} ${modelName?uncap_first}) {
        SysUser currentUser = userRealm.getCurrentUser();
        ${modelName?uncap_first}.setDeleteFlag("0");
        ${modelName?uncap_first}.setCreator(currentUser.getUserName());
        ${modelName?uncap_first}.setModifier(currentUser.getUserName());
        ${modelName?uncap_first}.setCreateDate(new Date());
        ${modelName?uncap_first}.setModifyDate(new Date());
        ${modelName?uncap_first}Mapper.save(${modelName?uncap_first});
        
    }

    /**
     * 更新${modelNameCn}
     * 根据${modelName}的主键更新主键以外的其他字段
     * @param ${modelName}
     */
    @Override
    public void update${modelName}By${pkJavaField?cap_first}(${modelName} ${modelName?uncap_first}) {
        SysUser currentUser = userRealm.getCurrentUser();
        ${modelName?uncap_first}.setModifier(currentUser.getUserName());
        ${modelName?uncap_first}.setModifyDate(new Date());
        ${modelName?uncap_first}Mapper.updateByPrimaryKey(${modelName?uncap_first});
        
    }

    /**
     * 根据主键批量删除${modelNameCn} 
     * 非物理删除 修改删除标识
     * @param ${pkJavaField} Primary key
     */
    @Override
    public void delete${modelName}By${pkJavaField?cap_first}s(String ${pkJavaField}s) {
        SysUser currentUser = userRealm.getCurrentUser();
        ${modelName} ${modelName?uncap_first} = new ${modelName}();
        ${modelName?uncap_first}.setDeleteFlag("1");
        ${modelName?uncap_first}.setModifier(currentUser.getUserName());
        ${modelName?uncap_first}.setModifyDate(new Date());
        String[] ${pkJavaField}Ary = ${pkJavaField}s.split(",");
        for(String ${pkJavaField} : ${pkJavaField}Ary) {
            ${modelName?uncap_first}.set${pkJavaField?cap_first}(Integer.parseInt(${pkJavaField}));
            ${modelName?uncap_first}Mapper.updateByPrimaryKey(${modelName?uncap_first});
        }
    }
    
    //private void cvtContentList(List<${modelName}> ${modelName}List) {
    //    for(${modelName} ${modelName?uncap_first} : ${modelName}List) {
    //    }
    //}
}

