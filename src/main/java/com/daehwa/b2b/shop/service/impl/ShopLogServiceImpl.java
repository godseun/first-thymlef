package com.daehwa.b2b.shop.service.impl;

import com.daehwa.b2b.shop.dao.ShopLogDao;
import com.daehwa.b2b.shop.service.ShopLogService;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public class ShopLogServiceImpl implements ShopLogService {

  @Autowired
  private ShopLogDao logDao;

  @Override
  public void insertLog(Map<String, Object> param) throws Exception {
    logDao.setLog(param);
  }

  @Override
  public Map<String, Object> getList(Map<String, Object> paramMap)
    throws Exception {
    throw new Error(
      "Unresolved compilation problems: \n\tThe method getList(Map<String,Object>) is undefined for the type ShopLogDao\n\tThe method getListCount(Map<String,Object>) is undefined for the type ShopLogDao\n"
    );
  }
}
