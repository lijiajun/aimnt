package com.ai.mnt.web.sys;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ai.mnt.common.shiro.UserRealm;
import com.ai.mnt.common.util.MntConstant;
import com.ai.mnt.model.sys.SysResource;
import com.ai.mnt.model.sys.SysUser;
import com.ai.mnt.model.task.MntTaskInfo;
import com.ai.mnt.service.sys.LoginService;
import com.ai.mnt.service.sys.SysResourceService;
import com.ai.mnt.service.sys.SysUserService;
import com.ai.mnt.service.task.MntTaskInfoService;

@Controller
public class LoginController {

    @Autowired
    public LoginService loginService;
    
    @Autowired
    SysUserService sysUserService;
    
    @Autowired
    SysResourceService sysResourceService;
    
    @Autowired
    UserRealm userRealm;
    
    @Autowired
    MntTaskInfoService mntTaskInfoService;
    
    @RequestMapping("/")
    public String indexPage(Model model) {
        
        Subject subject = SecurityUtils.getSubject();
        SysUser sysUser = (SysUser) subject.getPrincipal();
        model.addAttribute("sysUser", sysUser);
        
        MntTaskInfo mntTaskInfo = new MntTaskInfo();
        mntTaskInfo.setDeleteFlag("0");
        mntTaskInfo.setDealPerson(sysUser.getUserName());
        mntTaskInfo.setDealSts("2");
        List<MntTaskInfo> mntTaskInfoList = mntTaskInfoService.findMntTaskInfoList(mntTaskInfo);
        int taskCount = mntTaskInfoList == null ? 0 : mntTaskInfoList.size();
        model.addAttribute("taskCount", taskCount);
        return "index";
    }
    
    @RequestMapping("/menu")
    @ResponseBody
    public List<SysResource> getMenuTreeList() {
        
        List<SysResource> menuTreeList = loginService.getMenuTreeList();
        System.out.println(menuTreeList);
        
        return menuTreeList;
    }
    
    /**
     * 获取菜单当前位置
     * @param sysResource
     * @return
     */
    @RequestMapping("/menu/location/{resId}")
    @ResponseBody
    public Map<String, String> getLocationByResId(@PathVariable String resId) {
        if(resId.indexOf("_") != -1) {
            resId = resId.split("_")[1];
        }
        SysResource sysResource = sysResourceService.findSysResourceByResId(Integer.parseInt(resId));
        String locTxt = "";
        if(sysResource != null) {
            String _resName = sysResource.getResName();
            if(StringUtils.isNotEmpty(sysResource.getParentIds())) {
                String _parentIds = sysResource.getParentIds();
                String[] parentIdAry = _parentIds.split("/");
                for(String parentId : parentIdAry) {
                    if(!"-1".equals(parentId)) {
                        sysResource = sysResourceService.findSysResourceByResId(Integer.parseInt(parentId));
                        locTxt += sysResource.getResName() + " > ";
                    }
                }
            }
            locTxt += _resName;
        }
        Map<String, String> map = new HashMap<>();
        map.put("locTxt", locTxt);
        map.put("status", "1");
        return map;
    }
    
    
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String showLoginPage() {
        
        Subject subject = SecurityUtils.getSubject();
        if(subject.isAuthenticated()) {
              return "redirect:/";
        }
        
        return "sys/login";
    }
    
    /**
     * 登录页面跳转
     * 
     * 5a14b85b55e192f4c067995249a1c1ba
     * 58ed6358de4af04173afee1b6a7e21fb
     * @return
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String loginSystem(HttpServletRequest request, Model model) {
        
        String shiroExcption = (String) request.getAttribute("shiroLoginFailure");
        String error = "";
        if(UnknownAccountException.class.getName().equals(shiroExcption)) {
            error = "用户名或密码错误,请检查！输入错误" + MntConstant.PASSWD_RETRY_COUNT + "次，将被锁定1小时";
        } else if(IncorrectCredentialsException.class.getName().equals(shiroExcption)) {
            error = "用户名或密码错误,请检查！输入错误" + MntConstant.PASSWD_RETRY_COUNT + "次，将被锁定1小时";
        } else if(ExcessiveAttemptsException.class.getName().equals(shiroExcption)) {
            error = "密码输入错误" + MntConstant.PASSWD_RETRY_COUNT + "次，账户锁定1小时！";
        }else if(shiroExcption != null) {
            error = "错误：" + shiroExcption;
        }
        model.addAttribute("error", error);
//        UsernamePasswordToken token = new UsernamePasswordToken(sysUser.getUserName(), sysUser.getPassword());
//        Subject subject = SecurityUtils.getSubject();
//        subject.login(token);
//        if(subject.isAuthenticated()) {
//            return "redirect:/";
//        }
        
//        if("".equals(error)) {
//            SysUser currentUser = userRealm.getCurrentUser();
//            SysUser sysUser = new SysUser();
//            sysUser.setUserId(currentUser.getUserId());
//            sysUser.setLastLoginIp(request.getRemoteAddr());
//            sysUser.setLastLoginDate(new Date());
//            sysUserService.updateUser(sysUser);
//        }
//        if("".equals(error)) {
//            return "redirect:/login";
//        }
        return "sys/login";
    }
    
}
