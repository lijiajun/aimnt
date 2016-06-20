package com.ai.mnt.model.sys;

/**
 * @Title: SysResource
 * @Description: SysResource Model
 * @Author: Auto Generate
 * @Date: 2016-4-24
 */
public class SysResourceTree {

    /** 资源编号 */
    private Integer id;

    /** 父节点资源编号 */
    private String parent;
    
    /** 资源名称 */
    private String text;
    
    private State state = new State();
    

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getParent() {
        return parent;
    }

    public void setParent(String parent) {
        this.parent = parent;
    }

    public State getState() {
        return state;
    }

    public void setState(State state) {
        this.state = state;
    }

}