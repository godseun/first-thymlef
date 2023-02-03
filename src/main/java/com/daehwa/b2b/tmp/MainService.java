package com.daehwa.b2b.tmp;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

@Service
public class MainService {

  @Autowired
  private MainDao dao;

  public List<Map<String, Object>> getSelect() {
    return dao.getSelect();
  }

  @Cacheable(value = "getSelect2")
  public List<Map<String, Object>> getSelect2() {
    return dao.getSelect2();
  }
}
