package com.ai.mnt.service.sys;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.ai.mnt.model.sys.SysResource;
import com.ai.mnt.persistence.sys.SysResourceMapper;
import com.ai.mnt.service.sys.LoginService;


public class SysServiceTest {

    
    public static ApplicationContext act = null;
    
    @BeforeClass
    public static void setUpBeforeClass() throws Exception {
        act = new ClassPathXmlApplicationContext("spring-core.xml");
    }

    @AfterClass
    public static void tearDownAfterClass() throws Exception {

    }

    @Before
    public void setUp() throws Exception {
    }

    @After
    public void tearDown() throws Exception {
    }

    @Test
    public void test() {
        LoginService loginService = act.getBean(LoginService.class);
        List<SysResource> sysResourceList = loginService.getMenuTreeList();
        System.out.println(sysResourceList);
    }
      
    @Test
    public void save() {
        SysResourceMapper loginService = act.getBean(SysResourceMapper.class);
        
        SysResource sysResource= new SysResource();
        sysResource.setResName("测试菜单77");
        sysResource.setResType(0);
        sysResource.setResUrl("url");
        sysResource.setParentId(1);
        sysResource.setParentIds("2/1");
        sysResource.setResOrder(1);
        sysResource.setResIcon("icon");
        sysResource.setPermission("create");
        sysResource.setResSts("1");
        sysResource.setRemark("Test");
        sysResource.setCreator("admin");
        sysResource.setCreateDate(new Date());
        sysResource.setModifier("admin");
        sysResource.setModifyDate(new Date());
        
        int id = loginService.save(sysResource);
        System.out.println("============id : " + id);
        System.out.println("============resId : " + sysResource.getResId());
    }
    
    @Test
    public void saveAll() {
        SysResourceMapper loginService = act.getBean(SysResourceMapper.class);
        
        
        SysResource sysResource= new SysResource();
        sysResource.setResName("测试菜单33");
        sysResource.setResType(0);
        sysResource.setResUrl("url");
        sysResource.setParentId(1);
        sysResource.setParentIds("2/1");
        sysResource.setResOrder(1);
        sysResource.setResIcon("icon");
        sysResource.setPermission("create");
        sysResource.setResSts("1");
        sysResource.setRemark("Test");
        sysResource.setCreator("admin");
        sysResource.setCreateDate(new Date());
        sysResource.setModifier("admin");
        sysResource.setModifyDate(new Date());
        
        SysResource sysResource2 = new SysResource();
        sysResource2.setResName("测试菜单99");
        sysResource2.setResType(0);
        sysResource2.setResUrl("url");
        sysResource2.setParentId(1);
        sysResource2.setParentIds("2/1");
        sysResource2.setResOrder(1);
        sysResource2.setResIcon("icon");
        sysResource2.setPermission("create");
        sysResource2.setResSts("1");
        sysResource2.setRemark("Test");
        sysResource2.setCreator("admin");
        sysResource2.setCreateDate(new Date());
        sysResource2.setModifier("admin");
        sysResource2.setModifyDate(new Date());
        
        List<SysResource> list = new ArrayList<>();
        list.add(sysResource);
        list.add(sysResource2);
        int re = loginService.saveAll(list);
        System.out.println("====re :" + re);
        System.out.println("====sysResource :" + sysResource.getResId());
        System.out.println("====sysResource2 :" + sysResource2.getResId());
    }
    
    
    @Test
    public void deleteByPrimaryKey() {
        SysResourceMapper loginService = act.getBean(SysResourceMapper.class);
        
        loginService.deleteByPrimaryKey(39);
        
    }
    

    @Test
    public void deleteList() {
        SysResourceMapper loginService = act.getBean(SysResourceMapper.class);
        
        List<Integer> ids = new ArrayList<>();
        ids.add(40);
        ids.add(41);
        loginService.deleteList(ids);
        
    }
    
    @Test
    public void updateByPrimaryKey() {
        SysResourceMapper loginService = act.getBean(SysResourceMapper.class);
        
        SysResource sysResource2 = new SysResource();
        sysResource2.setResId(43);
        sysResource2.setResName("测试菜单99");
        sysResource2.setResType(0);
        sysResource2.setResUrl("url323");
        sysResource2.setParentId(1);
        sysResource2.setParentIds("2/1/3");
        sysResource2.setResOrder(1);
        sysResource2.setResIcon("icon2");
        sysResource2.setPermission("create:1");
        sysResource2.setResSts("1");
        sysResource2.setRemark("Test");
        sysResource2.setCreator("admin");
        sysResource2.setCreateDate(new Date());
        sysResource2.setModifier("admin");
        sysResource2.setModifyDate(new Date());
        
        loginService.updateByPrimaryKey(sysResource2);
        
    }
    
    @Test
    public void findByPrimaryKey() {
        SysResourceMapper loginService = act.getBean(SysResourceMapper.class);
        SysResource sysResource = loginService.findByPrimaryKey(3);
        System.out.println(sysResource);
    }
    
    @Test
    public void findList() {
        SysResourceMapper loginService = act.getBean(SysResourceMapper.class);
        SysResource sysResource = new SysResource();
        sysResource.setParentId(1);
        sysResource.setResId(3);
        List<SysResource> sysResourceList = loginService.findList(sysResource);
        System.out.println(sysResourceList);
    }
    
    @Test
    public void findAll() {
        SysResourceMapper loginService = act.getBean(SysResourceMapper.class);
        List<SysResource> sysResourceList = loginService.findAll();
        System.out.println(sysResourceList);
    }
}
