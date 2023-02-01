package com.daehwa.b2b.common.util;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

public class SessionUtil {

  private static final Logger logger = LoggerFactory.getLogger(
    SessionUtil.class
  );

  public static HttpServletRequest getRequest() {
    return (
      (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()
    ).getRequest();
  }

  public static HttpSession getSession() {
    return getRequest().getSession();
  }

  public static Object getSession(String key) {
    return getRequest().getSession().getAttribute(key);
  }

  public static void setSession(String key, Object value) {
    getRequest().getSession().setAttribute(key, value);
  }

  public static void setLoginSession(String key, Map<String, Object> userInfo) {
    Map<String, Object> map = ClassLoader.loadHashMap();
    map.put("usrId", userInfo.get("USR_ID"));
    map.put("usrNm", userInfo.get("USR_NM"));
    map.put("email", userInfo.get("EMAIL"));
    map.put("mobile", userInfo.get("MOBILE"));
    map.put("usrId2", userInfo.get("JOIN_USR_ID"));
    map.put("usrTp", userInfo.get("USR_TP"));
    map.put("usrLv", userInfo.get("USR_LV"));
    map.put("SMS_NO_AT", userInfo.get("SMS_NOTI_AGRE_AT"));
    map.put("SMS_AD_AT", userInfo.get("SMS_AD_AGRE_AT"));
    map.put("EMAIL_AD_AT", userInfo.get("EMAIL_AD_AGRE_AT"));
    map.put("TAXBILL_AT", userInfo.get("AUTO_TAXBILL"));

    //판매자 계정 정보
    if ("S".equals(userInfo.get("USR_TP") + "")) {
      map.put("erpLv", userInfo.get("ERP_LV"));
      map.put("bizNo", userInfo.get("CMP_BIZ_NO"));
      map.put("cmpNm", userInfo.get("CMP_NM"));
      map.put("storeId", userInfo.get("STORE_ID"));
      map.put("storeNm", userInfo.get("STORE_NM"));
      map.put("chaDept", userInfo.get("CHARGER_DEPT"));
      map.put("chaNm", userInfo.get("CHARGER_NM"));
      map.put("chaTelNO", userInfo.get("CHARGER_TEL_NO"));
      map.put("chaEmail", userInfo.get("CHARGER_EMAIL"));
      //관리자 권한정보 설정
    } else if ("A".equals(userInfo.get("USR_TP") + "")) {
      map.put("aLv", userInfo.get("STORE_ID"));
    }
    getRequest().getSession().setAttribute(key, map);
  }

  public static void setEstimateSession(String key, Map<String, Object> param) {
    Map<String, Object> map = ClassLoader.loadHashMap();
    map.put("usrMo", param.get("mobileNo"));
    map.put("usrPw", param.get("shaPw"));
    getRequest().getSession().setAttribute(key, map);
  }

  public static void setEstimateId(String key, Map<String, Object> param) {
    Map<String, Object> map = ClassLoader.loadHashMap();
    map.put("estId", param.get("estId"));
    map.put("usrMo", SessionUtil.getEstimateInfo().get("usrMo"));
    map.put("usrPw", SessionUtil.getEstimateInfo().get("usrPw"));
    getRequest().getSession().setAttribute(key, map);
  }

  public static void delEstimateId(String key, Map<String, Object> param) {
    Map<String, Object> map = ClassLoader.loadHashMap();
    map.put("usrMo", SessionUtil.getEstimateInfo().get("usrMo"));
    map.put("usrPw", SessionUtil.getEstimateInfo().get("usrPw"));
    getRequest().getSession().setAttribute(key, map);
  }

  public static void setAdminLoginSession(
    String key,
    Map<String, Object> userInfo
  ) {
    Map<String, Object> map = ClassLoader.loadHashMap();

    map.put("loginId", userInfo.get("USER_SEQ"));
    map.put("loginAdminId", userInfo.get("USER_ID"));
    map.put("loginName", userInfo.get("USER_NAME"));

    //CommonUtil.log(logger, map);

    getRequest().getSession().setAttribute(key, map);
  }

  @SuppressWarnings("unchecked")
  public static Map<String, Object> getUserSession() {
    return (Map<String, Object>) getSession().getAttribute("userSession");
  }

  @SuppressWarnings("unchecked")
  public static Map<String, Object> getEstimateInfo() {
    return (Map<String, Object>) getSession().getAttribute("estimateInfo");
  }

  public static Map<String, Object> setUserInfo(Map<String, Object> map) {
    Map<String, Object> userInfo = null;
    if (getUserSession() != null) {
      userInfo = SessionUtil.getUserSession();
      map.putAll(userInfo);
      CommonUtil.log(logger, map);
    }
    return map;
  }

  public static Map<String, Object> setUserInfo(ParamUtil param) {
    return setUserInfo(param.getMap());
  }

  public static boolean isLogin() {
    return getUserSession() != null;
  }

  public static void logout() {
    getSession().invalidate();
  }

  public static String getRealPath() {
    return getSession().getServletContext().getRealPath("");
  }

  public static String getContextPath() {
    return getSession().getServletContext().getContextPath();
  }
}
