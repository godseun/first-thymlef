package com.daehwa.b2b.front.dao;

import java.util.Map;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FrontProductDao {
  public void setTmpPrdt(Map<String, Object> tMap);

  public void setPrdtDtl(Map<String, Object> tMap);

  public void setPrdtMst(Map<String, Object> tMap);

  public void saveMovieInfo(Map<String, Object> tMap);

  public void setMovieInfo(Map<String, Object> tMap);

  public void setImgDtl(Map<String, Object> tmpSheet);

  public void insertPrdtMstHist(Map<String, Object> tMap);

  public void savePrdtInfoMst(Map<String, Object> tMap);

  public void insertPrdtDtlHist(Map<String, Object> tMap);

  public void savePrdtInfoDtl(Map<String, Object> tMap);

  public void insertPrdtDtlHistArry(Map<String, Object> tMap);

  public void setSoldOut(Map<String, Object> tMap);

  public void setNoSale(Map<String, Object> tMap);

  public void setOnSale(Map<String, Object> tMap);

  public void saveItemPkgMst(Map<String, Object> tMap);

  public void delItemPkg(Map<String, Object> tMap);

  public void setSalePromo(Map<String, Object> tMap);

  public void setPrdtPrice(Map<String, Object> tMap);

  public void setSalePrdt(Map<String, Object> tMap);

  public void delSalePrdt(Map<String, Object> tMap);

  public void delSalePromo(Map<String, Object> tMap);

  public void saveItemSetMst(Map<String, Object> tMap);
}
