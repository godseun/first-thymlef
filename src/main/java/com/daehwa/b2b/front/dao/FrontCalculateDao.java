package com.daehwa.b2b.front.dao;

import java.util.Map;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FrontCalculateDao {
  public void setTruncMagam(Map<String, Object> param);

  public void setMagamDt(Map<String, Object> param);

  public void setMagamTmpList(Map<String, Object> param);

  public void setStrMagam(Map<String, Object> param);

  public void insStrMagam(Map<String, Object> param);

  public void insTaxBill(Map<String, Object> param);

  public void setStrTaxBill(Map<String, Object> param);

  public void insSalesData(Map<String, Object> param);

  public void insSalesSUm(Map<String, Object> param);

  public void delSalesData(Map<String, Object> param);

  public void delSalesSUm(Map<String, Object> param);

  public void setIniBill(Map<String, Object> param);

  public void setIniBillSum(Map<String, Object> param);
}
