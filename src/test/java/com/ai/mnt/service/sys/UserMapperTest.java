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

import com.ai.mnt.model.sys.SysUser;
import com.ai.mnt.persistence.sys.SysUserMapper;

public class UserMapperTest {

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
    public void saveAll() {
        SysUserMapper sysUserMapper = act.getBean(SysUserMapper.class);
        
        SysUser sysUser = new SysUser();
        sysUser.setUserName("tom6");
        sysUser.setPassword("123456");
        sysUser.setSalt("123");
        sysUser.setRealName("kkk");
        sysUser.setBaseId(1);
        sysUser.setEmail("sad@sad.com");
        sysUser.setPhoneId("88888888888");
        sysUser.setUserAvatar("sd.png");
        sysUser.setLastLoginIp("10.10.10.10");
        sysUser.setLastLoginDate(new Date());
        sysUser.setUserSts("1");
        sysUser.setRemark("test");
        sysUser.setCreator("admin");
        sysUser.setCreateDate(new Date());
        sysUser.setModifier("admin");
        sysUser.setModifyDate(new Date());
        
        SysUser sysUser2 = new SysUser();
        sysUser2.setUserName("tom7");
        sysUser2.setPassword("123456");
        sysUser2.setSalt("123");
        sysUser2.setRealName("kkk");
        sysUser2.setBaseId(1);
        sysUser2.setEmail("sad@sad.com");
        sysUser2.setPhoneId("88888888888");
        sysUser2.setUserAvatar("sd.png");
        sysUser2.setLastLoginIp("10.10.10.10");
        sysUser2.setLastLoginDate(new Date());
        sysUser2.setUserSts("1");
        sysUser2.setRemark("test");
        sysUser2.setCreator("admin");
        sysUser2.setCreateDate(new Date());
        sysUser2.setModifier("admin");
        sysUser2.setModifyDate(new Date());
        
        List<SysUser> list = new ArrayList<>();
        list.add(sysUser);
        list.add(sysUser2);
        
        int re = sysUserMapper.saveAll(list);
        
        System.out.println(re);
        System.out.println(sysUser2.getUserId());
        System.out.println(sysUser.getUserId());
    }
    

    @Test
    public void save() {
        
        SysUserMapper sysUserMapper = act.getBean(SysUserMapper.class);
        
        SysUser sysUser = new SysUser();
        sysUser.setUserName("tom");
        sysUser.setPassword("123456");
        sysUser.setSalt("123");
        sysUser.setRealName("kkk");
        sysUser.setBaseId(1);
        sysUser.setEmail("sad@sad.com");
        sysUser.setPhoneId("88888888888");
        sysUser.setUserAvatar("sd.png");
        sysUser.setLastLoginIp("10.10.10.10");
        sysUser.setLastLoginDate(new Date());
        sysUser.setUserSts("1");
        sysUser.setRemark("test");
        sysUser.setCreator("admin");
        sysUser.setCreateDate(new Date());
        sysUser.setModifier("admin");
        sysUser.setModifyDate(new Date());
        int re = sysUserMapper.save(sysUser);
        System.out.println(re);
        System.out.println(sysUser.getUserId());
        
        
    }
    
    @Test
    public void deleteByPrimaryKey() {
        SysUserMapper sysUserMapper = act.getBean(SysUserMapper.class);
        
        sysUserMapper.deleteByPrimaryKey(4);
        
    }
    

    @Test
    public void deleteList() {
        SysUserMapper sysUserMapper = act.getBean(SysUserMapper.class);
        
        List<Integer> ids = new ArrayList<>();
        ids.add(2);
        ids.add(3);
        sysUserMapper.deleteList(ids);
        
    }
    
    
    @Test
    public void updateByPrimaryKey() {
        SysUserMapper sysUserMapper = act.getBean(SysUserMapper.class);
        
        SysUser sysUser = new SysUser();
        sysUser.setUserId(5);
        sysUser.setUserName("herry");
        sysUser.setPassword("321");
        sysUser.setSalt("123");
        sysUser.setRealName("1qqw");
        sysUser.setBaseId(1);
        sysUser.setEmail("sad@sad.com");
        sysUser.setPhoneId("9999999");
        sysUser.setUserAvatar("sd.png");
        sysUser.setLastLoginIp("10.10.10.89");
        sysUser.setLastLoginDate(new Date());
        sysUser.setUserSts("0");
        sysUser.setRemark("test1");
        sysUser.setCreator("admin1");
        sysUser.setCreateDate(new Date());
        sysUser.setModifier("admin1");
        
        sysUserMapper.updateByPrimaryKey(sysUser);
        
    }
    
    @Test
    public void findByPrimaryKey() {
        SysUserMapper sysUserMapper = act.getBean(SysUserMapper.class);
        
        SysUser sysUser = sysUserMapper.findByPrimaryKey(5);
        System.out.println(sysUser);
    }
    
    
    @Test
    public void findList() {
        SysUserMapper sysUserMapper = act.getBean(SysUserMapper.class);
        SysUser sysUser = new SysUser();
        sysUser.setPhoneId("9999999");
        //sysUser.setCreator("admin1");
        List<SysUser> sysUserList = sysUserMapper.findList(sysUser);
        System.out.println(sysUserList);
    }
    
    @Test
    public void findAll() {
        SysUserMapper sysUserMapper = act.getBean(SysUserMapper.class);
        List<SysUser> sysUserList = sysUserMapper.findAll();
        System.out.println(sysUserList);
    }
}
