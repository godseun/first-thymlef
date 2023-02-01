package com.daehwa.b2b.shop.dao;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ShopUserDao {
  public Map<String, Object> view(Map<String, Object> param);

  //  ;String queryId = "ShopUserDao.view"; // 일반회원

  // 	if(joinUserId != null && !"".equals(joinUserId.trim())) {
  // 		queryId = "ShopUserDao.view2"; // SNS 아이디 로그인 회원
  // 	}

  // 	return (Map<String, Object>) select(queryId, param);
  // }

  public Map<String, Object> view2(Map<String, Object> param);

  public List<Map<String, Object>> getAddr(Map<String, Object> param);

  public List<Map<String, Object>> getAddrList(Map<String, Object> param);

  public void updatePw(Map<String, Object> param);

  public void updatePw2(Map<String, Object> param);

  public void updateLoginInfo(Map<String, Object> param);

  public void setBaseAddr(Map<String, Object> param);

  public void addAddr(Map<String, Object> param);

  public void delAddr(Map<String, Object> param);

  public void addFav(Map<String, Object> param);

  public Map<String, Object> getalarm(Map<String, Object> param);

  public void setAlarm(Map<String, Object> param);

  public void chgInfo(Map<String, Object> param);

  public List<Map<String, Object>> getFavList(Map<String, Object> param);

  public List<Map<String, Object>> list(Map<String, Object> param);

  public int listCount(Map<String, Object> param);

  public Map<String, Object> profile(Map<String, Object> param);

  public List<Map<String, Object>> photoList(Map<String, Object> param);

  public int photoListCount(Map<String, Object> param);

  public List<Map<String, Object>> likeList(Map<String, Object> param);

  public int likeListCount(Map<String, Object> param);

  public Integer existEmail(Map<String, Object> param);

  public Integer existEncEmail(Map<String, Object> param);

  public Integer existNickname(Map<String, Object> param);

  public int insert(Map<String, Object> param);

  public void update(Map<String, Object> param);

  public int checkPasswordCount(Map<String, Object> param);

  public void updatePassword(Map<String, Object> param);

  public void updateNewPassword(Map<String, Object> param);

  public void updatePushStatus(Map<String, Object> param);

  public void updatePushId(Map<String, Object> param);

  public void delFav(Map<String, Object> tmpParm);

  public void setTaxInfo(Map<String, Object> param);

  public Map<String, Object> getInfo(Map<String, Object> param);

  public void dropOut(Map<String, Object> param);
}
