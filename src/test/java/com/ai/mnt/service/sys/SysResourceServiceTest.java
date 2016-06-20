package com.ai.mnt.service.sys;

import java.util.Date;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.ai.mnt.model.sys.SysResource;

public class SysResourceServiceTest {

    
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
    public void testSave() {
//        SysResourceService sysResourceService = act.getBean(SysResourceService.class);
        
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
        
//        sysResourceService.saveSysResource(sysResource);
        
        System.out.println(sysResource.getResId());
    }
    
    
}
