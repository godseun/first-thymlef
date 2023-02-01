package com.daehwa.b2b.shop.service;

import java.util.List;
import java.util.Map;

public interface ShopHelpDeskService {
  public void insertQNA(Map<String, Object> param) throws Exception;

  public void writePrductQna(Map<String, Object> param) throws Exception;

  public void writePartner(Map<String, Object> param) throws Exception;

  public List<Map<String, Object>> getBbsList(Map<String, Object> param)
    throws Exception;

  public List<Map<String, Object>> getBbsCnt(Map<String, Object> param)
    throws Exception;

  public List<Map<String, Object>> getPromoList(Map<String, Object> param)
    throws Exception;

  public Map<String, Object> getPromoDtl(Map<String, Object> param)
    throws Exception;

  public Map<String, Object> getCategPromoDtl(Map<String, Object> param)
    throws Exception;

  public List<Map<String, Object>> getQnaList(Map<String, Object> param)
    throws Exception;

  public List<Map<String, Object>> getEstimateList(Map<String, Object> param)
    throws Exception;

  public String setEestimateMst(Map<String, Object> param) throws Exception;

  public void setEestimatePrdt(Map<String, Object> param) throws Exception;

  public void delEstPrdt(Map<String, Object> param) throws Exception;

  public void reqEst(Map<String, Object> param) throws Exception;

  public Map<String, Object> getEstimateInfo(Map<String, Object> param)
    throws Exception;

  public List<Map<String, Object>> getEstimatePrdt(Map<String, Object> param)
    throws Exception;

  public Map<String, Object> getEstDocInfo(Map<String, Object> param)
    throws Exception;

  public List<Map<String, Object>> getEstDocPrdt(Map<String, Object> param)
    throws Exception;

  public void canEst(Map<String, Object> param) throws Exception;

  public List<Map<String, Object>> getPopList(Map<String, Object> param)
    throws Exception;
}
