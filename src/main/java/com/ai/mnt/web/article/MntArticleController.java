package com.ai.mnt.web.article;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ai.mnt.common.cache.BaseDataCache;
import com.ai.mnt.common.shiro.UserRealm;
import com.ai.mnt.model.article.MntArticle;
import com.ai.mnt.model.article.MntArticleComment;
import com.ai.mnt.model.common.EnumObject;
import com.ai.mnt.model.sys.SysUser;
import com.ai.mnt.service.article.MntArticleCommentService;
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
    
    @Autowired
    UserRealm userRealm;
    
    @Autowired
    MntArticleCommentService mntArticleCommentService;
    
    /**
     * 运维文章界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/page")
    public String showMntArticlePage(Model model, MntArticle mntArticle) {
        
        if(mntArticle.getCurrentPage() != 1) {
            int start = (mntArticle.getCurrentPage() -1) * mntArticle.getPageSize();
            mntArticle.setStart(start);
            
        }
        
        mntArticle.setDeleteFlag("0");
        mntArticle.setIsShow("1");
        List<MntArticle> mntArticleList = mntArticleService.findMntArticleListPagination(mntArticle);
        long totalCount = mntArticleService.getMntArticleTotalCount(mntArticle);
        mntArticle.setTotalCount(totalCount);
       
        //总页数
        long totalPage = totalCount / mntArticle.getPageSize();
        int mod = (int) (totalCount % mntArticle.getPageSize());
        totalPage = mod == 0 ? totalPage : totalPage + 1;
        mntArticle.setTotalPage(totalPage);
        
        model.addAttribute("articleList", mntArticleList);
        model.addAttribute("mntArticle", mntArticle);
        
        List<MntArticle> artiTopTenList = mntArticleService.getArticleListReadTopTen(mntArticle);
        model.addAttribute("artiTopTenList", artiTopTenList);
        
        return "article/article_list";
    }
    
    /**
     * 获取运维文章列表          /article/query的映射地址是哪里，？？？？？？
     * @param mntArticle
     * @return Map<String, Object>
     */
    @RequestMapping("/query")
    @ResponseBody
    public Map<String, Object> getMntArticleList(MntArticle mntArticle) {
        mntArticle.setDeleteFlag("0");
        List<MntArticle> mntArticleList = mntArticleService.findMntArticleListPagination(mntArticle);
        long totalCount = mntArticleService.getMntArticleTotalCount(mntArticle);
        mntArticle.setTotalCount(totalCount);
        
        Map<String, Object> map = new HashMap<>();
        map.put("data", mntArticleList);
        map.put("mntArticle", mntArticle);
        map.put("status", "1");
        return map;
    }
    
    /**
     * 运维文章新增界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/add_page")
    public String showMntArticleAddPage(Model model) {
        
        List<EnumObject> prodEnums = BaseDataCache.getDataList("ARTICLE_TYPE");
        model.addAttribute("articleTypeEnums", prodEnums);
        
        return "article/article_add";
    }
    
    /**
     * 运维文章保存
     * @param mntArticle
     * @return Map<String, Object>
     */
    @RequestMapping("/add_article")
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
    @RequestMapping("/update_page/{id}")
    public String showMntArticleUpdatePage(Model model, @PathVariable String id) {
        
        List<EnumObject> prodEnums = BaseDataCache.getDataList("ARTICLE_TYPE");
        model.addAttribute("articleTypeEnums", prodEnums);
        
        MntArticle mntArticle = mntArticleService.findMntArticleById(Integer.parseInt(id));
        model.addAttribute("mntArticle", mntArticle);
        return "article/article_edit";
    }
    
    /**
     * 运维文章根据主键更新
     * @param mntArticle
     * @return
     */
    @RequestMapping("/update_article")
    @ResponseBody
    public Map<String, Object> updateMntArticle(MntArticle mntArticle) {
        mntArticleService.updateMntArticleById(mntArticle);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 运维文章根据主键更新
     * @param mntArticle
     * @return
     */
    @RequestMapping("/update_article_top")
    @ResponseBody
    public Map<String, Object> updateMntArticleIsTop(MntArticle mntArticle) {
        mntArticleService.updateArticleRelCountById(mntArticle);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 运维文章根据主键批量删除
     * @param ids
     * @return Map<String, Object>
     */
    @RequestMapping("/delete/{ids}")
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
    @RequestMapping("/full_content/{id}")
    public String queryMntArticleById(Model model, @PathVariable String id,
            MntArticleComment mntArticleComment) {
        MntArticle mntArticle = new MntArticle();
        mntArticle = mntArticleService.findMntArticleById(Integer.parseInt(id));
        model.addAttribute("mntArticle", mntArticle);
        
        //pre
        MntArticle preArticle = mntArticleService.getPreArticle(Integer.parseInt(id));
        if(preArticle == null) {
            preArticle = new MntArticle();
            preArticle.setTitle("没有了...");
            model.addAttribute("hasPre", 0);
        }else {
            if(preArticle.getTitle().length() > 15) {
                preArticle.setTitle(preArticle.getTitle().substring(0, 15) + "..."); 
            }
            model.addAttribute("hasPre", 1);
        }
        model.addAttribute("preArticle", preArticle);
        //next
        MntArticle nextArticle = mntArticleService.getNextArticle(Integer.parseInt(id));
        if(nextArticle == null) {
            nextArticle = new MntArticle();
            nextArticle.setTitle("没有了...");
            model.addAttribute("hasNext", 0);
        }else {
            if(nextArticle.getTitle().length() > 15) {
                nextArticle.setTitle(nextArticle.getTitle().substring(0, 15) + "..."); 
            }
            model.addAttribute("hasNext", 1);
        }
        model.addAttribute("nextArticle", nextArticle);
        
        //增加阅读次数
        MntArticle mntArticle2 = new MntArticle();
        mntArticle2.setId(mntArticle.getId());
        int nReadCount = mntArticle.getReadCount() == null ? 0 : mntArticle.getReadCount();
        mntArticle2.setReadCount(nReadCount + 1);
        mntArticleService.updateArticleRelCountById(mntArticle2);
        
        //热门
        List<MntArticle> artiTopTenList = mntArticleService.getArticleListReadTopTen(mntArticle);
        model.addAttribute("artiTopTenList", artiTopTenList);
        
        
        //评论
       // mntArticleComment.setCommentId();
        mntArticleComment.setAritcleId(Integer.parseInt(id));
        if(mntArticleComment.getCurrentPage() != 1) {
            int start = (mntArticleComment.getCurrentPage() -1) * mntArticleComment.getPageSize();
            mntArticleComment.setStart(start);
        }
        long totalCount = mntArticleCommentService.getMntArticleTotalCount(mntArticleComment);
        mntArticleComment.setTotalCount(totalCount);                       //本篇文章总评论数
   
        long totalPage = totalCount / mntArticle.getPageSize();
        int mod = (int) (totalCount % mntArticle.getPageSize());
        totalPage = mod == 0 ? totalPage : totalPage + 1;
        mntArticleComment.setTotalPage(totalPage);
        
       // String parentUserName =mntArticleCommentService.ge
        //mntArticleComment.setParentId(parentId);
        
        List<MntArticleComment> mntArticleCommentList=mntArticleCommentService.findMntArticleCommentListPagination(mntArticleComment);
       
        model.addAttribute("mntArticleComment", mntArticleComment);
        model.addAttribute("commentList", mntArticleCommentList);
        
        
        //current user
        SysUser currentUser = userRealm.getCurrentUser();
        model.addAttribute("currentUserName", currentUser.getUserName());
        
        
        return "article/article_content";
    }
    
    /**
     * 根据主键查询运维文章详细信息
     * @param model
     * @return
     */
    @RequestMapping("/my_articles")
    public String queryMyArticles(Model model) {
        return "article/article_my_list";
    }
    
    /**
     * 运维文章
     * @param ids
     * @return Map<String, Object>
     */
    @RequestMapping("/my_articles/query")
    @ResponseBody
    public Map<String, Object> findUserArticles() {
        SysUser currentUser = userRealm.getCurrentUser();
        MntArticle mntArticle = new MntArticle();
        mntArticle.setCreator(currentUser.getUserName());
        mntArticle.setDeleteFlag("0");
        List<MntArticle> mntArticleList = mntArticleService.findMntArticleList(mntArticle);
        Map<String, Object> map = new HashMap<>();
        map.put("data", mntArticleList);
        map.put("status", "1");
        return map;
    }
    
    /**
     * 文章图片上传
     * @param mntArticle
     * @return
     */
    @RequestMapping("/upload_pic")
    @ResponseBody
    public Map<String, Object> uploadPic(@RequestParam("file") MultipartFile file,
            HttpServletRequest request) {
        Map<String, Object> map = new HashMap<>();
        String returnPath = "";
        if (!file.isEmpty()) {
            try {
                SysUser sysUser = userRealm.getCurrentUser();
                String imgName = file.getOriginalFilename();
                imgName = "article_" + System.currentTimeMillis() + imgName.substring(imgName.lastIndexOf("."));
                String path = request.getSession().getServletContext().getRealPath("/") + 
                        File.separator + "static" + File.separator + "img" + File.separator + "article" + File.separator + sysUser.getUserName();
                File dir = new File(path);
                if(!dir.exists()) {
                    dir.mkdir();
                }
                File file_path = new File(path + File.separator + imgName);
                file.transferTo(file_path);
                
                returnPath = "static" + File.separator + "img" + File.separator + "article" + 
                            File.separator + sysUser.getUserName() + File.separator + imgName;
                map.put("status", "1");
            } catch (IOException e) {
                e.printStackTrace();
                map.put("status", "0");
            }
        }
        map.put("returnPath", returnPath);
        
        return map;
    }
}
