package com.daehwa.b2b.common.util;

import com.daehwa.b2b.admin.domain.Paging;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.support.RequestContextUtils;

public class CommonUtil {

  public static String serverUrl = "http://localhost:8090";

  public static boolean isNull(String value) {
    if (value == null) {
      return true;
    }

    return false;
  }

  public static boolean isEmpty(String value) {
    if (
      isNull(value) || "".equals(value.trim()) || "null".equals(value.trim())
    ) {
      return true;
    }

    return false;
  }

  public static String nvl(String value, String value2) {
    if (isEmpty(value)) {
      return value2;
    }

    return value;
  }

  public static void log(
    Logger logger,
    Map<String, Object> param,
    String header
  ) {
    if (!isEmpty(header)) {
      logger.info(header);
    }

    logger.info("=======================================================>");
    logger.info("파라메타 확인 ========> " + param);
    logger.info("=======================================================>");
  }

  public static void log(Logger logger, Exception error, String header) {
    if (!isEmpty(header)) {
      logger.info(header);
    }

    logger.error("=======================================================>");
    logger.error("EXCEPTION 발생 시작");
    logger.error("EXCEPTION 내용 ====>", error);
    logger.error("EXCEPTION 발생 종료");
    logger.error("=======================================================>");
  }

  public static void log(Logger logger, Map<String, Object> param) {
    log(logger, param, null);
  }

  /* 임시 봉인
	public static Map<String,?> getInputFlashMap() {
		return RequestContextUtils.getInputFlashMap(SessionUtil.getRequest());
	}

	public static void setInputFlashMap(Model model, String key) {
		Map<String,?> flashMap = getInputFlashMap();

		if(!ClassLoader.isEmptyMap(flashMap)) {
			model.addAttribute(key,flashMap.get(key));
		}
	}
	*/

  public static FlashMap getOutputFlashMap() {
    return RequestContextUtils.getOutputFlashMap(SessionUtil.getRequest());
  }

  public static void setOutputFlashMap(String key, String value) {
    FlashMap flashMap = getOutputFlashMap();
    flashMap.put(key, value);
  }

  public static void setOutputFlashMap(Map<String, Object> value) {
    FlashMap flashMap = getOutputFlashMap();
    flashMap.putAll(value);
  }

  public static String convertToJson(Object object) {
    ObjectMapper objectMapper = new ObjectMapper();

    String json = "";

    try {
      json = objectMapper.writeValueAsString(object);
    } catch (Exception e) {
      json = "";
    }

    return json;
  }

  public static Map<String, Object> setPagingInfo(
    Map<String, Object> map,
    String pagingKey,
    int currentPage,
    int itemSize
  ) {
    Paging paging = new Paging(currentPage);

    if (isEmpty(pagingKey)) {
      pagingKey = "paging";
    }

    if (itemSize > 0) {
      paging = new Paging(currentPage, itemSize);
    }

    map.put(pagingKey, paging);

    return map;
  }

  public static Map<String, Object> setPagingInfo(
    Map<String, Object> map,
    String pagingKey,
    String currentPageKey,
    String itemSizeKey
  ) {
    int currentPage = map.containsKey(currentPageKey)
      ? Integer.valueOf((String) map.get(currentPageKey))
      : Paging.DEFAULT_PAGE;
    int itemSize = map.containsKey(itemSizeKey)
      ? Integer.valueOf((String) map.get(itemSizeKey))
      : -1;

    return setPagingInfo(map, pagingKey, currentPage, itemSize);
  }

  public static Map<String, Object> setPagingInfo(
    Map<String, Object> map,
    String pagingKey,
    String currentPageKey,
    int itemSize
  ) {
    int currentPage = map.containsKey(currentPageKey)
      ? Integer.valueOf((String) map.get(currentPageKey))
      : Paging.DEFAULT_PAGE;

    return setPagingInfo(map, pagingKey, currentPage, itemSize);
  }

  public static Map<String, Object> setPagingInfo(
    Map<String, Object> map,
    String name
  ) {
    int currentPage = map.containsKey("currentPage")
      ? Integer.valueOf((String) map.get("currentPage"))
      : Paging.DEFAULT_PAGE;
    int itemSize = map.containsKey("itemSize")
      ? Integer.valueOf((String) map.get("itemSize"))
      : -1;

    return setPagingInfo(map, name, currentPage, itemSize);
  }

  public static Map<String, Object> setPagingInfo(Map<String, Object> map) {
    return setPagingInfo(map, null);
  }

  public static Map<String, Object> setPagingInfo(ParamUtil map) {
    return setPagingInfo(map.getMap(), null);
  }

  public static void setBbsId(Map<String, Object> map, String bbsId) {
    map.put("bbsId", bbsId);
  }

  public static String getUTF8(String value) throws Exception {
    if (!isEmpty(value)) {
      if (!Constant.REAL) {
        value = new String(value.getBytes("8859_1"), "UTF-8");
      }
    }

    return value;
  }

  public static Map<String, Object> convertMultiparaData(
    Map<String, Object> param
  ) throws Exception {
    Map<String, Object> temp = ClassLoader.loadHashMap();

    Iterator<String> it = param.keySet().iterator();

    while (it.hasNext()) {
      String key = (String) it.next();
      String value = (String) param.get(key);
      value = getUTF8(value);

      temp.put(key, value);
    }

    return temp;
  }

  public static String[] getStringToArray(String str, String separator) {
    String[] tempArr = null;

    if (!isEmpty(str)) {
      tempArr = str.split(separator);
    }

    return tempArr;
  }

  public static String[] getStringToArray_1(String str, String separator) {
    String[] tempArr = null;

    if (!isEmpty(str)) {
      tempArr = str.split(separator, -1);
    } else {
      tempArr = new String[] { "" };
    }

    return tempArr;
  }

  public static List<String> getHashtag(String text) {
    List<String> list = null;

    if (!isEmpty(text)) {
      list = ClassLoader.loadList();

      //Pattern p = Pattern.compile("\\#([0-9a-zA-Zㄱ-ㅎㅏ-ㅣ가-힣-_+=!@$%^&*()[]{}|\\;:'\"<>,.?/~`） ");
      Pattern p = Pattern.compile(
        "\\#([0-9a-zA-Zㄱ-ㅎㅏ-ㅣ가-힣-_+=!@$%^&*\\(\\)\\[\\]\\{\\}\\|\\;:'\"<>,.?/~`）]*)"
      );
      Matcher m = p.matcher(text);

      String extractHashTag = null;

      while (m.find()) {
        extractHashTag = StringUtils.replaceChars(m.group(), "#", "");
        extractHashTag = extractHashTag.trim();

        if (extractHashTag.length() < 1) {
          extractHashTag = null;
        } else {
          if (extractHashTag.split(" ").length > 0) {
            list.add(extractHashTag.split(" ")[0].trim());
          }
        }
      }
    }

    return list;
  }

  public static void checkCurrentEncoding(Logger logger, String text)
    throws Exception {
    String charset[] = {
      "KSC5601",
      "8859_1",
      "ascii",
      "UTF-8",
      "EUC-KR",
      "MS949",
    };

    logger.debug("Not convert charset : " + text);

    for (int i = 0; i < charset.length; i++) {
      for (int j = 0; j < charset.length; j++) {
        logger.debug(
          charset[i] +
          " : " +
          charset[j] +
          " : " +
          new String(text.getBytes(charset[i]), charset[j])
        );
      }
    }
  }
}
