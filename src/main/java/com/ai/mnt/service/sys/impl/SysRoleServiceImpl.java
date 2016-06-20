package com.ai.mnt.service.sys.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ai.mnt.common.cache.BaseDataCache;
import com.ai.mnt.common.shiro.UserRealm;
import com.ai.mnt.model.sys.SysResource;
import com.ai.mnt.model.sys.SysResourceTree;
import com.ai.mnt.model.sys.SysRole;
import com.ai.mnt.model.sys.SysRoleRes;
import com.ai.mnt.model.sys.SysUser;
import com.ai.mnt.model.sys.SysUserRole;
import com.ai.mnt.persistence.sys.SysRoleMapper;
import com.ai.mnt.persistence.sys.SysRoleResMapper;
import com.ai.mnt.persistence.sys.SysUserRoleMapper;
import com.ai.mnt.service.sys.SysResourceService;
import com.ai.mnt.service.sys.SysRoleService;

@Service
public class SysRoleServiceImpl implements SysRoleService {

    @Autowired
    SysRoleMapper sysRoleMapper;
    
    @Autowired
    public SysResourceService sysResourceService;
    
    @Autowired
    SysRoleResMapper sysRoleResMapper;
    
    @Autowired
    UserRealm userRealm;
    
    @Autowired
    SysUserRoleMapper sysUserRoleMapper;
    
    /**
     * 通过ID获取角色
     * @return
     */
    @Override
    public SysRole findRoleById(Integer roleId) {
        SysRole sysRole = sysRoleMapper.findByPrimaryKey(roleId);
        return sysRole;
    }

    /**
     * 获取所有角色
     * @return
     */
    @Override
    public List<SysRole> findAllRole() {
        List<SysRole> list = sysRoleMapper.findAll();
        return list;
    }

    /**
     * 获取角色列表
     * @return
     */
    @Override
    public List<SysRole> findRoleList(SysRole sysRole) {
        List<SysRole> list = sysRoleMapper.findList(sysRole);
        cvtContentList(list);
        return list;
    }

    
    /**
     * 获取角色资源树
     * @return
     */
    @Override
    public List<SysResourceTree> getRoleResTree(SysRole sysRole) {
        
        SysResource sysResource = new SysResource();
        sysResource.setResSts("1");
        List<SysResource> sysResourceList = sysResourceService.findAllSysResource(sysResource);
        
        if(sysResourceList == null) {
            return null;
        }
        //角色资源列表
        List<SysResource> roleResList = sysResourceService.findResListByRoleId(sysRole.getRoleId());
        
        List<SysResourceTree> treelist = new ArrayList<>();
        for(SysResource temp : sysResourceList) {
            SysResourceTree tree = new SysResourceTree();
            tree.setId(temp.getResId());
            tree.setText(temp.getResName());
            tree.setParent(temp.getParentId().toString());
            
            for(SysResource roleRes : roleResList) {
                if(roleRes.getResId() == temp.getResId()) {
                    tree.getState().setSelected(true);
                }
            }
            treelist.add(tree);
        }
        //自定义根节点
        SysResourceTree rootNode = new SysResourceTree();
        rootNode.setId(-1);
        rootNode.setText("运维平台资源");
        rootNode.setParent("#");
        treelist.add(rootNode);
        
        return treelist;
    }
    
    private void cvtContentList(List<SysRole> sysRoleList) {
        for(SysRole sysRole : sysRoleList) {
            sysRole.setRoleStsTxt(BaseDataCache.getDataName("ROLE_STS", sysRole.getRoleSts()));
        }
    }

    @Override
    public void saveSysRoleAndRes(SysRole sysRole, String resIds) {
        //保存角色
        SysUser currentUser = userRealm.getCurrentUser();
        sysRole.setCreator(currentUser.getUserName());
        sysRole.setCreateDate(new Date());
        sysRole.setModifier(currentUser.getUserName());
        sysRole.setModifyDate(new Date());
        sysRoleMapper.save(sysRole);
        //保存角色资源
        if(resIds != null && !"none".equals(resIds)) {
            String[] resIdAry = resIds.split(",");
            List<SysRoleRes> sysRoleResList = new ArrayList<>();
            for(String resId : resIdAry) {
                SysRoleRes sysRoleRes = new SysRoleRes();
                sysRoleRes.setResId(Integer.parseInt(resId));
                sysRoleRes.setRoleId(sysRole.getRoleId());
                sysRoleResList.add(sysRoleRes);
            }
            sysRoleResMapper.saveAll(sysRoleResList);
        }
    }

    /**
     * 更新角色及其资源
     * @param sysRole
     * @param resIds
     */
    @Override
    public void updateSysRoleAndRes(SysRole sysRole, String resIds) {
        SysUser currentUser = userRealm.getCurrentUser();
        sysRole.setModifier(currentUser.getUserName());
        sysRole.setModifyDate(new Date());
        sysRoleMapper.updateByPrimaryKey(sysRole);
        
        //先删出原有的映射数据
        SysRoleRes sysRoleRes = new SysRoleRes();
        sysRoleRes.setRoleId(sysRole.getRoleId());
        sysRoleResMapper.deleteSysRoleRes(sysRoleRes);
        //保存新的角色资源
        if(resIds != null && !"none".equals(resIds)) {
            String[] resIdAry = resIds.split(",");
            List<SysRoleRes> sysRoleResList = new ArrayList<>();
            for(String resId : resIdAry) {
                SysRoleRes sysRoleResNew = new SysRoleRes();
                sysRoleResNew.setResId(Integer.parseInt(resId));
                sysRoleResNew.setRoleId(sysRole.getRoleId());
                sysRoleResList.add(sysRoleResNew);
            }
            sysRoleResMapper.saveAll(sysRoleResList);
        }
    }

    /**
     * 删除角色及其资源映射
     * @return
     */
    @Override
    public void deleteSysRoleAndRes(String roleIds) {
        String[] roleIdAry = roleIds.split(",");
        for(String roleId : roleIdAry) {
            sysRoleMapper.deleteByPrimaryKey(Integer.parseInt(roleId));
            SysRoleRes sysRoleRes = new SysRoleRes();
            sysRoleRes.setRoleId(Integer.parseInt(roleId));
            sysRoleResMapper.deleteSysRoleRes(sysRoleRes);
        }
    }

    @Override
    public SysRole findRoleByUserId(Integer userId) {
        SysUserRole SysUserRole  = new SysUserRole();
        SysUserRole.setUserId(userId);
        List<SysUserRole> findList = sysUserRoleMapper.findList(SysUserRole);
        SysRole sysRole = new SysRole();
        if(findList != null && findList.size() > 0) {
            sysRole = findRoleById(findList.get(0).getRoleId());
        }
        return sysRole;
    }
}
