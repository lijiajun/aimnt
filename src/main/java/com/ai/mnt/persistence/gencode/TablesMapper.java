package com.ai.mnt.persistence.gencode;


import org.springframework.stereotype.Repository;

import com.ai.mnt.model.gencode.Tables;
import com.ai.mnt.persistence.base.CrudMapper;

/**
 * @Title: TablesMapper 
 * @Description: TablesMapper Persistence
 * @Author: Auto Generate 
 * @Date: 2016-5-10
 */
@Repository
public interface TablesMapper extends CrudMapper<Tables, Integer>{
    
    
    public Tables findTablesBySchemaAndTableName(Tables tables);
    
}