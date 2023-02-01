package com.daehwa.b2b.shop.service;

import java.util.List;
import java.util.Map;
import org.springframework.web.multipart.MultipartFile;

public interface ShopUserService {
  public Map<String, Object> getView(Map<String, Object> param)
    throws Exception;

  public void updateLoginInfo(Map<String, Object> param) throws Exception;

  public void addAddr(Map<String, Object> param) throws Exception;

  public void delAddr(Map<String, Object> param) throws Exception;

  public List<Map<String, Object>> getAddr(Map<String, Object> param)
    throws Exception;

  public List<Map<String, Object>> getAddrList(Map<String, Object> param)
    throws Exception;

  public String insertAuthSMS(Map<String, Object> param) throws Exception;

  public String setPassWord(Map<String, Object> param) throws Exception;

  public void setPassWord2(Map<String, Object> param) throws Exception;

  public String sendSetMail(Map<String, Object> param) throws Exception;

  public Map<String, Object> getalarm(Map<String, Object> param)
    throws Exception;

  public void setAlarm(Map<String, Object> param) throws Exception;

  public void chgInfo(Map<String, Object> param) throws Exception;

  public void chgInfo(Map<String, Object> param, List<MultipartFile> mFile)
    throws Exception;

  public void addFav(Map<String, Object> param) throws Exception;

  public void delFav(Map<String, Object> param) throws Exception;

  public List<Map<String, Object>> getFavList(Map<String, Object> param)
    throws Exception;

  public String chkUrl(Map<String, Object> param) throws Exception;

  public Map<String, Object> getList(Map<String, Object> param)
    throws Exception;

  public Map<String, Object> getProfile(Map<String, Object> param)
    throws Exception;

  public Map<String, Object> getPhotoList(Map<String, Object> param)
    throws Exception;

  public Map<String, Object> getLikeList(Map<String, Object> param)
    throws Exception;

  public boolean existEmail(Map<String, Object> param) throws Exception;

  public boolean existEncEmail(Map<String, Object> param) throws Exception;

  public boolean existNickname(Map<String, Object> param) throws Exception;

  public void insert(Map<String, Object> param, List<MultipartFile> file)
    throws Exception;

  public void update(
    Map<String, Object> param,
    List<MultipartFile> file,
    String[] deleteFile
  ) throws Exception;

  public int checkPasswordCount(Map<String, Object> param) throws Exception;

  public void updatePassword(Map<String, Object> param) throws Exception;

  public void updateNewPassword(Map<String, Object> param) throws Exception;

  public void updatePushStatus(Map<String, Object> param) throws Exception;

  public void updatePushId(Map<String, Object> param) throws Exception;

  public Map<String, Object> getInfo(Map<String, Object> param)
    throws Exception;

  public void dropOut(Map<String, Object> param) throws Exception;
}
