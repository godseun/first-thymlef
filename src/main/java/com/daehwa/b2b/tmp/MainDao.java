package com.daehwa.b2b.tmp;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MainDao {
  public List<Map<String, Object>> getSelect();

  public List<Map<String, Object>> getSelect2();
}
