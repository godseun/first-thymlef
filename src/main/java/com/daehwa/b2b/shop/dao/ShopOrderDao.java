package com.daehwa.b2b.shop.dao;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ShopOrderDao {
  public List<Map<String, Object>> getOrdrList(Map<String, Object> param);

  public List<Map<String, Object>> getOrdrListChk(Map<String, Object> param);

  public List<Map<String, Object>> getOrdrStrMst(Map<String, Object> param);

  public Map<String, Object> getOrdrMst(Map<String, Object> param);

  public List<Map<String, Object>> getCart(Map<String, Object> param);

  public List<Map<String, Object>> getCartChk(Map<String, Object> param);

  public Map<String, Object> chkZoneTp(Map<String, Object> param);

  public Map<String, Object> chkZoneTpByAddr(Map<String, Object> param);

  public void addCart(Map<String, Object> param);

  public void setCart(Map<String, Object> param);

  public void delCartHist(Map<String, Object> param);

  public void delCart(Map<String, Object> param);

  public void orderDecision(Map<String, Object> param);

  public int setTmpOrderMst(Map<String, Object> tmp);

  public void setTmpOrderDtl(Map<String, Object> param);

  public String setTmpOrderPay(Map<String, Object> param);

  public String setOrderPay(Map<String, String> param);

  public void setOrderMst(Map<String, String> param);

  public void setOrderStrMst(Map<String, String> param);

  public void setOrderDtl(Map<String, String> param);

  public void delOrderCart(Map<String, String> param);

  public void setOrderInfo(Map<String, String> param);

  public int chageAddr(Map<String, Object> param);

  public void setOrderMstSttus(Map<String, Object> param);

  public int uptOrderPay(Map<String, String> param);

  public void uptOrderStrMst(Map<String, String> param);

  public void uptOrderDtl(Map<String, String> param);

  public void canOrderDtl(Map<String, Object> param);

  public void canOrderStrMst(Map<String, Object> param);

  public void canOrderMst(Map<String, Object> param);

  public void canOrderPay(Map<String, Object> param);

  public void setRefundPay(Map<String, Object> param);

  public void insOrderStrMstHist(Map<String, Object> param);

  public void chgOrderStrMst(Map<String, Object> param);

  public void insOrderMstHist(Map<String, Object> param);

  public void chgOrderMst(Map<String, Object> param);

  public int reqReturn(Map<String, Object> param);

  public void setOrderChg(Map<String, Object> param);

  public Map<String, Object> getOrdrInfo(Map<String, Object> param);

  public void setOrderConf(Map<String, Object> param);

  public void setOrderConfStrMst(Map<String, Object> param);

  public void setOrderConfDtl(Map<String, Object> param);

  public String getTidToOrderId(Map<String, Object> param);

  public List<Map<String, Object>> getOrdrSm(Map<String, String> param);
}
