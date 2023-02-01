package com.daehwa.b2b.shop.service;

import java.util.Map;

public interface ShopLogService {
  public void insertLog(Map<String, Object> param) throws Exception;

  public Map<String, Object> getList(Map<String, Object> param)
    throws Exception;
}
