package com.daehwa.b2b.shop.service;

import java.util.List;
import java.util.Map;

public interface ShopSearchService {
  public List<Map<String, Object>> getCombo(Map<String, Object> param)
    throws Exception;

  public List<Map<String, Object>> ajaxSuggest(Map<String, Object> param)
    throws Exception;

  public Map<String, Object> ajaxPrductList(Map<String, Object> param)
    throws Exception;

  public Map<String, Object> getMainList(Map<String, Object> param)
    throws Exception;

  public Map<String, Object> getMainSearchList(Map<String, Object> param)
    throws Exception;

  public Map<String, Object> getCategSearchList(Map<String, Object> param)
    throws Exception;

  public Map<String, Object> getView(Map<String, Object> param)
    throws Exception;

  public List<Map<String, Object>> getBanner(Map<String, Object> param)
    throws Exception;

  public List<Map<String, Object>> getTagList(Map<String, Object> param)
    throws Exception;

  public Map<String, Object> getCategSearch(Map<String, Object> param)
    throws Exception;

  public List<Map<String, Object>> getEbookPrdtList(Map<String, Object> param)
    throws Exception;

  public void setViewCount(Map<String, Object> param) throws Exception;

  public Map<String, Object> getTagSearchList(Map<String, Object> param)
    throws Exception;

  public List<Map<String, Object>> getTSList(Map<String, Object> param)
    throws Exception;

  public Map<String, Object> getSetSearchList(Map<String, Object> param)
    throws Exception;
  //public List<Map<String, Object>> getCteg(Map<String, Object> param) throws Exception;
}
