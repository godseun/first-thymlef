package com.daehwa.b2b.admin.service;

import com.daehwa.b2b.admin.dao.AttachFileDao;
import com.daehwa.b2b.admin.domain.AttachFile;
import com.daehwa.b2b.common.util.AttachFileUtil;
import com.daehwa.b2b.common.util.ClassLoader;
import com.daehwa.b2b.common.util.Constant;
import java.util.List;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class AttachFileService {

  private static final Logger logger = LoggerFactory.getLogger(
    AttachFileService.class
  );

  @Autowired
  private AttachFileDao attachFileDao;

  public List<AttachFile> getList(Map<String, Object> param) throws Exception {
    return attachFileDao.list(param);
  }

  public List<AttachFile> getList(
    Map<String, Object> param,
    String articleIdKey
  ) throws Exception {
    int articleId = -1;

    if (param.containsKey(articleIdKey) && param.get(articleIdKey) != null) {
      articleId = Integer.valueOf(param.get(articleIdKey).toString());
    }

    param.put("articleId", articleId);

    return getList(param);
  }

  public AttachFile getView(int articleId) throws Exception {
    return attachFileDao.view(articleId);
  }

  public void insert(
    List<MultipartFile> multipartFileList,
    String bbsId,
    int articleId
  ) throws Exception {
    List<AttachFile> attachFileList = AttachFileUtil.getAttachFileInfoList(
      multipartFileList,
      bbsId,
      articleId
    );
    logger.info("==================업로드 시작======================>");
    try {
      logger.info("==================파일 전송 시작=======================>");
      AttachFileUtil.transferFileListToRepository(attachFileList);
      logger.info("==================파일 전송 완료=======================>");
    } catch (Exception e2) {
      logger.info(
        "==================파일 전송중 오류 발생=======================>"
      );
      logger.info(
        "==================전송 완료 파일 삭제 시작=======================>"
      );
      AttachFileUtil.removeFileListToRepository(attachFileList);
      logger.info(
        "==================전송 완료 파일 삭제 완료=======================>"
      );
      throw e2;
    }
    try {
      if ("TMP_IMG".equals(bbsId)) {
        for (AttachFile attachFile : attachFileList) {
          attachFileDao.insert2(attachFile);
        }
      } else {
        for (AttachFile attachFile : attachFileList) {
          attachFileDao.insert(attachFile);
        }
      }
    } catch (Exception e1) {
      logger.info(
        "==================파일 데이터 DB 저장 중 오류 발생=======================>"
      );
      throw e1;
    }
    logger.info("==================업로드 완료=======================>");
  }

  public void update(
    List<MultipartFile> multipartFileList,
    String[] deleteFile,
    String bbsId,
    int articleId
  ) throws Exception {
    Map<String, Object> maps = AttachFileUtil.getFileInfoToMap(
      bbsId,
      articleId
    );

    List<AttachFile> repositoryFileList = attachFileDao.list(maps);

    List<AttachFile> deleteFileList = AttachFileUtil.getDeleteFileList(
      repositoryFileList,
      deleteFile
    );

    List<AttachFile> attachFileList = AttachFileUtil.getAttachFileInfoList(
      multipartFileList,
      bbsId,
      articleId
    );

    logger.info(
      "==================파일 데이터 DB 삭제 시작======================>"
    );

    for (AttachFile attachFile : deleteFileList) {
      attachFileDao.delete(attachFile);
    }

    logger.info(
      "==================파일 데이터 DB 삭제 완료======================>"
    );

    logger.info("==================파일 삭제 시작======================>");

    AttachFileUtil.removeFileListToRepository(deleteFileList);

    logger.info("==================파일 삭제 완료======================>");

    logger.info("==================업로드 시작======================>");

    try {
      for (AttachFile attachFile : attachFileList) {
        attachFileDao.insert(attachFile);
      }
    } catch (Exception e1) {
      logger.info(
        "==================파일 데이터 DB 저장 중 오류 발생=======================>"
      );
      throw e1;
    }

    try {
      logger.info("==================파일 전송 시작=======================>");
      AttachFileUtil.transferFileListToRepository(attachFileList);
      logger.info("==================파일 전송 완료=======================>");
    } catch (Exception e2) {
      logger.info(
        "==================파일 전송중 오류 발생=======================>"
      );
      logger.info(
        "==================전송 완료 파일 삭제 시작=======================>"
      );
      AttachFileUtil.removeFileListToRepository(attachFileList);
      logger.info(
        "==================전송 완료 파일 삭제 완료=======================>"
      );
      throw e2;
    }

    logger.info("==================업로드 완료=======================>");
  }

  public void delete(String bbsId, int articleId) throws Exception {
    Map<String, Object> maps = AttachFileUtil.getFileInfoToMap(
      bbsId,
      articleId
    );

    List<AttachFile> deleteFileList = attachFileDao.list(maps);

    logger.info(
      "==================파일 데이터 DB 삭제 시작======================>"
    );

    attachFileDao.deleteAll(maps);

    logger.info(
      "==================파일 데이터 DB 삭제 완료======================>"
    );

    logger.info("==================파일 삭제 시작======================>");

    AttachFileUtil.removeFileListToRepository(deleteFileList);

    logger.info("==================파일 삭제 완료======================>");
  }

  public void move(
    List<Integer> fileId,
    String oBbsId,
    int oAtrId,
    String nBbsId,
    int nAtrId
  ) throws Exception {
    Map<String, Object> tmp = ClassLoader.loadHashMap();
    int pImgNo = fileId.get(0);

    tmp.put("bbsId", oBbsId);
    tmp.put("articleId", oAtrId);
    tmp.put("fileId", fileId);
    List<AttachFile> repositoryFileList = attachFileDao.list2(tmp);

    try {
      logger.info("==================파일 이동 시작=======================>");
      AttachFileUtil.moveFileListToRepository(repositoryFileList);
      logger.info("==================파일 이동 완료=======================>");
    } catch (Exception e2) {
      logger.info(
        "==================파일 이동중 오류 발생=======================>"
      );
      throw e2;
    }

    logger.info(
      "==================파일 데이터 DB 삭제 시작======================>"
    );
    attachFileDao.delete2(tmp);
    logger.info(
      "==================파일 데이터 DB 삭제 완료======================>"
    );

    try {
      for (AttachFile attachFile : repositoryFileList) {
        if (attachFile.getFileId() == pImgNo) {
          attachFile.setBbsId(Constant.PRDT_MAIN);
        } else {
          attachFile.setBbsId(Constant.PRDT_SUB);
        }
        attachFile.setFilePath(Constant.getFileDefaultPath());
        attachFile.setArticleId(nAtrId);
        attachFileDao.insert(attachFile);
      }
    } catch (Exception e1) {
      logger.info(
        "==================파일 데이터 DB 저장 중 오류 발생=======================>"
      );
      throw e1;
    }
  }
}
