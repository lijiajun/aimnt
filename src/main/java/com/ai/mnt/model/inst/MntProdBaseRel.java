package com.ai.mnt.model.inst;

import java.io.Serializable;

/**
 * @Title: MntProdBaseRel 
 * @Description: MntProdBaseRel Model
 * @Author: Auto Generate.
 * @Date: 2016-10-13
 */
public class MntProdBaseRel implements Serializable{

    private static final long serialVersionUID = 1L;

    /**序号*/
    private Integer id;

    /**产品编号*/
    private Integer prodId;

    /**安装点编号*/
    private Integer baseId;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getProdId() {
        return prodId;
    }

    public void setProdId(Integer prodId) {
        this.prodId = prodId;
    }

    public Integer getBaseId() {
        return baseId;
    }

    public void setBaseId(Integer baseId) {
        this.baseId = baseId;
    }


}