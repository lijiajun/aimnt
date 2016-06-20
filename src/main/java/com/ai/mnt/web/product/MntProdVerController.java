package com.ai.mnt.web.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ai.mnt.model.product.MntProdVersion;
import com.ai.mnt.service.product.MntProdVerService;

/**
 * @Title: MntProdControllor 
 * @Description: MntProdControllor
 * @Author: He
 * @Date: 2016-4-14
 */
@Controller
@RequestMapping("/prod")
public class MntProdVerController {
    
    @Autowired
    MntProdVerService mntProdVerService;
    
    /**
     * 产品信息
     * @param model
     * @return
     */
    @RequestMapping("/ver/page")
    public String showProdPage(Model model) {
        List<MntProdVersion> prodVerList = mntProdVerService.findAllProdVer();
        model.addAttribute("prodVerList", prodVerList);
        return "product/info/prod_version";
    }
    

}
