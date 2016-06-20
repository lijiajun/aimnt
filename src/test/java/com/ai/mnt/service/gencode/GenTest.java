package com.ai.mnt.service.gencode;

import java.util.List;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.ai.mnt.model.gencode.TableColumn;
import com.ai.mnt.persistence.gencode.ColumnsMapper;

public class GenTest {
    
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
    public void findAll() {

        ColumnsMapper columnsMapper = act.getBean(ColumnsMapper.class);
        TableColumn column = new TableColumn();
        column.setTableName("sys_user");
        column.setTableSchema("mnt");
        List<TableColumn> list = columnsMapper.findList(column);
        
        System.out.println(list);

    }
    
    
}
