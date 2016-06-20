package com.ai.mnt.persistence.base;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;


@Repository
public class ShareDao extends SqlSessionDaoSupport {

	public void save(String key, Object object) {
		getSqlSession().insert(key, object);
	}

	public void delete(String key, Serializable id) {
		getSqlSession().delete(key, id);
	}
	
	public void delete(String key, Object object) {
		getSqlSession().delete(key, object);
	}

	public <T> T selectOne(String key, Object object) {
		return getSqlSession().selectOne(key, object);
	}
	
	public <T> T selectOne(String key) {
		return getSqlSession().selectOne(key);
	}
	
	public <T> List<T> selectList(String key) {
		return getSqlSession().selectList(key);
	}
	
	public <E> List<E> selectList(String key, Object object) {
		return getSqlSession().selectList(key, object);
	}
	
	public <E> List<E> selectList(String key, Object object,int offset, int pageSize) {
		return getSqlSession().selectList(key, object, new RowBounds(offset, pageSize));
	}
	
	public void update(String key, Object object) {
		getSqlSession().update(key, object);
	}
	
}
