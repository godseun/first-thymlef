package com.daehwa.b2b.shop.service;

import java.util.List;
import java.util.Map;

public interface ShopOrderService {
  public List<Map<String, Object>> getCart(Map<String, Object> param)
    throws Exception;

  public List<Map<String, Object>> getCartChk(Map<String, Object> param)
    throws Exception;

  public Map<String, Object> doPay(Map<String, Object> param) throws Exception;

  public Map<String, Object> endPay(Map<String, String> param) throws Exception;

  public boolean recvDepositNotice(Map<String, String> param) throws Exception;

  public Map<String, Object> setOrdrCan(Map<String, Object> param)
    throws Exception;

  public Map<String, Object> setOrdrRef(Map<String, Object> param)
    throws Exception;

  public List<Map<String, Object>> getOrdrList(Map<String, Object> param)
    throws Exception;

  public List<Map<String, Object>> getOrdrListChk(Map<String, Object> param)
    throws Exception;

  public List<Map<String, Object>> getOrdrStrMst(Map<String, Object> param)
    throws Exception;

  public Map<String, Object> getOrdrMst(Map<String, Object> param)
    throws Exception;

  public void addCart(Map<String, Object> param) throws Exception;

  public void setCart(Map<String, Object> param) throws Exception;

  public void delCart(Map<String, Object> param) throws Exception;

  public void orderDecision(Map<String, Object> param) throws Exception;

  public int chageAddr(Map<String, Object> param) throws Exception;

  public Map<String, Object> getOrdrInfo(Map<String, Object> param)
    throws Exception;

  public Map<String, Object> endConf(Map<String, Object> param)
    throws Exception;
}
