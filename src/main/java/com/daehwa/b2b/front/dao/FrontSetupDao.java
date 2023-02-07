package com.daehwa.b2b.front.dao;

import java.util.Map;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FrontSetupDao {
  public void setCodeMst(Map<String, Object> tMap);

  public void setCodeDtl(Map<String, Object> tMap);

  public void setMakerCd(Map<String, Object> tMap);

  public void setAdminMng(Map<String, Object> tMap);
}
