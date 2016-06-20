package com.ai.mnt.model.${module};

import java.io.Serializable;
import java.util.Date;

/**
 * @Title: ${modelName} 
 * @Description: ${modelName} Model
 * @Author: Auto Generate.
 * @Date: ${.now?date}
 */
public class ${modelName} implements Serializable{

    private static final long serialVersionUID = 1L;

<#list columns as column> 
    /**${column.columnComment}*/
    private ${column.javaType} ${column.javaField};

</#list> 

<#list columns as column> 
    public ${column.javaType} get${column.javaField?cap_first}() {
        return ${column.javaField};
    }

    public void set${column.javaField?cap_first}(${column.javaType} ${column.javaField}) {
        this.${column.javaField} = ${column.javaField};
    }

</#list> 

}