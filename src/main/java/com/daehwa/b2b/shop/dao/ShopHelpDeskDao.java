package com.daehwa.b2b.shop.dao;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ShopHelpDeskDao {
  public void insertQNA(Map<String, Object> param);

  public List<Map<String, Object>> getBbsList(Map<String, Object> param);

  public List<Map<String, Object>> getBbsCnt(Map<String, Object> param);

  public List<Map<String, Object>> getPromoPrdt(Map<String, Object> param);

  public List<Map<String, Object>> getPromoInfo(Map<String, Object> param);

  public List<Map<String, Object>> getCategPromoPrdt(Map<String, Object> param);

  public List<Map<String, Object>> getPromoList(Map<String, Object> param);

  public List<Map<String, Object>> getQnaList(Map<String, Object> param);

  public List<Map<String, Object>> getEstimateList(Map<String, Object> param);

  public Map<String, Object> getEstimateInfo(Map<String, Object> param);

  public String setEestimateMst(Map<String, Object> param);

  public void setEestimatePrdt(Map<String, Object> param);

  public List<Map<String, Object>> getEstimatePrdt(Map<String, Object> param);

  public void delEstPrdt(Map<String, Object> param);

  public void uptEstPrdt(Map<String, Object> param);

  public void reqEst(Map<String, Object> param);

  public Map<String, Object> getEstDocInfo(Map<String, Object> param);

  public List<Map<String, Object>> getEstDocPrdt(Map<String, Object> param);

  public void canEst(Map<String, Object> param);

  public List<Map<String, Object>> getPopList(Map<String, Object> param);
}
