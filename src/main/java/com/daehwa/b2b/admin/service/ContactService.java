package com.daehwa.b2b.admin.service;

import com.daehwa.b2b.admin.dao.ContactDao;
import com.daehwa.b2b.common.util.CommonUtil;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ContactService {

  @Autowired
  private ContactDao contactDao;

  public void sendContactMsg(Map<String, Object> tMap) {
    boolean sendOk = true;
    Calendar cal = Calendar.getInstance();
    cal.setTime(new Date());

    if ("9to6".equals(tMap.get("send") + "")) {
      int hour = cal.get(Calendar.HOUR_OF_DAY);
      if (hour < 9 || hour > 18) {
        sendOk = false;
      }
    }

    if (sendOk) {
      tMap.put("SEND_TIME", "00000000000000");
    } else {
      DateFormat df = new SimpleDateFormat("yyyyMMdd");
      cal.add(Calendar.DATE, 1);
      String strDate = df.format(cal.getTime()) + "090000";
      tMap.put("SEND_TIME", strDate);
    }
    tMap.put("SVC_ID", "171122047925");
    tMap.put("YELLOW_ID", "@selltool");
    tMap.put("SEND_NO", "18338917");
    tMap.put("AD_YN", "N");
    tMap.put("MSG_KIND", "AT");
    tMap.put("SMS_LMS", "S");

    if ("MISC".equals(tMap.get("type") + "")) {
      tMap.put("MSG_KIND", "SS");
      tMap.put("TEMP_ID", "0000000000000000");
      tMap.put(
        "MSG",
        "모든 상담원이 통화중 입니다.통화가 끝나는 대로 바로 연락 드리겠습니다."
      );
      contactDao.send_SMS_SEND(tMap);
    } else if ("AUTHNO".equals(tMap.get("type") + "")) { //구매자 - 가입인증번호 - 알림톡 - SMS
      tMap.put("MSG_KIND", "SS");
      tMap.put("TEMP_ID", "2017120600005956");
      tMap.put("JOB", "회원가입");
      contactDao.send_SMS_AUTHNO(tMap);
    } else if ("AUTHNO2".equals(tMap.get("type") + "")) { //구매자 - 비밀번호 조회 - 알림톡 - SMS
      tMap.put("MSG_KIND", "SS");
      tMap.put("TEMP_ID", "2017120600005962");
      tMap.put("JOB", "비밀번호 변경");
      contactDao.send_SMS_AUTHNO(tMap);
    } else if ("ORDR_S".equals(tMap.get("type") + "")) { //공급사 - 주문 - 알림톡 - SMS
      tMap.put("TEMP_ID", "2017112700005524");
      contactDao.send_SMS_ORDR_S(tMap);
    } else if ("EST".equals(tMap.get("type") + "")) { //관리자 - 견적 - 알림톡 - SMS
      tMap.put("TEMP_ID", "2017120600005953");
      contactDao.send_EST_BBS_MASTER(tMap);
    } else if ("PDT".equals(tMap.get("type") + "")) { //관리자 - 상품문의 - 알림톡 - SMS
      tMap.put("TEMP_ID", "2017120600005944");
      tMap.put("MSG", "[대화] 상품문의 알림");
      tMap.put("URL", CommonUtil.serverUrl + "/admin/login");
      contactDao.send_SMS_PRDT_MAG(tMap);
    } else if (
      "USR".equals(tMap.get("type") + "") ||
      "GST".equals(tMap.get("type") + "") ||
      "MOU".equals(tMap.get("type") + "") ||
      "BAN".equals(tMap.get("type") + "")
    ) { //관리자 - 요청 - 알림톡 - SMS
      String job = "QNA";
      String msg = "새글등록 알림. 상세내역 확인 바랍니다.";

      if ("MOU".equals(tMap.get("type") + "")) {
        job = "제휴문의";
      } else if ("BAN".equals(tMap.get("type") + "")) {
        job = "반품요청";
        msg = "반품요청건 알림.주문번호 : " + tMap.get("ordrId");
      }

      tMap.put("TEMP_ID", "2017120600005947");
      tMap.put("JOB", job);
      tMap.put("MSG", msg);
      contactDao.send_SMS_BBS_MASTER(tMap);
    } else if ("JOINOK".equals(tMap.get("type") + "")) { //구매자 - 가입완료 - 알림톡 - SMS
      tMap.put("TEMP_ID", "2017120600005959");
      contactDao.send_SMS_JOINOK(tMap);
    } else if ("ORDR_B".equals(tMap.get("type") + "")) { //구매자 - 주문 - 알림톡 - SMS
      tMap.put("TEMP_ID", "2017120600005968");
      contactDao.send_SMS_ORDR_B(tMap);
    } else if ("VBANK".equals(tMap.get("type") + "")) { //구매자 - 가상계좌 - 알림톡 - SMS
      tMap.put("TEMP_ID", "2017120600005965");
      contactDao.send_SMS_VBANK_B(tMap);
    } else if ("INVOICE".equals(tMap.get("type") + "")) { //구매자 - 배송정보 - 알림톡 - SMS
      tMap.put("TEMP_ID", "2017120600005971");
      tMap.put("MSG", "[대화] 주문하신 상품의 배송이 시작 되었습니다");
      contactDao.send_SMS_INVOICE_B(tMap);
    } else if ("INVOICE2".equals(tMap.get("type") + "")) { //구매자 - 배송정보업데이트 - 알림톡 - SMS
      tMap.put("TEMP_ID", "2017120600005974");
      tMap.put("MSG", "[대화] 주문하신 상품의 배송정보가 확인되었습니다.");
      contactDao.send_SMS_INVOICE_B(tMap);
    } else if ("REPLYEST".equals(tMap.get("type") + "")) { //구매자 - 견적회신 - 알림톡 - SMS
      tMap.put("TEMP_ID", "2017120600005977");
      tMap.put("MSG", "[대화] 요청하신 견적이 회신 되었습니다.");
      contactDao.send_SMS_EST_WRITER(tMap);
    } else if ("DENYEST".equals(tMap.get("type") + "")) { //구매자 - 견적보류 - 알림톡 - SMS
      tMap.put("TEMP_ID", "2017120600005980");
      tMap.put("MSG", "[대화] 요청하신 견적이 진행 보류되었습니다.");
      contactDao.send_SMS_EST_WRITER(tMap);
    } else if ("ANSWER".equals(tMap.get("type") + "")) { //문의자 - 답변안내 - 알림톡 - SMS
      tMap.put("TEMP_ID", "2017120600006016");
      contactDao.send_SMS_BBS_WRITER(tMap);
    }
  }

  public void sendCsMsg(Map<String, Object> param) {
    param.put("SVC_ID", "171122047925");
    param.put("YELLOW_ID", "@selltool");
    param.put("SEND_NO", "18338917");
    param.put("AD_YN", "N");
    param.put("MSG_KIND", "AT");
    param.put("SMS_LMS", "L");

    if ("2017120600005998".equals(param.get("tmpId") + "")) {
      contactDao.sendCsButton(param);
    } else {
      contactDao.sendCsMsg(param);
    }
  }

  public void sendSMS(Map<String, Object> param) {}

  public void sendEmail(Map<String, Object> param) {}

  public void sendMsg(Map<String, Object> param) {
    if ("SMS".equals(param.get("msgTp"))) {
      contactDao.sendCsSMS(param);
    } else {
      contactDao.sendCsLMS(param);
    }
  }
}
