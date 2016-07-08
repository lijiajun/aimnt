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

import com.ai.mnt.model.article.MntArticleComment;
import com.ai.mnt.service.article.MntArticleCommentService;

/**
 * @Title: MntArticleCommentController 
 * @Description: MntArticleCommentController ControllerPackage
 * @Author: Auto Generate.
 * @Date: 2016-7-6
 */

@Controller
@RequestMapping("/article")
public class MntArticleCommentController {

    @Autowired
    MntArticleCommentService mntArticleCommentService;
    
    /**
     * 文章评论界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/comment/page")
    public String showMntArticleCommentPage(Model model) {
        return "article/comment/article_comment_query";
    }
    
    /**
     * 获取文章评论列表
     * @param mntArticleComment
     * @return Map<String, Object>
     */
    @RequestMapping("/comment/query")
    @ResponseBody
    public Map<String, Object> getMntArticleCommentList(MntArticleComment mntArticleComment) {
        List<MntArticleComment> mntArticleCommentList = mntArticleCommentService.findMntArticleCommentList(mntArticleComment);
        Map<String, Object> map = new HashMap<>();
        map.put("data", mntArticleCommentList);
        map.put("status", "1");
        return map;
    }
    
    /**
     * 文章评论新增界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/comment/add_page")
    public String showMntArticleCommentAddPage(Model model) {
        return "article/comment/article_comment_add";
    }
    
    /**
     * 文章评论保存
     * @param mntArticleComment
     * @return Map<String, Object>
     */
    @RequestMapping("/comment/add")
    @ResponseBody
    public Map<String, Object> saveMntArticleComment(MntArticleComment mntArticleComment) {
        mntArticleCommentService.saveMntArticleComment(mntArticleComment);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 文章评论更新界面跳转
     * @param  model
     * @param  commentId
     * @return
     */
    @RequestMapping("/comment/update_page/{commentId}")
    public String showMntArticleCommentUpdatePage(Model model, @PathVariable String commentId) {
        MntArticleComment mntArticleComment = mntArticleCommentService.findMntArticleCommentByCommentId(Integer.parseInt(commentId));
        model.addAttribute("mntArticleComment", mntArticleComment);
        return "article/comment/article_comment_update";
    }
    
    /**
     * 文章评论根据主键更新
     * @param mntArticleComment
     * @return
     */
    @RequestMapping("/comment/update")
    @ResponseBody
    public Map<String, Object> updateMntArticleComment(MntArticleComment mntArticleComment) {
        mntArticleCommentService.updateMntArticleCommentByCommentId(mntArticleComment);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 文章评论根据主键批量删除
     * @param commentIds
     * @return Map<String, Object>
     */
    @RequestMapping("/comment/delete/{commentIds}")
    @ResponseBody
    public Map<String, Object> deleteMntArticleCommentByCommentIds(@PathVariable String commentIds) {
        mntArticleCommentService.deleteMntArticleCommentByCommentIds(commentIds);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 根据主键查询文章评论详细信息
     * @param model
     * @return
     */
    @RequestMapping("/comment/{commentId}/page")
    public String queryMntArticleCommentByCommentId(Model model, @PathVariable String commentId) {
        MntArticleComment mntArticleComment = new MntArticleComment();
        mntArticleComment.setCommentId(Integer.parseInt(commentId));
        List<MntArticleComment> mntArticleCommentList = mntArticleCommentService.findMntArticleCommentList(mntArticleComment);
        if(mntArticleCommentList != null && mntArticleCommentList.size() > 0) { //只会有一条数据
            model.addAttribute("mntArticleComment", mntArticleCommentList.get(0));
        }
        return "article/comment/article_comment_info";
    }
}
