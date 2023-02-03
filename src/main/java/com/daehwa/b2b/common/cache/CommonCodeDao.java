package com.daehwa.b2b.common.cache;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommonCodeDao {
  // @Cacheable(value = "")
  public List<Map<String, Object>> getList(Map<String, Object> param);

  // @Cacheable(value = "")
  public List<Map<String, Object>> getMainPrdtList(Map<String, Object> param);

  // @Cacheable(value = "")
  public List<Map<String, Object>> getMMainPrdtList(Map<String, Object> param);

  // @Cacheable(value = "")
  public List<Map<String, Object>> getBanner(Map<String, Object> param);
  // public List<Map<String, Object>> comboList(Map<String, Object> param);

  // public Map<String, Object> sheetCombo(Map<String, Object> param);

  // public Map<String, Object> sheetCategCombo(Map<String, Object> param);

  // public String getCodeText(Map<String, Object> result);

  // public Map<String, Object> getSheetMaker(Map<String, Object> param);

  // public List<Map<String, Object>> getPopMaker(Map<String, Object> param);
}
