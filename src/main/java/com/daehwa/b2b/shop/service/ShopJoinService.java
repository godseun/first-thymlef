package com.daehwa.b2b.shop.service;

import java.util.Map;

public interface ShopJoinService {
  public Map<String, Object> getView(Map<String, Object> param)
    throws Exception;

  public String getCntEmail(Map<String, Object> param) throws Exception;

  public String insertAuthSMS(Map<String, Object> param) throws Exception;

  public String checkAuthNo(Map<String, Object> param) throws Exception;

  public String chkUsrId(Map<String, Object> param) throws Exception;

  public void insert(Map<String, Object> param) throws Exception;
}
