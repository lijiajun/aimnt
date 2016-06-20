package com.ai.mnt.persistence.${module};


import org.springframework.stereotype.Repository;

import com.ai.mnt.model.${module}.${modelName};
import com.ai.mnt.persistence.base.CrudMapper;

/**
 * @Title: ${modelName}Mapper 
 * @Description: ${modelName}Mapper Persistence
 * @Author: Auto Generate. HE
 * @Date: ${.now?date}
 */
@Repository
public interface ${modelName}Mapper extends CrudMapper<${modelName}, ${dataType}>{
    
    
}