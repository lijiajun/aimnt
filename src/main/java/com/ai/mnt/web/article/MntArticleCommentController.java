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
    @RequestMapping("/comment/page{}")
    @ResponseBody
    public String showMntArticleCommentPage(Model model,MntArticleComment mntArticleComment) {
        if(mntArticleComment.getCurrentPage() != 1) {
            int start = (mntArticleComment.getCurrentPage() -1) * mntArticleComment.getPageSize();
            mntArticleComment.setStart(start);
        }
        
        List<MntArticleComment> mntArticleCommentList=mntArticleCommentService.findMntArticleCommentListPagination(mntArticleComment);
        long totalCount = mntArticleCommentService.getMntArticleTotalCount(mntArticleComment);
        mntArticleComment.setTotalCount(totalCount);                       //本篇文章总评论数
        
        long totalPage = totalCount / mntArticleComment.getPageSize();
        int mod = (int) (totalCount % mntArticleComment.getPageSize());
        totalPage = mod == 0 ? totalPage : totalPage + 1;
        mntArticleComment.setTotalPage(totalPage);
        
        model.addAttribute("mntArticleComment", mntArticleComment);
        model.addAttribute("commentList", mntArticleCommentList);
        
        return "article/article_comment";
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
    @RequestMapping("/add_article_comment")
    @ResponseBody
    public Map<String, Object> saveMntArticleComment(MntArticleComment mntArticleComment) {
        mntArticleCommentService.saveMntArticleComment(mntArticleComment);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map; 
      
    }
    /**
     * 文章评论的回复保存
     * @param mntArticleComment
     * @return Map<String, Object>
     */
    @RequestMapping("/add_article_comment2")
    @ResponseBody
    public Map<String, Object> saveMntArticleComment2(MntArticleComment mntArticleComment) {
        mntArticleCommentService.saveMntArticleComment2(mntArticleComment);
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
    @RequestMapping("")
    public String queryMntArticleCommentByCommentId(Model model, @PathVariable String commentId) {
        MntArticleComment mntArticleComment = new MntArticleComment();
        mntArticleComment.setCommentId(Integer.parseInt(commentId));
        
        /*
         * List<MntArticleComment> mntArticleComments =mntArticleCommentService.findMntArticleCommentList(mntArticleComment);
            model.addAttribute("commendList", mntArticleComments);
         * 
         * */
        List<MntArticleComment> mntArticleCommentList = mntArticleCommentService.findMntArticleCommentList(mntArticleComment);
        if(mntArticleCommentList != null && mntArticleCommentList.size() > 0) { //只会有一条数据
            model.addAttribute("commentList", mntArticleCommentList.get(0));
        }
        return "";
    }
}
