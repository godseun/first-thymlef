package com.daehwa.b2b.admin.dao;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminDao {
  public List<Map<String, Object>> getBbsList(Map<String, Object> param);

  public void addAns(Map<String, Object> param);
}
