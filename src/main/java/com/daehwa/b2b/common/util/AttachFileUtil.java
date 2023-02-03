package com.daehwa.b2b.common.util;

import com.daehwa.b2b.admin.domain.AttachFile;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.awt.image.PixelGrabber;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.imageio.ImageIO;
import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class AttachFileUtil {

  private static final Logger logger = LoggerFactory.getLogger(
    AttachFileUtil.class
  );

  /**
   * 첨부파일 생성(복수)
   * @param multipartFileList
   * @param bbsId
   * @param articleId
   * @return
   * @throws Exception
   */
  public static List<AttachFile> getAttachFileInfoList(
    List<MultipartFile> multipartFileList,
    String bbsId,
    int articleId
  ) throws Exception {
    List<AttachFile> attachFileList = ClassLoader.loadList();

    if (multipartFileList != null && !multipartFileList.isEmpty()) {
      int fileIndex = 1;

      for (MultipartFile multipartFile : multipartFileList) {
        if (multipartFile != null && !multipartFile.isEmpty()) {
          AttachFile attachFile = getAttachFileInfoOne(
            multipartFile,
            bbsId,
            articleId
          );
          String fileSaveName = attachFile.getFileSaveName();
          fileSaveName = fileSaveName + "_" + fileIndex;
          attachFile.setFileSaveName(fileSaveName);
          attachFileList.add(attachFile);
          fileIndex++;
        }
      }
    }

    return attachFileList;
  }

  /**
   * 첨부파일 생성(단일)
   * @param multipartFile
   * @param bbsId
   * @param articleId
   * @return
   * @throws Exception
   */
  public static AttachFile getAttachFileInfoOne(
    MultipartFile multipartFile,
    String bbsId,
    int articleId
  ) throws Exception {
    AttachFile attachFile = new AttachFile();

    String fileOriName = multipartFile.getOriginalFilename();
    //String fileSaveName = fileOriName + getFileCreateFormat();
    String fileSaveName = getFileCreateFormat();
    String fileExtName = FilenameUtils.getExtension(
      multipartFile.getOriginalFilename()
    );

    attachFile.setBbsId(bbsId);
    attachFile.setArticleId(articleId);
    attachFile.setFileOriName(fileOriName);
    attachFile.setFileSaveName(fileSaveName);
    attachFile.setFileSize(multipartFile.getSize());
    if ("TMP_IMG".equals(bbsId)) {
      attachFile.setFilePath(Constant.getFileTempPath());
    } else {
      attachFile.setFilePath(Constant.getFileDefaultPath());
    }

    attachFile.setFileExt(fileExtName);
    attachFile.setMultipartFile(multipartFile);

    return attachFile;
  }

  /**
   * 첨부파일 임시 생성(단일) - MultipartFile
   * @param multipartFile
   * @return
   * @throws Exception
   */
  public static AttachFile getCommonAttachTempFileInfoOne(
    MultipartFile multipartFile
  ) throws Exception {
    AttachFile attachFile = new AttachFile();

    String fileOriName = multipartFile.getOriginalFilename();
    String fileSaveName = getTempFileCreateFormat();
    String fileExtName = FilenameUtils.getExtension(
      multipartFile.getOriginalFilename()
    );

    attachFile.setFileOriName(fileOriName);
    attachFile.setFileSaveName(fileSaveName);
    attachFile.setFileSize(multipartFile.getSize());
    attachFile.setFilePath(Constant.getFileTempPath());
    attachFile.setFileExt(fileExtName);
    attachFile.setMultipartFile(multipartFile);

    return attachFile;
  }

  /**
   * 첨부파일 임시 생성(단일) - String
   * @param fileName
   * @return
   * @throws Exception
   */
  public static AttachFile getCommonAttachTempFileInfoOne(String fileName)
    throws Exception {
    AttachFile attachFile = new AttachFile();

    attachFile.setFileSaveName(fileName);
    attachFile.setFilePath(Constant.getFileTempPath());

    return attachFile;
  }

  /**
   * 저장소 파일 생성(복수)
   * @param attachFileList
   * @throws Exception
   */
  public static void transferFileListToRepository(
    List<AttachFile> attachFileList
  ) throws Exception {
    if (attachFileList != null && !attachFileList.isEmpty()) {
      for (AttachFile attachFile : attachFileList) {
        transferFileToRepository(attachFile);
      }
    }
  }

  /**
   * 저장소 파일 생성(단일)
   * @param attachFile
   * @throws Exception
   */
  public static void transferFileToRepository(AttachFile attachFile)
    throws Exception {
    String path1 =
      Constant.getFileDefaultPath() + attachFile.getFileSaveName() + "_source";
    String path2 = Constant.getFileDefaultPath() + attachFile.getFileSaveName();
    String path3 = Constant.getFileTempPath() + attachFile.getFileSaveName();
    if (
      "PRDT_MAIN".equals(attachFile.getBbsId()) ||
      "PRDT_SUB".equals(attachFile.getBbsId())
    ) {
      if (!new File(Constant.getFileDefaultPath()).isDirectory()) {
        new File(Constant.getFileDefaultPath()).mkdirs();
      }
      File file = new File(path2);
      attachFile.getMultipartFile().transferTo(file);
    } else if ("TMP_IMG".equals(attachFile.getBbsId())) {
      if (!new File(Constant.getFileTempPath()).isDirectory()) {
        new File(Constant.getFileTempPath()).mkdirs();
      }
      File file = new File(path3);
      attachFile.getMultipartFile().transferTo(file);
    } else if (
      "FEED".equals(attachFile.getBbsId()) ||
      "USER_PIC".equals(attachFile.getBbsId()) ||
      "SHOP_PIC".equals(attachFile.getBbsId())
    ) {
      if (!new File(Constant.getFileDefaultPath()).isDirectory()) {
        new File(Constant.getFileDefaultPath()).mkdirs();
      }
      int width = 1000;
      int height = 1000;

      if ("USER_PIC".equals(attachFile.getBbsId())) {
        width = 300;
        height = 300;
      } else if ("SHOP_PIC".equals(attachFile.getBbsId())) {
        width = 300;
        height = 300;
      }

      int pixels[] = new int[width * height];

      File file = new File(path1);

      attachFile.getMultipartFile().transferTo(file);

      Image srcImg = ImageIO.read(file);

      Image imgTarget = srcImg.getScaledInstance(
        width,
        height,
        Image.SCALE_SMOOTH
      );

      PixelGrabber pg = new PixelGrabber(
        imgTarget,
        0,
        0,
        width,
        height,
        pixels,
        0,
        width
      );
      pg.grabPixels();

      BufferedImage thumImg = new BufferedImage(
        width,
        height,
        BufferedImage.TYPE_INT_RGB
      );
      thumImg.setRGB(0, 0, width, height, pixels, 0, width);

      File thumbFile = new File(path2);
      ImageIO.write(thumImg, "jpg", thumbFile);

      file.delete();
    } else {
      if (!new File(Constant.getFileDefaultPath()).isDirectory()) {
        new File(Constant.getFileDefaultPath()).mkdirs();
      }
      File file = new File(path2);

      attachFile.getMultipartFile().transferTo(file);
    }
  }

  /**
   * 저장소 임시 파일 생성(단일)
   * @param attachFile
   * @throws Exception
   */
  public static void transferFileToTempRepository(AttachFile attachFile)
    throws Exception {
    if (!new File(Constant.getFileTempPath()).isDirectory()) {
      new File(Constant.getFileTempPath()).mkdirs();
    }

    String path = Constant.getFileTempPath() + attachFile.getFileSaveName();

    File file = new File(path);

    attachFile.getMultipartFile().transferTo(file);
  }

  /**
   * 저장소 파일 삭제(복수)
   * @param attachFileList
   * @throws Exception
   */
  public static void removeFileListToRepository(
    List<AttachFile> attachFileList
  ) throws Exception {
    if (attachFileList != null && !attachFileList.isEmpty()) {
      for (AttachFile attachFile : attachFileList) {
        removeFileToRepository(attachFile);
      }
    }
  }

  /**
   * 저장소 파일 삭제(단일)
   * @param attachFile
   * @throws Exception
   */
  public static void removeFileToRepository(AttachFile attachFile)
    throws Exception {
    String path = attachFile.getFilePath() + attachFile.getFileSaveName();

    File file = new File(path);

    if (file.exists()) {
      file.delete();
    }
  }

  /**
   * 삭제 파일 목록 생성
   * @param repositoryFileList
   * @param deleteFile
   * @return
   */
  public static List<AttachFile> getDeleteFileList(
    List<AttachFile> repositoryFileList,
    String[] deleteFile
  ) {
    List<AttachFile> deleteFileList = ClassLoader.loadList();

    int index = 0;

    if (repositoryFileList != null && !repositoryFileList.isEmpty()) {
      for (AttachFile repositoryFile : repositoryFileList) {
        if (deleteFile != null && deleteFile.length > 0) {
          for (String fileName : deleteFile) {
            if (fileName != null) {
              if (repositoryFile.getFileSaveName().equals(fileName)) {
                deleteFileList.add(repositoryFileList.get(index));
              }
            }
          }
        }

        index++;
      }
    }

    return deleteFileList;
  }

  /**
   * 첨부파일 파일 크기(복수)
   * @param attachFileList
   * @return
   * @throws Exception
   */
  public static Long getAttachFileSize(List<AttachFile> attachFileList)
    throws Exception {
    Long fileSize = 0L;

    if (attachFileList != null && !attachFileList.isEmpty()) {
      for (AttachFile attachFile : attachFileList) {
        fileSize += getAttachFileSizeOne(attachFile);
      }
    }

    return fileSize;
  }

  /**
   * 첨부파일 파일 크기(단일)
   * @param attachFile
   * @return
   * @throws Exception
   */
  public static Long getAttachFileSizeOne(AttachFile attachFile)
    throws Exception {
    return attachFile.getFileSize();
  }

  /**
   * 파일 생성 포멧(_yyyyMMddhhmmss_millisecond)
   * @return
   * @throws Exception
   */
  public static String getFileCreateFormat() throws Exception {
    //return '_' + getCurrentDate() + '_' + getCurrentMillis();
    return getCurrentDate() + '_' + getCurrentMillis();
  }

  /**
   * 임시 파일 생성 포멧(_yyyyMMddhhmmss_millisecond)
   * @return
   * @throws Exception
   */
  public static String getTempFileCreateFormat() throws Exception {
    return getCurrentMillis().toString();
  }

  /**
   * 현재 일자(yyyyMMddhhmmss)
   * @return
   * @throws Exception
   */
  public static String getCurrentDate() throws Exception {
    return new SimpleDateFormat(Constant.getFileDefaultFormat())
      .format(new Date());
  }

  /**
   * 현재 millisecond
   * @return
   * @throws Exception
   */
  public static Long getCurrentMillis() throws Exception {
    return System.currentTimeMillis();
  }

  /**
   * 게시판코드(bbsId)와 게시물번호(articleId)를 Set
   * @param maps
   * @param bbsId
   * @param articleId
   */
  public static void setFileInfoToMap(
    Map<String, Object> maps,
    String bbsId,
    int articleId
  ) {
    maps.put("bbsId", bbsId);

    if (articleId > 0) {
      maps.put("articleId", articleId);
    }
  }

  /**
   * 게시판코드(bbsId)와 게시물번호(articleId)와 파일Id(fileId)를 Set 한뒤 반환
   * @param maps
   * @param bbsId
   * @param articleId
   */
  public static void setFileInfoToMap(
    Map<String, Object> maps,
    int fileId,
    String bbsId,
    int articleId
  ) {
    maps.put("bbsId", bbsId);

    if (articleId > 0) {
      maps.put("articleId", articleId);
    }
    if (fileId > 0) {
      maps.put("fileId", fileId);
    }
  }

  /**
   * 게시판코드(bbsId)와 게시물번호(articleId)를 Set 한뒤 반환
   * @param bbsId
   * @param articleId
   * @return
   */
  public static Map<String, Object> getFileInfoToMap(
    String bbsId,
    int articleId
  ) {
    Map<String, Object> maps = ClassLoader.loadHashMap();

    setFileInfoToMap(maps, bbsId, articleId);

    logger.debug("=======================================================>");
    logger.debug("파라메타 확인(maps) ========> " + maps);
    logger.debug("=======================================================>");

    return maps;
  }

  /**
   * 게시판코드(bbsId)와 게시물번호(articleId)와 파일Id(fileId)를 Set 한뒤 반환
   * @param bbsId
   * @param articleId
   * @return
   */
  public static Map<String, Object> getFileInfoToMap(
    int fileId,
    String bbsId,
    int articleId
  ) {
    Map<String, Object> maps = ClassLoader.loadHashMap();

    setFileInfoToMap(maps, fileId, bbsId, articleId);

    logger.debug("=======================================================>");
    logger.debug("파라메타 확인(maps) ========> " + maps);
    logger.debug("=======================================================>");

    return maps;
  }

  /**
   * 파일 크기 비교
   * @param currentSize
   * @param maxSize
   * @return
   */
  public static boolean compareFileSize(Long currentSize, Long maxSize) {
    if (currentSize <= maxSize) {
      return true;
    } else {
      return false;
    }
  }

  /**
   * 이미지 높이를 반환
   * @param file
   * @return
   * @throws Exception
   */
  public static int getImageHeight(File file) throws Exception {
    return ImageIO.read(file).getHeight();
  }

  /**
   * 이미지 넓이를 반환
   * @param file
   * @return
   * @throws Exception
   */
  public static int getImageWidth(File file) throws Exception {
    return ImageIO.read(file).getWidth();
  }

  /**
   * 이미지 파일 여부 확인
   * @param attachFile
   * @return
   * @throws Exception
   */
  public static boolean isImage(AttachFile attachFile) throws Exception {
    String path = attachFile.getFilePath() + attachFile.getFileSaveName();
    File file = new File(path);
    try {
      getImageHeight(file);
      getImageWidth(file);

      return true;
    } catch (Exception e) {
      return false;
    }
  }

  /**
   * 이미지 사이즈 비교
   * @param attachFile
   * @param maxImageWidth
   * @param maxImageHeight
   * @return
   * @throws Exception
   */
  public static boolean compareImageSize(
    AttachFile attachFile,
    int maxImageWidth,
    int maxImageHeight
  ) throws Exception {
    String path = attachFile.getFilePath() + attachFile.getFileSaveName();

    File file = new File(path);

    int imageWidth = getImageWidth(file);
    int imageHeight = getImageHeight(file);

    logger.debug("=====================>");
    logger.debug("maxImageWidth  : " + maxImageWidth);
    logger.debug("maxImageHeight : " + maxImageHeight);
    logger.debug("getImageWidth  : " + getImageWidth(file));
    logger.debug("getImageHeght  : " + getImageHeight(file));
    logger.debug("=====================>");

    if (maxImageWidth == 0 && maxImageHeight == 0) {
      return true;
    } else if (imageWidth <= maxImageWidth && imageHeight <= maxImageHeight) {
      return true;
    } else {
      return false;
    }
  }

  public static void moveFileListToRepository(
    List<AttachFile> repositoryFileList
  ) throws Exception {
    if (repositoryFileList != null && !repositoryFileList.isEmpty()) {
      for (AttachFile attachFile : repositoryFileList) {
        moveFileListToRepository(attachFile);
      }
    }
  }

  public static void moveFileListToRepository(AttachFile attachFile)
    throws Exception {
    String path = attachFile.getFilePath() + attachFile.getFileSaveName();
    String path2 = Constant.getFileDefaultPath() + attachFile.getFileSaveName();

    if (!new File(Constant.getFileDefaultPath()).isDirectory()) {
      new File(Constant.getFileDefaultPath()).mkdirs();
    }

    File file = new File(path);
    File tFile = new File(path2);

    if (file.exists()) {
      file.renameTo(tFile);
    }
  }
}
