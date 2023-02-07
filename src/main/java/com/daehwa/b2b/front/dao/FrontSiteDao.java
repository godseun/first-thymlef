package com.daehwa.b2b.front.dao;

import java.util.Map;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FrontSiteDao {
  public String setBoard(Map<String, Object> param);

  public String setPromo(Map<String, Object> param);

  public void setPromoPrdt(Map<String, Object> param);

  public void delPromoPrdt(Map<String, Object> param);

  public void delMDPrdt(Map<String, Object> tMap);

  public void setMDPrdt(Map<String, Object> tMap);
}
