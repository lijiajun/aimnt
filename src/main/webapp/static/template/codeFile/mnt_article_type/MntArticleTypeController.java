package com.ai.mnt.web.article;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ai.mnt.model.article.MntArticleType;
import com.ai.mnt.service.article.MntArticleTypeService;

/**
 * @Title: MntArticleTypeController 
 * @Description: MntArticleTypeController ControllerPackage
 * @Author: Auto Generate.
 * @Date: 2016-7-6
 */

@Controller
@RequestMapping("/article")
public class MntArticleTypeController {

    @Autowired
    MntArticleTypeService mntArticleTypeService;
    
    /**
     * 运维文章分类界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/type/page")
    public String showMntArticleTypePage(Model model) {
        return "article/type/article_type_query";
    }
    
    /**
     * 获取运维文章分类列表
     * @param mntArticleType
     * @return Map<String, Object>
     */
    @RequestMapping("/type/query")
    @ResponseBody
    public Map<String, Object> getMntArticleTypeList(MntArticleType mntArticleType) {
        List<MntArticleType> mntArticleTypeList = mntArticleTypeService.findMntArticleTypeList(mntArticleType);
        Map<String, Object> map = new HashMap<>();
        map.put("data", mntArticleTypeList);
        map.put("status", "1");
        return map;
    }
    
    /**
     * 运维文章分类新增界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/type/add_page")
    public String showMntArticleTypeAddPage(Model model) {
        return "article/type/article_type_add";
    }
    
    /**
     * 运维文章分类保存
     * @param mntArticleType
     * @return Map<String, Object>
     */
    @RequestMapping("/type/add")
    @ResponseBody
    public Map<String, Object> saveMntArticleType(MntArticleType mntArticleType) {
        mntArticleTypeService.saveMntArticleType(mntArticleType);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 运维文章分类更新界面跳转
     * @param  model
     * @param  typeId
     * @return
     */
    @RequestMapping("/type/update_page/{typeId}")
    public String showMntArticleTypeUpdatePage(Model model, @PathVariable String typeId) {
        MntArticleType mntArticleType = mntArticleTypeService.findMntArticleTypeByTypeId(Integer.parseInt(typeId));
        model.addAttribute("mntArticleType", mntArticleType);
        return "article/type/article_type_update";
    }
    
    /**
     * 运维文章分类根据主键更新
     * @param mntArticleType
     * @return
     */
    @RequestMapping("/type/update")
    @ResponseBody
    public Map<String, Object> updateMntArticleType(MntArticleType mntArticleType) {
        mntArticleTypeService.updateMntArticleTypeByTypeId(mntArticleType);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 运维文章分类根据主键批量删除
     * @param typeIds
     * @return Map<String, Object>
     */
    @RequestMapping("/type/delete/{typeIds}")
    @ResponseBody
    public Map<String, Object> deleteMntArticleTypeByTypeIds(@PathVariable String typeIds) {
        mntArticleTypeService.deleteMntArticleTypeByTypeIds(typeIds);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 根据主键查询运维文章分类详细信息
     * @param model
     * @return
     */
    @RequestMapping("/type/{typeId}/page")
    public String queryMntArticleTypeByTypeId(Model model, @PathVariable String typeId) {
        MntArticleType mntArticleType = new MntArticleType();
        mntArticleType.setTypeId(Integer.parseInt(typeId));
        List<MntArticleType> mntArticleTypeList = mntArticleTypeService.findMntArticleTypeList(mntArticleType);
        if(mntArticleTypeList != null && mntArticleTypeList.size() > 0) { //只会有一条数据
            model.addAttribute("mntArticleType", mntArticleTypeList.get(0));
        }
        return "article/type/article_type_info";
    }
}
