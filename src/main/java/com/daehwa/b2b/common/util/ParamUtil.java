package com.daehwa.b2b.common.util;

import java.util.Map;

public class ParamUtil {

  private Map<String, Object> map = ClassLoader.loadHashMap();

  public Map<String, Object> getMap() {
    return map;
  }

  public String get(String key) {
    return String.valueOf(map.get(key));
  }

  public void put(String key, String value) {
    map.put(key, value);
  }

  public String toString() {
    return map.toString();
  }

  public String getString(String key) {
    return String.valueOf(map.get(key));
  }

  public int getInt(String key) {
    return Integer.valueOf(getString(key));
  }
}
