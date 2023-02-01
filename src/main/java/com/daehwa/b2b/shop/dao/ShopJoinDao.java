package com.daehwa.b2b.shop.dao;

import java.util.Map;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ShopJoinDao {
  public Map<String, Object> view(Map<String, Object> param);

  public String cntEmail(Map<String, Object> param);

  public String chkUsrId(Map<String, Object> param);

  public String checkBusiNo(Map<String, Object> param);

  public String insert(Map<String, Object> param);

  public String shopInsert(Map<String, Object> param);

  public void shopAdminInsert(Map<String, Object> param);

  public void update(Map<String, Object> param);

  public void apply(Map<String, Object> param);

  public void cancel(Map<String, Object> param);
}
