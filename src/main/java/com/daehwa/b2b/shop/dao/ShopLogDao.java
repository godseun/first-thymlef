package com.daehwa.b2b.shop.dao;

import java.util.Map;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ShopLogDao {
  public void setLog(Map<String, Object> param);

  public void setKeyWord(Map<String, Object> param);

  public void setViewCount(Map<String, Object> param);
}
