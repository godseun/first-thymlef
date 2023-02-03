package com.daehwa.b2b.admin.dao;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ContactDao {
  public List<Map<String, Object>> send_MSG_List(Map<String, Object> param);

  public List<Map<String, Object>> send_SMS_List(Map<String, Object> param);

  public List<Map<String, Object>> send_LMS_List(Map<String, Object> param);

  public List<Map<String, Object>> getMsgList(Map<String, Object> param);

  //SMS 바로 전송
  public void send_SMS_SEND(Map<String, Object> param);

  //공급사 - 주문 - 알림톡 - SMS
  public void send_SMS_ORDR_S(Map<String, Object> param);

  //구매자 - 주문 - 알림톡 - SMS
  public void send_SMS_ORDR_B(Map<String, Object> param);

  //구매자 - 가상계좌 - 알림톡 - SMS
  public void send_SMS_VBANK_B(Map<String, Object> param);

  //구매자 - 송장번호 - 알림톡 - LMS
  public void send_SMS_INVOICE_B(Map<String, Object> tMap);

  //구매자 - 견적회신 - 알림톡 - SMS
  public void send_SMS_EST_WRITER(Map<String, Object> tMap);

  //관리자 - 견적 - 알림톡 - SMS
  public void send_EST_BBS_MASTER(Map<String, Object> tMap);

  //관리자 - 상품문의 - 알림톡 - SMS
  public void send_SMS_PRDT_MAG(Map<String, Object> tMap);

  //관리자 - 문의 - 알림톡 - SMS
  public void send_SMS_BBS_MASTER(Map<String, Object> tMap);

  //구매자 - 가입인증번호 - 알림톡 - SMS
  public void send_SMS_AUTHNO(Map<String, Object> tMap);

  //구매자 - 가입완료 - 알림톡 - SMS
  public void send_SMS_JOINOK(Map<String, Object> tMap);

  //문의자 - 답변안내 - 알림톡 - SMS
  public void send_SMS_BBS_WRITER(Map<String, Object> tMap);

  //CS발송 - 알림톡 - LMS
  public void sendCsMsg(Map<String, Object> param);

  //CS발송 - 알림톡 - LMS
  public void sendCsButton(Map<String, Object> param);

  public String sendSMS(Map<String, Object> param);

  //공급사 담당자 SMS 발송
  public void send_SMS_CHARGER(Map<String, Object> tMap);

  //메일 발송
  public void send_EMAIL_AUTOMAIL(Map<String, Object> tMap);

  //패스워드 초기화 메일 발송
  public void send_EMAIL_PW_CHG_MAIL(Map<String, Object> tMap);

  public void send_SMS_ORDRCHR_B(Map<String, Object> param);

  public void send_SMS_ORDER_PA(Map<String, Object> tMap);

  public void sendCsSMS(Map<String, Object> param);

  public void sendCsLMS(Map<String, Object> param);

  public void send_SMS_MAGAM_CHARGER(Map<String, Object> tMap);
}
