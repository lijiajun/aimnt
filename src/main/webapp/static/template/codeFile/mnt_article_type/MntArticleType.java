package com.ai.mnt.model.article;

import java.io.Serializable;
import java.util.Date;

/**
 * @Title: MntArticleType 
 * @Description: MntArticleType Model
 * @Author: Auto Generate.
 * @Date: 2016-7-6
 */
public class MntArticleType implements Serializable{

    private static final long serialVersionUID = 1L;

    /**分类编号*/
    private Integer typeId;

    /**类型名称*/
    private String typeCn;

    /**上级分类*/
    private Integer parentTypeId;


    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public String getTypeCn() {
        return typeCn;
    }

    public void setTypeCn(String typeCn) {
        this.typeCn = typeCn;
    }

    public Integer getParentTypeId() {
        return parentTypeId;
    }

    public void setParentTypeId(Integer parentTypeId) {
        this.parentTypeId = parentTypeId;
    }


}