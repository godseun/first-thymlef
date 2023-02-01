package com.daehwa.b2b.common.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class Constant {

  /**
   * 이미지_서버_경로
   */
  public static final String FILE_UPLOAD_PATH = "/upload";
  //public static final String FILE_UPLOAD_PATH = "/home/hosting_users/thebro/tomcat/webapps/ROOT/upload";
  //public static final String FILE_UPLOAD_PATH = "\\\\nas2e/document/upload";
  //public static final String FILE_UPLOAD_PATH = "/usr/local/apache2/htdocs/upload";

  private static SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
  private static String SubDir =
    sdf.format(Calendar.getInstance().getTime()) + "/";

  /**
   * 파일 기본 포멧
   */
  private static String FILE_DEFAULT_FORMAT;

  @Value(value = "yyyyMMddhhmmss")
  public void setFileDefaultFormat(String format) {
    FILE_DEFAULT_FORMAT = format;
  }

  public static String getFileDefaultFormat() {
    return FILE_DEFAULT_FORMAT;
  }

  /**
   * 파일 저장 위치
   */
  private static String FILE_DEFAULT_PATH;

  @Value(value = "/board/")
  public void setFileDefaultPath(String path) {
    FILE_DEFAULT_PATH = path;
  }

  public static String getFileDefaultPath() {
    return FILE_UPLOAD_PATH + FILE_DEFAULT_PATH + SubDir;
  }

  /**
   * 파일 임시 저장 위치
   */
  private static String FILE_TEMP_PATH;

  @Value(value = "/temp/")
  public void setFileTempPath(String path) {
    FILE_TEMP_PATH = path;
  }

  public static String getFileTempPath() {
    return FILE_UPLOAD_PATH + FILE_TEMP_PATH + SubDir;
  }

  /**
   * 운영 환경 여부
   */
  public static final boolean REAL = true;

  /**
   * 샵 상품 업로드 이미지.
   */
  public static final String PRDT_MAIN = "PRDT_MAIN";

  /**
   * 샵 상품 업로드 이미지.
   */
  public static final String PRDT_SUB = "PRDT_SUB";

  /**
   * 샵 임시 업로드 이미지.
   */
  public static final String TMP_IMG = "TMP_IMG";

  /**
   * 샵 가입 (사업자 등록증)
   */
  public static final String BUSINESS_LICENSE = "BSL";

  /**
   * 구매자 - 세금계산서 발행용 사업자 등록증
   */
  public static final String TAX_LICENSE = "TAX";

  /**
   * 관리자 비고
   */
  public static final String ADMIN_MNG = "MNG";

  /**
   * 입점문의
   */
  public static final String STORE_JOIN = "MOU";

  /**
   * 문의 - 입점사
   */
  public static final String STORE_QNA = "STR";

  /**
   * 문의 - 구매자
   */
  public static final String USER_QNA = "USR";

  /**
   * 문의 - 구매자(비로그인)
   */
  public static final String GUEST_QNA = "GST";

  /**
   * 문의 - 상품
   */
  public static final String PRDUCT_QNA = "PDT";

  /**
   * 주문관리
   */
  public static final String ORDER_MNG = "ORD";

  /**
   * 공지사항 BBS_ID
   */
  public static final String NOTICE_BBS_ID = "NOTICE";

  /**
   * 매거진 BBS_ID
   */
  public static final String MAGAZINE_BBS_ID = "MAGAZINE";

  /**
   * 매거진 컨텐츠 BBS_ID
   */
  public static final String MAGAZINE_CONTENT_BBS_ID = "MAGAZINE_CONTENT";

  /**
   * FAQ BBS_ID
   */
  public static final String FAQ_BBS_ID = "FAQ";

  /**
   * 1:1 문의(샵) BBS_ID
   */
  public static final String INQUIRY_BBS_ID = "INQUIRY";

  /**
   * 도움말(앱) BBS_ID
   */
  public static final String HELP_BBS_ID = "HELP";

  /**
   * 뉴스피드 BBS_ID
   */
  public static final String FEED_BBS_ID = "FEED";

  /**
   * 샵 정보 BBS_ID (샵 대표 이미지)
   */
  public static final String SHOP_BBS_ID = "SHOP";

  /**
   * 샵 서비스 BBS_ID (서비스 상품 이미지)
   */
  public static final String SHOP_SERVICE_BBS_ID = "SHOP_SERVICE";

  /**
   * 사용자 프로필 이미지 BBS_ID
   */
  public static final String USER_PIC_BBS_ID = "USER_PIC";

  /**
   * 샵 프로필 이미지 BBS_ID
   */
  public static final String SHOP_PIC_BBS_ID = "SHOP_PIC";
}
