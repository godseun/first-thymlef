package com.daehwa.b2b.common.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Hashtable;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Vector;

public class ClassLoader {

  public static <T> Set<T> loadHashSet() {
    return new HashSet<T>();
  }

  public static <T> List<T> loadList() {
    return new ArrayList<T>();
  }

  public static <T> List<T> loadVector() {
    return new Vector<T>();
  }

  public static <K, V> Map<K, V> loadHashMap() {
    return new HashMap<K, V>();
  }

  public static <K, V> Map<K, V> loadLinkedMap() {
    return new LinkedHashMap<K, V>();
  }

  public static <K, V> Map<K, V> loadHashTable() {
    return new Hashtable<K, V>();
  }

  public static boolean isEmpty(String str) {
    if (str != null && !"".equals(str.trim())) {
      return false;
    } else {
      return true;
    }
  }

  public static <K, V> boolean isEmptyKey(Map<K, V> map, String key) {
    if (!isEmptyMap(map)) {
      if (map.containsKey(key) && !isEmpty((String) map.get(key))) {
        return false;
      }
    }

    return true;
  }

  public static <K, V> boolean isEmptyMap(Map<K, V> map) {
    if (map != null && !map.isEmpty() && map.size() > 0) {
      return false;
    } else {
      return true;
    }
  }

  public static <K, V> boolean isEmptyKey(Map<K, V> map, String... arrKeys) {
    boolean isEmpty = false;

    if (arrKeys != null && arrKeys.length > 0) {
      for (String key : arrKeys) {
        if (isEmptyKey(map, key)) {
          isEmpty = true;
          break;
        }
      }
    }

    return isEmpty;
  }

  public static <E> boolean isEmptyList(List<E> list) {
    if (list != null && !list.isEmpty() && list.size() > 0) {
      return false;
    } else {
      return true;
    }
  }

  public static <T> boolean isEmptyArray(T[] array) {
    if (array != null && array.length > 0) {
      return false;
    } else {
      return true;
    }
  }

  public static <K, V> Map<K, V> getDefaultMap(Map<K, V> map) {
    Map<K, V> defaultMap = null;

    if (!isEmptyMap(map)) {
      defaultMap = loadHashMap();
      defaultMap.putAll(map);
    }

    return defaultMap;
  }
}
