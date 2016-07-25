package com.ai.mnt.common.gencode;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.ai.mnt.model.gencode.TableColumn;
import com.ai.mnt.model.gencode.Tables;
import com.ai.mnt.persistence.gencode.ColumnsMapper;
import com.ai.mnt.persistence.gencode.TablesMapper;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateExceptionHandler;


public class GenUtil {
    
    
    public static Logger logger = Logger.getLogger(GenUtil.class);
    
    
    public static ApplicationContext act = new ClassPathXmlApplicationContext("spring-core.xml");
    Map<String, String> typeMap = new HashMap<>();
    
    /**
     * 获取表列对象
     * @param columns
     */
    public static List<TableColumn> getTableColumn(TableColumn column) {
        ColumnsMapper columnsMapper = act.getBean(ColumnsMapper.class);
        List<TableColumn> columnsList = columnsMapper.findList(column);
        for(TableColumn temp : columnsList) {
            temp.setColumnName(temp.getColumnName().toLowerCase());
            temp.setJavaField(cvtJdbcFieldNameToJava(temp.getColumnName().toLowerCase()));
            temp.setJavaType(cvtJdbcDataTypeToJava(temp.getDataType()));
        }
        return columnsList;
    }
    
    /**
     * 获取表对象
     * @param columns
     */
    public static Tables getTableObj(Tables tables) {
        TablesMapper tablesMapper = act.getBean(TablesMapper.class);
        return tablesMapper.findTablesBySchemaAndTableName(tables);
    }
    
    /**
     * jdbcFieldName menu_id ---> JavaField menuId
     * @param jdbcFieldName
     * @return
     */
    public static String cvtJdbcFieldNameToJava(String jdbcFieldName) {

        Pattern pattern = Pattern.compile("_[a-zA-z0-9]");
        Matcher match = pattern.matcher(jdbcFieldName);
        while (match.find()) {
            String str = match.group();
            jdbcFieldName = jdbcFieldName.replaceFirst(str, str.replace("_", "").toUpperCase());
        }
        
        return jdbcFieldName.replaceAll("_", "");
    }
    
    /**
     * jdbcDataType varchar ---> javaDataType String
     * @param jdbcDataType
     * @return
     */
    public static String cvtJdbcDataTypeToJava(String jdbcDataType) {
        String javaDataType = "";
        if("varchar".equalsIgnoreCase(jdbcDataType)) {
            javaDataType = "String";
        }else if("int".equalsIgnoreCase(jdbcDataType)) {
            javaDataType = "Integer";
        }else if("datetime".equalsIgnoreCase(jdbcDataType)) {
            javaDataType = "Date";
        }else if("char".equalsIgnoreCase(jdbcDataType)) {
            javaDataType = "String";
        }else if("text".equalsIgnoreCase(jdbcDataType)) {
            javaDataType = "String";
        }else if("bigint".equalsIgnoreCase(jdbcDataType)) {
            javaDataType = "Long";
        }else {
            logger.error("其他类型还没有写，等等吧！或者你自己添加一下！");
        }
        return javaDataType;
    }
    
    public static String cvtTableNameToJava(String tableName) {

        Pattern pattern = Pattern.compile("_[a-zA-z0-9]");
        Matcher match = pattern.matcher(tableName);
        while (match.find()) {
            String str = match.group();
            tableName = tableName.replaceFirst(str, str.replace("_", "").toUpperCase());
        }
        System.out.println("==================tableName : " + tableName);
        return tableName.replaceAll("_", "").substring(0, 1).toUpperCase() + tableName.replaceAll("_", "").substring(1);
    }
    
    /**
     * 生成model文件
     * @param columnsList   表字段信息
     * @param tableName     表名
     * @param module        模块名
     * @throws Exception
     */
    public static void generateModel(List<TableColumn> columnsList, String tableName, String module) throws Exception {
        Map<String, Object> root = new HashMap<>();
        root.put("module", module);
        root.put("columns", columnsList);
        root.put("modelName", cvtTableNameToJava(tableName));
        Template temp = cfg.getTemplate("Modeltemplate.ftl");
        //String path = GenUtil.class.getResource("/").getPath();
        OutputStream os = new FileOutputStream(GEN_PATH + root.get("modelName") + ".java");
        Writer out = new OutputStreamWriter(os);
        temp.process(root, out);
        out.close();
        os.close();
        logger.info("==MODEL==SUCCESS===PATH : " + GEN_PATH + root.get("modelName") + ".java");
    }
    
    /**
     * 生成持久层Mapper文件
     * @param columnsList   表字段信息
     * @param tableName     表名
     * @param module        模块名
     * @throws Exception
     */
    public static void generateMapper(List<TableColumn> columnsList, String tableName, String module) throws Exception {
        
        Map<String, Object> root = new HashMap<>();
        root.put("module", module);
        String pkDataType = "Integer";
        for(TableColumn tableColumn : columnsList) {
            if("PRI".equalsIgnoreCase(tableColumn.getColumnKey())) {
                pkDataType = tableColumn.getJavaType();
                break;
            }
        }
        root.put("dataType", pkDataType);
        root.put("modelName", cvtTableNameToJava(tableName));
        Template temp = cfg.getTemplate("MapperTemplate.ftl");
        //String path = GenUtil.class.getResource("/").getPath();
        OutputStream os = new FileOutputStream(GEN_PATH + root.get("modelName") + "Mapper" + ".java");
        Writer out = new OutputStreamWriter(os);
        temp.process(root, out);
        out.close();
        os.close();
        logger.info("==MAPPER==SUCCESS===PATH : " + GEN_PATH + root.get("modelName")  + "Mapper" + ".java");
        
    }
    
    /**
     * 生成 Service 文件
     * @param columnsList   表字段信息
     * @param tables        表
     * @param module        模块名
     * @throws Exception
     */
    public static void generateService(List<TableColumn> columnsList, Tables tables, String module) throws Exception {
        
        Map<String, Object> root = new HashMap<>();
        root.put("module", module);

        //pkField
        //pkJavaField
        for(TableColumn tableColumn : columnsList) {
            if("PRI".equalsIgnoreCase(tableColumn.getColumnKey())) {
                root.put("pkField", tableColumn.getColumnName());
                root.put("pkJavaField", tableColumn.getJavaField());
                break;
            }
        }
        
        root.put("modelName", cvtTableNameToJava(tables.getTableName().toLowerCase()));
        root.put("modelNameCn", cvtTableNameToJava(tables.getTableComment()));
        Template temp = cfg.getTemplate("ServiceTemplate.ftl");
        OutputStream os = new FileOutputStream(GEN_PATH + root.get("modelName") + "Service" + ".java");
        Writer out = new OutputStreamWriter(os);
        temp.process(root, out);
        out.close();
        os.close();
        logger.info("==MAPPER==SUCCESS===PATH : " + GEN_PATH + root.get("modelName")  + "Service" + ".java");
    }
    
    /**
     * 生成 ServiceImpl 实现类文件
     * @param columnsList   表字段信息
     * @param tables        表
     * @param module        模块名
     * @throws Exception
     */
    public static void generateServiceImpl(List<TableColumn> columnsList, Tables tables, String module) throws Exception {
        
        Map<String, Object> root = new HashMap<>();
        root.put("module", module);

        //pkField
        //pkJavaField
        for(TableColumn tableColumn : columnsList) {
            if("PRI".equalsIgnoreCase(tableColumn.getColumnKey())) {
                root.put("pkField", tableColumn.getColumnName());
                root.put("pkJavaField", tableColumn.getJavaField());
                break;
            }
        }
        
        root.put("modelName", cvtTableNameToJava(tables.getTableName().toLowerCase()));
        root.put("modelNameCn", cvtTableNameToJava(tables.getTableComment()));
        Template temp = cfg.getTemplate("ServiceImplTemplate.ftl");
        OutputStream os = new FileOutputStream(GEN_PATH + root.get("modelName") + "ServiceImpl" + ".java");
        Writer out = new OutputStreamWriter(os);
        temp.process(root, out);
        out.close();
        os.close();
        logger.info("==MAPPER==SUCCESS===PATH : " + GEN_PATH + root.get("modelName")  + "ServiceImpl" + ".java");
    }
    
    /**
     * 生成 Controller 类文件
     * @param columnsList   表字段信息
     * @param tables        表
     * @param module        模块名
     * @throws Exception
     */
    public static void generateController(List<TableColumn> columnsList, Tables tables, String module, String sub_module) throws Exception {
        
        Map<String, Object> root = new HashMap<>();
        root.put("module", module);

        //pkField
        //pkJavaField
        for(TableColumn tableColumn : columnsList) {
            if("PRI".equalsIgnoreCase(tableColumn.getColumnKey())) {
                root.put("pkField", tableColumn.getColumnName());
                root.put("pkJavaField", tableColumn.getJavaField());
                break;
            }
        }
        
        root.put("module", module);
        root.put("sub_module", sub_module);
        root.put("modelName", cvtTableNameToJava(tables.getTableName().toLowerCase()));
        root.put("modelNameCn", cvtTableNameToJava(tables.getTableComment()));
        Template temp = cfg.getTemplate("ControllerTemplate.ftl");
        OutputStream os = new FileOutputStream(GEN_PATH + root.get("modelName") + "Controller" + ".java");
        Writer out = new OutputStreamWriter(os);
        temp.process(root, out);
        out.close();
        os.close();
        logger.info("==MAPPER==SUCCESS===PATH : " + GEN_PATH + root.get("modelName")  + "Controller" + ".java");
    }
    
    /**
     * 生成Mapper Xml文件
     * @param columnsList   表字段信息
     * @param tableName     表名
     * @param module        模块名
     * @throws Exception
     */
    public static void generateMapperXml(List<TableColumn> columnsList, String tableName, String module) throws Exception {
        Map<String, Object> root = new HashMap<>();
        root.put("module", module);
        root.put("columns", columnsList);
        root.put("modelName", cvtTableNameToJava(tableName));
        root.put("tableName", tableName);
        
        //pkField
        //pkJavaField
        for(TableColumn tableColumn : columnsList) {
            if("PRI".equalsIgnoreCase(tableColumn.getColumnKey())) {
                root.put("pkField", tableColumn.getColumnName());
                root.put("pkJavaField", tableColumn.getJavaField());
                break;
            }
        }
        
        if(root.get("pkField") == null) {
            root.put("pkField", columnsList.get(0).getColumnName());
        }
        if(root.get("pkJavaField") == null) {
            root.put("pkJavaField", columnsList.get(0).getJavaField());
        }
        
        Template temp = cfg.getTemplate("XmlMapperTemplate.ftl");
        //String path = GenUtil.class.getResource("/").getPath();
        OutputStream os = new FileOutputStream(GEN_PATH + root.get("modelName") + "Mapper" + ".xml");
        Writer out = new OutputStreamWriter(os);
        temp.process(root, out);
        out.close();
        os.close();
        logger.info("==XML==SUCCESS===PATH : " + GEN_PATH + root.get("modelName") + "Mapper" + ".xml");
    }
    
    /**
     * 生成 JSP main query 类文件
     * @param columnsList   表字段信息
     * @param tables        表
     * @param module        模块名
     * @throws Exception
     */
    public static void generateJspMainQuery(List<TableColumn> columnsList, Tables tables, String module, String sub_module) throws Exception {
        
        Map<String, Object> root = new HashMap<>();
        root.put("module", module);
        root.put("columns", columnsList);
        //pkField
        //pkJavaField
        for(TableColumn tableColumn : columnsList) {
            if("PRI".equalsIgnoreCase(tableColumn.getColumnKey())) {
                root.put("pkField", tableColumn.getColumnName());
                root.put("pkJavaField", tableColumn.getJavaField());
                break;
            }
        }
        
        root.put("module", module);
        root.put("sub_module", sub_module);
        root.put("modelName", cvtTableNameToJava(tables.getTableName().toLowerCase()));
        root.put("modelNameCn", cvtTableNameToJava(tables.getTableComment()));
        Template temp = cfg.getTemplate("JspQueryTemplate.ftl");
        OutputStream os = new FileOutputStream(GEN_PATH + root.get("module") + "_" + root.get("sub_module") + "_query.jsp");
        Writer out = new OutputStreamWriter(os);
        temp.process(root, out);
        out.close();
        os.close();
        logger.info("==MAPPER==SUCCESS===PATH : " + GEN_PATH + root.get("module") + "_" + root.get("sub_module") + "_query.jsp");
    
        Template temp2 = cfg.getTemplate("JspAddTemplate.ftl");
        OutputStream os2 = new FileOutputStream(GEN_PATH + root.get("module") + "_" + root.get("sub_module") + "_add.jsp");
        Writer out2 = new OutputStreamWriter(os2);
        temp2.process(root, out2);
        out2.close();
        os2.close();
        logger.info("==MAPPER==SUCCESS===PATH : " + GEN_PATH + root.get("module") + "_" + root.get("sub_module") + "_add.jsp");
        
        Template temp3 = cfg.getTemplate("JspUpdateTemplate.ftl");
        OutputStream os3 = new FileOutputStream(GEN_PATH + root.get("module") + "_" + root.get("sub_module") + "_update.jsp");
        Writer out3 = new OutputStreamWriter(os3);
        temp3.process(root, out3);
        out3.close();
        os3.close();
        logger.info("==MAPPER==SUCCESS===PATH : " + GEN_PATH + root.get("module") + "_" + root.get("sub_module") + "_update.jsp");

        Template temp4 = cfg.getTemplate("JspShowContentTemplate.ftl");
        OutputStream os4 = new FileOutputStream(GEN_PATH + root.get("module") + "_" + root.get("sub_module") + "_info.jsp");
        Writer out4 = new OutputStreamWriter(os4);
        temp4.process(root, out4);
        out4.close();
        os4.close();
        logger.info("==MAPPER==SUCCESS===PATH : " + GEN_PATH + root.get("module") + "_" + root.get("sub_module") + "_info.jsp");
        
    }
    
    /**
     * 
     * @param schameName  
     * @param tableName
     * @param module
     * @param sub_module
     * @throws Exception
     */
    public static void generateCodeFile(String schameName, String tableName, String module, String sub_module) throws Exception {
        
        tableName = tableName.toLowerCase();
        
        initConfig();
        
        GEN_PATH = GenUtil.class.getResource("/").getPath().replace("/target/classes/", "") + "/src/main/webapp/static/template/codeFile/" + tableName + "/";
        File fileDir = new File(GEN_PATH);
        if(!fileDir.exists()) {
            fileDir.mkdir();
        }
        logger.info("Code generate path ： " + GEN_PATH);
        
        
        TableColumn column = new TableColumn();
        column.setTableSchema(schameName);
        column.setTableName(tableName);
        List<TableColumn> columnsList = getTableColumn(column);
        
        Tables tables = new Tables();
        tables.setTableSchema(schameName);
        tables.setTableName(tableName);
        tables = getTableObj(tables);
        
        generateModel(columnsList, tableName, module);
        generateMapper(columnsList, tableName, module);
        generateMapperXml(columnsList, tableName, module);
        generateService(columnsList, tables, module);
        generateServiceImpl(columnsList, tables, module);
        generateController(columnsList, tables, module, sub_module);
        generateJspMainQuery(columnsList, tables, module, sub_module);
    }
    
    
    static Configuration cfg = null;
    
    private static String GEN_PATH ="E:\\project\\workspace_eclipse_2016_A\\aimnt\\src\\main\\webapp\\static\\template\\codeFile";
    
    
    public static void initConfig() throws Exception {
        cfg = new Configuration(Configuration.VERSION_2_3_23);
        String tempPath = GenUtil.class.getResource("/").getPath().replace("/target/classes/", "") + "/src/main/webapp/static/template/freemarker";
        logger.info("Template path : " + tempPath);
        cfg.setDirectoryForTemplateLoading(new File(tempPath));
        //cfg.setDirectoryForTemplateLoading(new File("D:\\zl\\yx\\MNT\\aimnt\\src\\main\\resources\\template\\freemark"));
        cfg.setDefaultEncoding("UTF-8");
        cfg.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
        cfg.setLogTemplateExceptions(false);
        
    }
    
    public static void main(String[] args) throws Exception {
        
//        generateCodeFile("mnt", "sys_role", "sys");
//        generateCodeFile("mnt", "sys_user", "sys");
//        generateCodeFile("mnt", "sys_dict", "sys");
//        generateCodeFile("mnt", "sys_role_res", "sys");
//        generateCodeFile("mnt", "sys_user_role", "sys");
//        generateCodeFile("mnt", "sys_resource", "sys");
//        generateCodeFile("mnt", "mnt_prod", "product");
//        generateCodeFile("mnt", "mnt_prod_version", "product");
//        generateCodeFile("mnt", "mnt_release_rec", "product");
//        generateCodeFile("mnt", "mnt_release_rec_dtl", "product");
//        generateCodeFile("mnt", "mnt_prod_module", "product", "module");
//        generateCodeFile("mnt", "mnt_prod_proc", "product");
//        generateCodeFile("mnt", "mnt_module_proc_relation", "product");
//        generateCodeFile("mnt", "mnt_install_base_info", "inst", "base");
//        generateCodeFile("information_schema", "tables", "gencode");
//        generateCodeFile("mnt", "mnt_module_lib", "product", "lib");
//        generateCodeFile("mnt", "mnt_lib_rel_his", "product", "rel_his");
//        generateCodeFile("mnt", "mnt_task_info", "task", "schedule");
//        generateCodeFile("mnt", "sys_base_type", "product", "sys_base_type");
//        generateCodeFile("mnt", "sys_para", "product", "sys_para");
//        generateCodeFile("mnt", "mnt_lib_base_rel", "product", "lib_base");
//        generateCodeFile("mnt", "mnt_lib_relation", "product", "lib_relation");
//        generateCodeFile("mnt_dev", "mnt_article", "article", "posts");
//        generateCodeFile("mnt_dev", "mnt_article_type", "article", "type");
//         generateCodeFile("mnt_dev", "mnt_article_comment", "article", "comment");
//         generateCodeFile("mnt", "mnt_lib_relation_ext", "lib", "relation");
//        generateCodeFile("mnt", "mnt_install_online_info", "inst", "online");
        generateCodeFile("mnt", "mnt_prod_rel_plan", "rel", "plan");
        
        System.exit(0);
    }
    
    
}
