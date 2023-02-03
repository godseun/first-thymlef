package com.daehwa.b2b.shop.service;

import com.daehwa.b2b.common.cache.CommonCodeDao;
import com.daehwa.b2b.common.util.ClassLoader;
import com.daehwa.b2b.shop.dao.ShopSearchDao;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ShopSearchService {

  @Autowired
  private CommonCodeDao cacheDao;

  @Autowired
  private ShopSearchDao shopSearchDao;

  public Map<String, Object> getMainList(Map<String, Object> param) {
    Map<String, Object> result = ClassLoader.loadHashMap();
    List<Map<String, Object>> D1 = new ArrayList<Map<String, Object>>();
    List<Map<String, Object>> D2 = new ArrayList<Map<String, Object>>();
    List<Map<String, Object>> D3 = new ArrayList<Map<String, Object>>();
    List<Map<String, Object>> D4 = new ArrayList<Map<String, Object>>();
    List<Map<String, Object>> D5 = new ArrayList<Map<String, Object>>();
    List<Map<String, Object>> D6 = new ArrayList<Map<String, Object>>();

    List<Map<String, Object>> list = cacheDao.getMainPrdtList(param);
    Iterator<Map<String, Object>> it = list.iterator();

    List<Map<String, Object>> tsp = new ArrayList<Map<String, Object>>();
    while (it.hasNext()) {
      Map<String, Object> map = it.next();
      String sId = (String) map.get("sId");
      if ("TSP".equals(sId)) {
        tsp.add(map);
      } else if ("D1".equals(sId)) {
        D1.add(map);
      } else if ("D2".equals(sId)) {
        D2.add(map);
      } else if ("D3".equals(sId)) {
        D3.add(map);
      } else if ("D4".equals(sId)) {
        D4.add(map);
      } else if ("D5".equals(sId)) {
        D5.add(map);
      } else if ("D6".equals(sId)) {
        D6.add(map);
      }
    }
    result.put("tsp", tsp);
    result.put("D1", D1);
    result.put("D2", D2);
    result.put("D3", D3);
    result.put("D4", D4);
    result.put("D5", D5);
    result.put("D6", D6);
    return result;
  }

  public List<Map<String, Object>> getBanner(Map<String, Object> param) {
    return cacheDao.getBanner(param);
  }

  public List<Map<String, Object>> getTagList(Map<String, Object> param) {
    return cacheDao.getMMainPrdtList(param);
  }

  public List<Map<String, Object>> getTSList(Map<String, Object> param) {
    List<Map<String, Object>> tsp = new ArrayList<Map<String, Object>>();
    List<Map<String, Object>> list = cacheDao.getMainPrdtList(param);
    Iterator<Map<String, Object>> it = list.iterator();
    while (it.hasNext()) {
      Map<String, Object> map = it.next();
      String sId = (String) map.get("sId");
      if ("TSP".equals(sId)) {
        tsp.add(map);
      }
    }
    return tsp;
  }
}
