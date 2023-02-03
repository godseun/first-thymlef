package com.daehwa.b2b.admin.domain;

import java.io.Serializable;
import org.springframework.web.multipart.MultipartFile;

public class AttachFile implements Serializable {

  private static final long serialVersionUID = 6739528979198339383L;

  // 게시판코드
  private String bbsId;

  // 게시물번호
  private int articleId;

  // 첨부파일번호
  private int fileId;

  // 원본파일명
  private String fileOriName;

  // 저장파일명
  private String fileSaveName;

  // 파일크기
  private Long fileSize;

  // 파일경로
  private String filePath;

  // 파일확장자
  private String fileExt;

  // multipartFile
  private MultipartFile multipartFile;

  public String getBbsId() {
    return bbsId;
  }

  public void setBbsId(String bbsId) {
    this.bbsId = bbsId;
  }

  public int getArticleId() {
    return articleId;
  }

  public void setArticleId(int articleId) {
    this.articleId = articleId;
  }

  public int getFileId() {
    return fileId;
  }

  public void setFileId(int fileId) {
    this.fileId = fileId;
  }

  public String getFileOriName() {
    return fileOriName;
  }

  public void setFileOriName(String fileOriName) {
    this.fileOriName = fileOriName;
  }

  public String getFileSaveName() {
    return fileSaveName;
  }

  public void setFileSaveName(String fileSaveName) {
    this.fileSaveName = fileSaveName;
  }

  public Long getFileSize() {
    return fileSize;
  }

  public void setFileSize(Long fileSize) {
    this.fileSize = fileSize;
  }

  public String getFilePath() {
    return filePath;
  }

  public void setFilePath(String filePath) {
    this.filePath = filePath;
  }

  public String getFileExt() {
    return fileExt;
  }

  public void setFileExt(String fileExt) {
    this.fileExt = fileExt;
  }

  public MultipartFile getMultipartFile() {
    return multipartFile;
  }

  public void setMultipartFile(MultipartFile multipartFile) {
    this.multipartFile = multipartFile;
  }
}
