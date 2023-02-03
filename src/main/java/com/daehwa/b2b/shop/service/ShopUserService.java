package com.daehwa.b2b.shop.service;

import com.daehwa.b2b.admin.service.AttachFileService;
import com.daehwa.b2b.admin.service.ContactService;
import com.daehwa.b2b.common.util.ClassLoader;
import com.daehwa.b2b.common.util.CommonUtil;
import com.daehwa.b2b.common.util.Constant;
import com.daehwa.b2b.common.util.SessionUtil;
import com.daehwa.b2b.shop.dao.ShopDao;
import com.daehwa.b2b.shop.dao.ShopUserDao;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class ShopUserService {

  @Autowired
  private ContactService contactService;

  @Autowired
  private ShopDao shopDao;

  @Autowired
  private ShopUserDao shopUserDao;

  @Autowired
  private AttachFileService attachFileService;

  public Map<String, Object> getView(Map<String, Object> param)
    throws Exception {
    return shopUserDao.view(param);
  }

  public void updateLoginInfo(Map<String, Object> param) throws Exception {
    shopUserDao.updateLoginInfo(param);
  }

  public List<Map<String, Object>> getAddr(Map<String, Object> param)
    throws Exception {
    SessionUtil.setUserInfo(param);
    return shopUserDao.getAddr(param);
  }

  public List<Map<String, Object>> getAddrList(Map<String, Object> param)
    throws Exception {
    SessionUtil.setUserInfo(param);
    return shopUserDao.getAddrList(param);
  }

  public void addAddr(Map<String, Object> param) throws Exception {
    String baseAddr = CommonUtil.nvl(param.get("baseAddr") + "", "off");
    SessionUtil.setUserInfo(param);

    if ("on".equals(baseAddr)) {
      param.put("baseAddrYn", "Y");
      shopUserDao.setBaseAddr(param);
    } else {
      param.put("baseAddrYn", "N");
    }
    shopUserDao.addAddr(param);
  }

  public void delAddr(Map<String, Object> param) throws Exception {
    SessionUtil.setUserInfo(param);

    int cnt = Integer.parseInt(CommonUtil.nvl(param.get("cnt") + "", "0"));
    List<String> tmpList = ClassLoader.loadList();
    for (int i = 0; i < cnt; i++) {
      String tmpP = CommonUtil.nvl(param.get("addrId" + i) + "", "");
      tmpList.add(tmpP);
    }
    param.put("ADDR_ID", tmpList);
    shopUserDao.delAddr(param);
  }

  public String insertAuthSMS(Map<String, Object> param) throws Exception {
    String result = "sendOk";
    param.put("cnt", "6");

    String chkMobile = shopDao.checkMobileNo2(param);
    if (!"0".equals(chkMobile)) {
      shopDao.updateAuthNo(param);
      String authNo = shopDao.insertAuthNo(param);

      param.put("type", "AUTHNO2");
      param.put("mobile", param.get("authMobileNum"));
      param.put("authNo", authNo);
      contactService.sendContactMsg(param);
    } else {
      result = "noMobileNo";
    }
    return result;
  }

  public String setPassWord(Map<String, Object> param) throws Exception {
    String result = "chgOk";
    String chk = shopDao.checkAuthNo(param);
    if (!"0".equals(chk)) {
      shopUserDao.updatePw(param);
    } else {
      result = "noAuthSMS";
    }
    return result;
  }

  public void setPassWord2(Map<String, Object> param) throws Exception {
    shopUserDao.updatePw2(param);
  }

  public String sendSetMail(Map<String, Object> param) throws Exception {
    String result = "sendOk";
    param.put("cnt", "6");

    String chkEmail = shopDao.checkEmail(param);
    if (!"0".equals(chkEmail)) {
      shopDao.updateAuthNo(param);
      String authNo = shopDao.insertAuthNo(param);

      SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
      Calendar c1 = Calendar.getInstance();

      param.put("authNo", authNo);
      param.put("dt", "[$_JOINDT_$]=" + sdf.format(c1.getTime()));
      param.put("id", "&[$_ID_$]=");
      param.put("ck", "&[$_CK_$]=");
      //contactDao.send_EMAIL_PW_CHG_MAIL(param);

    } else {
      result = "noEmail";
    }
    return result;
  }

  public String chkUrl(Map<String, Object> param) throws Exception {
    String result = "";

    String checkUri = shopDao.checkUri(param);
    if (!"0".equals(checkUri)) {
      result = "ckUri";
    } else {
      result = "noUri";
    }
    return result;
  }

  public List<Map<String, Object>> getFavList(Map<String, Object> param)
    throws Exception {
    SessionUtil.setUserInfo(param);
    return shopUserDao.getFavList(param);
  }

  public void addFav(Map<String, Object> param) throws Exception {
    Map<String, Object> tmp = ClassLoader.loadHashMap();
    SessionUtil.setUserInfo(tmp);

    int cnt = Integer.parseInt(CommonUtil.nvl(param.get("cnt") + "", "0"));

    for (int i = 0; i < cnt; i++) {
      Map<String, Object> tmpParm = ClassLoader.loadHashMap();
      tmpParm.putAll(tmp);
      tmpParm.put("PRDT_CD", param.get("p_cd" + i));
      tmpParm.put("PRDT_DTL_CD", param.get("p_dtl_cd" + i));
      shopUserDao.addFav(tmpParm);
    }
  }

  public void delFav(Map<String, Object> param) throws Exception {
    Map<String, Object> tmp = ClassLoader.loadHashMap();
    SessionUtil.setUserInfo(tmp);

    int cnt = Integer.parseInt(CommonUtil.nvl(param.get("cnt") + "", "0"));

    for (int i = 0; i < cnt; i++) {
      Map<String, Object> tmpParm = ClassLoader.loadHashMap();
      tmpParm.putAll(tmp);
      String[] CODE = CommonUtil.getStringToArray_1(
        param.get("p_dtl_cd" + i) + "",
        "@"
      );
      tmpParm.put("PRDT_CD", CODE[0]);
      tmpParm.put("PRDT_DTL_CD", CODE[1]);
      shopUserDao.delFav(tmpParm);
    }
  }

  public Map<String, Object> getList(Map<String, Object> param)
    throws Exception {
    Map<String, Object> result = ClassLoader.loadHashMap();

    result.put("resultList", shopUserDao.list(param));
    result.put("count", shopUserDao.listCount(param));

    return result;
  }

  public Map<String, Object> getalarm(Map<String, Object> param)
    throws Exception {
    SessionUtil.setUserInfo(param);
    return shopUserDao.getalarm(param);
  }

  public void setAlarm(Map<String, Object> param) throws Exception {
    SessionUtil.setUserInfo(param);
    shopUserDao.setAlarm(param);
  }

  public void chgInfo(Map<String, Object> param) throws Exception {
    SessionUtil.setUserInfo(param);

    if ("on".equals(param.get("clickTax") + "")) {
      param.put("aTaxBill", "Y");
      shopUserDao.setTaxInfo(param);
    } else {
      param.put("aTaxBill", "N");
    }

    shopUserDao.chgInfo(param);
  }

  public void chgInfo(Map<String, Object> param, List<MultipartFile> mFile)
    throws Exception {
    CommonUtil.setBbsId(param, Constant.TAX_LICENSE);

    int userId = Integer.parseInt(
      SessionUtil.getUserSession().get("usrId") + ""
    );
    attachFileService.insert(mFile, Constant.TAX_LICENSE, userId);

    SessionUtil.setUserInfo(param);
    param.put(
      "aTaxBill",
      ("on".equals(param.get("clickTax") + "")) ? "Y" : "N"
    );
    shopUserDao.chgInfo(param);
  }

  public Map<String, Object> getProfile(Map<String, Object> param)
    throws Exception {
    SessionUtil.setUserInfo(param);

    return shopUserDao.profile(param);
  }

  public Map<String, Object> getPhotoList(Map<String, Object> param)
    throws Exception {
    SessionUtil.setUserInfo(param);

    CommonUtil.setBbsId(param, Constant.FEED_BBS_ID);

    Map<String, Object> result = ClassLoader.loadHashMap();

    result.put("resultList", shopUserDao.photoList(param));
    result.put("count", shopUserDao.photoListCount(param));

    return result;
  }

  public Map<String, Object> getLikeList(Map<String, Object> param)
    throws Exception {
    SessionUtil.setUserInfo(param);

    CommonUtil.setBbsId(param, Constant.FEED_BBS_ID);

    Map<String, Object> result = ClassLoader.loadHashMap();

    result.put("resultList", shopUserDao.likeList(param));
    result.put("count", shopUserDao.likeListCount(param));

    return result;
  }

  public boolean existEmail(Map<String, Object> param) throws Exception {
    int count = (Integer) shopUserDao.existEmail(param);

    return count > 0 ? true : false;
  }

  public boolean existEncEmail(Map<String, Object> param) throws Exception {
    int count = (Integer) shopUserDao.existEncEmail(param);

    return count > 0 ? true : false;
  }

  public boolean existNickname(Map<String, Object> param) throws Exception {
    int count = (Integer) shopUserDao.existNickname(param);

    return count > 0 ? true : false;
  }

  public void insert(Map<String, Object> param, List<MultipartFile> file)
    throws Exception {
    int userId = shopUserDao.insert(param);

    attachFileService.insert(file, Constant.USER_PIC_BBS_ID, userId);
  }

  public void update(
    Map<String, Object> param,
    List<MultipartFile> file,
    String[] deleteFile
  ) throws Exception {
    SessionUtil.setUserInfo(param);

    shopUserDao.update(param);

    //frontServiceFactory.getFrontTagService().update(param);

    int userId = Integer.valueOf(param.get("loginId").toString());

    attachFileService.update(
      file,
      deleteFile,
      Constant.USER_PIC_BBS_ID,
      userId
    );
  }

  public int checkPasswordCount(Map<String, Object> param) throws Exception {
    SessionUtil.setUserInfo(param);

    return shopUserDao.checkPasswordCount(param);
  }

  public void updatePassword(Map<String, Object> param) throws Exception {
    SessionUtil.setUserInfo(param);
    shopUserDao.updatePassword(param);
  }

  public void updateNewPassword(Map<String, Object> param) throws Exception {
    shopUserDao.updateNewPassword(param);
  }

  public void updatePushStatus(Map<String, Object> param) throws Exception {
    SessionUtil.setUserInfo(param);

    shopUserDao.updatePushStatus(param);
  }

  public void updatePushId(Map<String, Object> param) throws Exception {
    SessionUtil.setUserInfo(param);
    shopUserDao.updatePushId(param);
  }

  public Map<String, Object> getInfo(Map<String, Object> param)
    throws Exception {
    SessionUtil.setUserInfo(param);
    return shopUserDao.getInfo(param);
  }

  public void dropOut(Map<String, Object> param) throws Exception {
    SessionUtil.setUserInfo(param);
    shopUserDao.dropOut(param);
  }
}
