package com.daehwa.b2b.shop.service;

import com.daehwa.b2b.shop.dao.ShopLogDao;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ShopLogService {

  @Autowired
  private ShopLogDao logDao;

  public void insertLog(Map<String, Object> param) throws Exception {
    logDao.setLog(param);
  }

  public Map<String, Object> getList(Map<String, Object> paramMap)
    throws Exception {
    throw new Error(
      "Unresolved compilation problems: \n\tThe method getList(Map<String,Object>) is undefined for the type ShopLogDao\n\tThe method getListCount(Map<String,Object>) is undefined for the type ShopLogDao\n"
    );
  }
}
