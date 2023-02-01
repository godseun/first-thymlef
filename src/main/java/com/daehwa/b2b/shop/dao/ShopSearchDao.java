package com.daehwa.b2b.shop.dao;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ShopSearchDao {
  public List<Map<String, Object>> getCombo(Map<String, Object> param);

  public List<Map<String, Object>> ajaxSuggest(Map<String, Object> param);

  public List<Map<String, Object>> getMainSerchList(Map<String, Object> param);

  public List<Map<String, Object>> getMainSercCategList(
    Map<String, Object> param
  );

  public List<Map<String, Object>> getMainSerchMakerList(
    Map<String, Object> param
  );

  public List<Map<String, Object>> getMakerList(Map<String, Object> param);

  public List<Map<String, Object>> getMainList(Map<String, Object> param);

  public Map<String, Object> getPrdtInfo(Map<String, Object> param);

  public List<Map<String, Object>> getStndrdList(Map<String, Object> param);

  public Map<String, Object> getCategInfo(Map<String, Object> param);

  public List<Map<String, Object>> getEbookPrdtList(Map<String, Object> param);

  public List<Map<String, Object>> getCategList(Map<String, Object> param);

  public List<Map<String, Object>> getCategList2(Map<String, Object> param);

  public List<Map<String, Object>> getCategList3(Map<String, Object> param);

  public List<Map<String, Object>> getCategList1(Map<String, Object> param);

  public List<Map<String, Object>> getCategList4(Map<String, Object> param);

  public List<Map<String, Object>> getCategSearchList(
    Map<String, Object> param
  );

  public int getCategSearchCnt(Map<String, Object> param);

  public int getCategListCnt(Map<String, Object> param);

  public List<Map<String, Object>> categList(Map<String, Object> param);

  public List<Map<String, Object>> getBanner(Map<String, Object> param);

  public List<Map<String, Object>> getMainPrdtList(Map<String, Object> param);

  public List<Map<String, Object>> getCatalogList(Map<String, Object> param);

  public List<Map<String, Object>> getRecommendList(Map<String, Object> param);

  public List<Map<String, Object>> getQnaList(Map<String, Object> param);

  public Map<String, Object> view(Map<String, Object> param);

  public String insertAuthNo(Map<String, Object> param);

  public int insertSMS(Map<String, Object> param);

  public List<Map<String, Object>> getMovieList(Map<String, Object> param);

  public List<Map<String, Object>> getTegCategList(Map<String, Object> param);

  public int getTegCategListCnt(Map<String, Object> param);

  public Object getSetSearchList(Map<String, Object> param);

  public int getSetSearchListCnt(Map<String, Object> param);

  public List<Map<String, Object>> getSetItemList(Map<String, Object> param);

  public List<Map<String, Object>> getAdPrdtList(Map<String, Object> param);
}
