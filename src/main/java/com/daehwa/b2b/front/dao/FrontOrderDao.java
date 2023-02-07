package com.daehwa.b2b.front.dao;

import java.util.Map;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FrontOrderDao {
  public Map<String, Object> getIniOrdrInfo(Map<String, Object> map);

  public Map<String, Object> getOrdrMst(Map<String, Object> param);

  public void setOrderInvoice(Map<String, Object> map);

  public void setOrderMstInvoice(Map<String, Object> map);

  public void setOrderSttus(Map<String, Object> map);

  public void setOrderSttus2(Map<String, Object> map);

  public void setIniOrdrMst(Map<String, Object> map);

  public void setRefOrdrPay(Map<String, Object> map);

  public void setRefOrdrMst(Map<String, Object> map);

  public void setRefOrdrStr(Map<String, Object> map);

  public void setRefOrdrDtl(Map<String, Object> map);

  public void saveOrdrRmk(Map<String, Object> map);

  public void setHightLight(Map<String, Object> map);

  public void setAcceptMstSttus(Map<String, Object> map);

  public void setAcceptSttus(Map<String, Object> map);

  public void setCopyCart(Map<String, Object> map);

  public void setSplitQy(Map<String, Object> tMap);

  public void uptRtnReq(Map<String, Object> tMap);

  public void insOdrReq(Map<String, Object> tMap);

  public int setRtnMsg(Map<String, Object> tMap);

  public void setRtnCan(Map<String, Object> tMap);

  public void setRefundPay(Map<String, Object> tMap);

  public void canOrderDtl(Map<String, Object> tMap);

  public void insOrderStrMstHist(Map<String, Object> tMap);

  public void canOrderStrMst(Map<String, Object> tMap);

  public void insOrderMstHist(Map<String, Object> tMap);

  public void canOrderMst(Map<String, Object> tMap);

  public void canOrderPay(Map<String, Object> tMap);

  public void setStrCnt(Map<String, Object> tMap);

  public void insRtnDvyFee(Map<String, Object> tMap);

  public void setRtnDvyStrMst(Map<String, Object> tMap);

  public void setRtnDvyMst(Map<String, Object> tMap);

  public void setRtnDvyPay(Map<String, Object> tMap);
}
