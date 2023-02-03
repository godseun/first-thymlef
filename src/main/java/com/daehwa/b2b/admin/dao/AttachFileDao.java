package com.daehwa.b2b.admin.dao;

import com.daehwa.b2b.admin.domain.AttachFile;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AttachFileDao {
  public List<AttachFile> list(Map<String, Object> param);

  public List<AttachFile> list2(Map<String, Object> param);

  public int listCount(Map<String, Object> param);

  public AttachFile view(int fileId);

  public void insert(AttachFile attachFile);

  public void insert2(AttachFile attachFile);

  public void delete(AttachFile attachFile);

  public void delete2(Map<String, Object> param);

  public void deleteAll(Map<String, Object> param);

  public void insertSheetFile(HashMap<String, Object> fileMap);

  public void deleteSheetFile(Map<String, Object> tmpMap);
}
