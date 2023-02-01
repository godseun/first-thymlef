package com.daehwa.b2b.admin.service;

import java.util.Map;

public interface ContactService {
  public void sendContactMsg(Map<String, Object> tMap) throws Exception;

  public void sendCsMsg(Map<String, Object> param) throws Exception;

  public void sendSMS(Map<String, Object> param) throws Exception;

  public void sendEmail(Map<String, Object> param) throws Exception;

  public void sendMsg(Map<String, Object> param) throws Exception;
}
