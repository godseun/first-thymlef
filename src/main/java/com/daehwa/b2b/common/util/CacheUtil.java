package com.daehwa.b2b.common.util;

import java.util.List;
import java.util.Map;
import net.sf.ehcache.Ehcache;
import net.sf.ehcache.Element;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

// @Component
public class CacheUtil {

  public static final String COMMON_PRDT_LIST = "CACHE_PRDT_LIST";
  public static final String COMMON_M_PRDT_LIST = "CACHE_M_PRDT_LIST";
  public static final String COMMON_BANNER_LIST = "CACHE_BANNER_LIST";

  @Autowired
  Ehcache ehcache;

  public void setCache(String cacheKey, Object value) {
    Ehcache cache = ehcache.getCacheManager().getCache(cacheKey);
    cache.put(new Element(cacheKey, value));
  }

  public Element getCache(String cacheKey) {
    Ehcache cache = ehcache.getCacheManager().getCache(cacheKey);

    return cache.get(cacheKey);
  }

  @SuppressWarnings("unchecked")
  public List<Map<String, Object>> getListMap(String cacheKey) {
    //System.out.println("1212 : " );
    Element element = getCache(cacheKey);
    //System.out.println("34343 : " );
    return (List<Map<String, Object>>) element.getObjectValue();
  }

  public List<Map<String, Object>> getMMainPrdtList() {
    return getListMap(COMMON_M_PRDT_LIST);
  }

  public List<Map<String, Object>> getMainPrdtList() {
    return getListMap(COMMON_PRDT_LIST);
  }

  public List<Map<String, Object>> getBanner() {
    return getListMap(COMMON_BANNER_LIST);
  }
}
