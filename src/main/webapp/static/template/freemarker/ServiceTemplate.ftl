package com.ai.mnt.service.${module};

import java.util.List;
import com.ai.mnt.model.${module}.${modelName};

/**
 * @Title: ${modelName}Service 
 * @Description: ${modelName}Service ServicePackage
 * @Author: Auto Generate.
 * @Date: ${.now?date}
 */

public interface ${modelName}Service {
    
    /**
     * 获取所有${modelNameCn}列表
     * @return List<${modelName}>
     */
    public List<${modelName}> findAll${modelName}();
    
    
    /**
     * 获取${modelNameCn}列表
     * @param ${module?uncap_first}
     * @return List<${modelName}>
     */
    public List<${modelName}> find${modelName}List(${modelName} ${modelName?uncap_first});
    
    /**
     * 通过主键ID获取${modelNameCn}
     * @param ${pkJavaField} Primary key
     * @return ${modelName}
     */
    public ${modelName} find${modelName}By${pkJavaField?cap_first}(Integer ${pkJavaField});
    
    /**
     * 添加${modelNameCn}
     * @param ${modelName}
     */
    public void save${modelName}(${modelName} ${modelName?uncap_first});
    
    /**
     * 更新${modelNameCn}
     * 根据${modelName}的主键更新主键以外的其他字段
     * @param ${modelName}
     */
    public void update${modelName}By${pkJavaField?cap_first}(${modelName} ${modelName?uncap_first});
    
    /**
     * 根据主键批量删除${modelNameCn} 
     * 非物理删除 修改删除标识
     * @param ${pkJavaField} Primary key
     */
    public void delete${modelName}By${pkJavaField?cap_first}s(String ${pkJavaField}s);
}
