package com.daehwa.b2b.admin.service;

import com.daehwa.b2b.admin.dao.AdminDao;
import com.daehwa.b2b.common.util.SessionUtil;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminService {

  @Autowired
  private AdminDao adminDao;

  public List<Map<String, Object>> getBbsList(Map<String, Object> param)
    throws Exception {
    SessionUtil.setUserInfo(param);
    return adminDao.getBbsList(param);
  }

  public void addAns(Map<String, Object> param) throws Exception {
    SessionUtil.setUserInfo(param);
    adminDao.addAns(param);
  }
}
