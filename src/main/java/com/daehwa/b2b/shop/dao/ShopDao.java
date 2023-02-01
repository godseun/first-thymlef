package com.daehwa.b2b.shop.dao;

import java.util.Map;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ShopDao {
  public String getRandNo(Map<String, Object> param);

  public String checkMobileNo(Map<String, Object> param);

  public String checkMobileNo2(Map<String, Object> param);

  public String checkEmail(Map<String, Object> param);

  public String checkUri(Map<String, Object> param);

  public String checkAuthNo(Map<String, Object> param);

  public String insertAuthNo(Map<String, Object> param);

  public void updateAuthNo(Map<String, Object> param);
}
