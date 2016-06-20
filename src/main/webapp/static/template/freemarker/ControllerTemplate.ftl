package com.ai.mnt.web.${module};

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ai.mnt.model.${module}.${modelName};
import com.ai.mnt.service.${module}.${modelName}Service;

/**
 * @Title: ${modelName}Controller 
 * @Description: ${modelName}Controller ControllerPackage
 * @Author: Auto Generate.
 * @Date: ${.now?date}
 */

@Controller
@RequestMapping("/${module}")
public class ${modelName}Controller {

    @Autowired
    ${modelName}Service ${modelName?uncap_first}Service;
    
    /**
     * ${modelNameCn}界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/${sub_module}/page")
    public String show${modelName}Page(Model model) {
        return "${module}/${sub_module}/${module}_${sub_module}_query";
    }
    
    /**
     * 获取${modelNameCn}列表
     * @param ${modelName?uncap_first}
     * @return Map<String, Object>
     */
    @RequestMapping("/${sub_module}/query")
    @ResponseBody
    public Map<String, Object> get${modelName}List(${modelName} ${modelName?uncap_first}) {
        List<${modelName}> ${modelName?uncap_first}List = ${modelName?uncap_first}Service.find${modelName}List(${modelName?uncap_first});
        Map<String, Object> map = new HashMap<>();
        map.put("data", ${modelName?uncap_first}List);
        map.put("status", "1");
        return map;
    }
    
    /**
     * ${modelNameCn}新增界面跳转
     * @param  model
     * @return String
     */
    @RequestMapping("/${sub_module}/add_page")
    public String show${modelName}AddPage(Model model) {
        return "${module}/${sub_module}/${module}_${sub_module}_add";
    }
    
    /**
     * ${modelNameCn}保存
     * @param ${modelName?uncap_first}
     * @return Map<String, Object>
     */
    @RequestMapping("/${sub_module}/add")
    @ResponseBody
    public Map<String, Object> save${modelName}(${modelName} ${modelName?uncap_first}) {
        ${modelName?uncap_first}Service.save${modelName}(${modelName?uncap_first});
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * ${modelNameCn}更新界面跳转
     * @param  model
     * @param  ${pkJavaField}
     * @return
     */
    @RequestMapping("/${sub_module}/update_page/{${pkJavaField}}")
    public String show${modelName}UpdatePage(Model model, @PathVariable String ${pkJavaField}) {
        ${modelName} ${modelName?uncap_first} = ${modelName?uncap_first}Service.find${modelName}By${pkJavaField?cap_first}(Integer.parseInt(${pkJavaField}));
        model.addAttribute("${modelName?uncap_first}", ${modelName?uncap_first});
        return "${module}/${sub_module}/${module}_${sub_module}_update";
    }
    
    /**
     * ${modelNameCn}根据主键更新
     * @param ${modelName?uncap_first}
     * @return
     */
    @RequestMapping("/${sub_module}/update")
    @ResponseBody
    public Map<String, Object> update${modelName}(${modelName} ${modelName?uncap_first}) {
        ${modelName?uncap_first}Service.update${modelName}By${pkJavaField?cap_first}(${modelName?uncap_first});
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * ${modelNameCn}根据主键批量删除
     * @param ${pkJavaField}s
     * @return Map<String, Object>
     */
    @RequestMapping("/${sub_module}/delete/{${pkJavaField}s}")
    @ResponseBody
    public Map<String, Object> delete${modelName}By${pkJavaField?cap_first}s(@PathVariable String ${pkJavaField}s) {
        ${modelName?uncap_first}Service.delete${modelName}By${pkJavaField?cap_first}s(${pkJavaField}s);
        Map<String, Object> map = new HashMap<>();
        map.put("status", "1");
        return map;
    }
    
    /**
     * 根据主键查询${modelNameCn}详细信息
     * @param model
     * @return
     */
    @RequestMapping("/${sub_module}/{${pkJavaField}}/page")
    public String query${modelName}By${pkJavaField?cap_first}(Model model, @PathVariable String ${pkJavaField}) {
        ${modelName} ${modelName?uncap_first} = new ${modelName}();
        ${modelName?uncap_first}.set${pkJavaField?cap_first}(Integer.parseInt(${pkJavaField}));
        List<${modelName}> ${modelName?uncap_first}List = ${modelName?uncap_first}Service.find${modelName}List(${modelName?uncap_first});
        if(${modelName?uncap_first}List != null && ${modelName?uncap_first}List.size() > 0) { //只会有一条数据
            model.addAttribute("${modelName?uncap_first}", ${modelName?uncap_first}List.get(0));
        }
        return "${module}/${sub_module}/${module}_${sub_module}_info";
    }
}
