package com.daehwa.b2b.front.dao;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FrontCustomerDao {
  public List<Map<String, Object>> getBbsDashBoard(Map<String, Object> tMap);

  public void saveSheetCont(Map<String, Object> tMap);

  public void confirmStore(Map<String, Object> tMap);

  public void confirmUser(Map<String, Object> tMap);

  public void saveStore(Map<String, Object> tMap);

  public void saveContMsg(Map<String, Object> tMap);

  public void setUsrLv(Map<String, Object> tMap);

  public void setEst(Map<String, Object> tMap);

  public void setEstPrdt(Map<String, Object> tMap);

  public void replyEst(Map<String, Object> tMap);

  public String reqCRM(Map<String, Object> param);

  public void insCrmDTL(Map<String, Object> param);

  public void setSttusCRM(Map<String, Object> param);

  public void setTaxInfo(Map<String, Object> param);

  public void setNoti(Map<String, Object> param);

  public void repNoti(Map<String, Object> tMap);

  public void setCrmUsr(Map<String, Object> tMap);

  public void setMissCall(Map<String, Object> param);

  public void setReply(Map<String, Object> tMap);

  public String setArsUsr(Map<String, Object> param);

  public List<Map<String, Object>> getAddrList(Map<String, Object> param);

  public void setBaseAddr(Map<String, Object> param);

  public void addAddr(Map<String, Object> param);

  public void delAddr(Map<String, Object> param);

  public void addCart(Map<String, Object> param);

  public void delCartHist(Map<String, Object> param);

  public void delCart(Map<String, Object> param);

  public void uptCart(Map<String, Object> param);

  public List<Map<String, Object>> getUsrCart(Map<String, Object> param);

  public List<Map<String, Object>> getCartChk(Map<String, Object> param);

  public Map<String, Object> chkZoneTp(Map<String, Object> param);

  public int setTmpOrderMst(Map<String, Object> param);

  public void setTmpOrderDtl(Map<String, Object> param);

  public String setTmpOrderPay(Map<String, Object> param);
}
