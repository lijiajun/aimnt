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

import com.ai.mnt.model.article.MntArticle;
import com.ai.mnt.service.article.MntArticleService;

/**
 * @Title: MntArticleController 
 * @Description: MntArticleController ControllerPackage
 * @Author: Auto Generate.
 * @Date: 2016-6-27
 */

@Controller
@RequestMapping("/article")
public class MntArticleController {

    @Autowired
    MntArticleService mntArticleService;
    
    /**
     * 运维文章界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/posts/page")
    public String showMntArticlePage(Model model) {
        return "article/posts/article_posts_query";
    }
    
    /**
     * 获取运维文章列表
     * @param mntArticle
     * @return Map<String, Object>
     */
    @RequestMapping("/posts/query")
    @ResponseBody
    public Map<String, Object> getMntArticleList(MntArticle mntArticle) {
        List<MntArticle> mntArticleList = mntArticleService.findMntArticleList(mntArticle);
        Map<String, Object> map = new HashMap<>();
        map.put("data", mntArticleList);
        map.put("status", "1");
        return map;
    }
    
    /**
     * 运维文章新增界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/posts/add_page")
    public String showMntArticleAddPage(Model model) {
        return "article/posts/article_posts_add";
    }
    
    /**
     * 运维文章保存
     * @param mntArticle
     * @return Map<String, Object>
     */
    @RequestMapping("/posts/add")
    @ResponseBody
    public Map<String, Object> saveMntArticle(MntArticle mntArticle) {
        mntArticleService.saveMntArticle(mntArticle);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 运维文章更新界面跳转
     * @param  model
     * @param  id
     * @return
     */
    @RequestMapping("/posts/update_page/{id}")
    public String showMntArticleUpdatePage(Model model, @PathVariable String id) {
        MntArticle mntArticle = mntArticleService.findMntArticleById(Integer.parseInt(id));
        model.addAttribute("mntArticle", mntArticle);
        return "article/posts/article_posts_update";
    }
    
    /**
     * 运维文章根据主键更新
     * @param mntArticle
     * @return
     */
    @RequestMapping("/posts/update")
    @ResponseBody
    public Map<String, Object> updateMntArticle(MntArticle mntArticle) {
        mntArticleService.updateMntArticleById(mntArticle);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 运维文章根据主键批量删除
     * @param ids
     * @return Map<String, Object>
     */
    @RequestMapping("/posts/delete/{ids}")
    @ResponseBody
    public Map<String, Object> deleteMntArticleByIds(@PathVariable String ids) {
        mntArticleService.deleteMntArticleByIds(ids);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 根据主键查询运维文章详细信息
     * @param model
     * @return
     */
    @RequestMapping("/posts/{id}/page")
    public String queryMntArticleById(Model model, @PathVariable String id) {
        MntArticle mntArticle = new MntArticle();
        mntArticle.setId(Integer.parseInt(id));
        List<MntArticle> mntArticleList = mntArticleService.findMntArticleList(mntArticle);
        if(mntArticleList != null && mntArticleList.size() > 0) { //只会有一条数据
            model.addAttribute("mntArticle", mntArticleList.get(0));
        }
        return "article/posts/article_posts_info";
    }
}
