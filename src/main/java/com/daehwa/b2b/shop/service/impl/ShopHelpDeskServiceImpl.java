package com.daehwa.b2b.shop.service.impl;

import com.daehwa.b2b.admin.service.ContactService;
import com.daehwa.b2b.common.util.ClassLoader;
import com.daehwa.b2b.common.util.CommonUtil;
import com.daehwa.b2b.common.util.Constant;
import com.daehwa.b2b.common.util.SessionUtil;
import com.daehwa.b2b.shop.dao.ShopHelpDeskDao;
import com.daehwa.b2b.shop.service.ShopHelpDeskService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public class ShopHelpDeskServiceImpl implements ShopHelpDeskService {

  @Autowired
  private ShopHelpDeskDao shopHelpDeskDao;

  @Autowired
  private ContactService contactService;

  @Override
  public void insertQNA(Map<String, Object> param) throws Exception {
    Map<String, Object> tMap = ClassLoader.loadHashMap();
    if (SessionUtil.isLogin()) {
      SessionUtil.setUserInfo(param);
      param.put("bbsId", Constant.USER_QNA);
      tMap.put("type", Constant.USER_QNA);
    } else {
      param.put("usrId", "00000000");
      param.put("bbsId", Constant.GUEST_QNA);
      tMap.put("type", Constant.GUEST_QNA);
    }
    shopHelpDeskDao.insertQNA(param);
    contactService.sendContactMsg(tMap);
  }

  @Override
  public void writePartner(Map<String, Object> param) throws Exception {
    Map<String, Object> tMap = ClassLoader.loadHashMap();
    param.put("usrId", "00000000");
    param.put("bbsId", Constant.STORE_JOIN);
    shopHelpDeskDao.insertQNA(param);
    tMap.put("type", Constant.STORE_JOIN);
    contactService.sendContactMsg(tMap);
  }

  @Override
  public void writePrductQna(Map<String, Object> param) throws Exception {
    SessionUtil.setUserInfo(param);
    String tmpTitle[] = (param.get("email") + "").split("@");
    String id = tmpTitle[0].substring(0, 3);
    String mail = tmpTitle[1].substring(0, 3);
    int cntId = tmpTitle[0].length() - 3;
    int cntEmail = tmpTitle[1].length() - 3;

    for (int i = 0; i < cntId; i++) {
      id += "*";
    }
    for (int i = 0; i < cntEmail; i++) {
      mail += "*";
    }
    param.put("bbsId", Constant.PRDUCT_QNA);
    param.put("title", id + "@" + mail);
    shopHelpDeskDao.insertQNA(param);

    Map<String, Object> tMap = ClassLoader.loadHashMap();
    tMap.put("send", "9to6");
    tMap.put("type", "PDT");
    tMap.put("relateCd", param.get("relateCd"));
    tMap.put("bbsCon", param.get("bbsCon"));
    contactService.sendContactMsg(tMap);
  }

  @Override
  public List<Map<String, Object>> getBbsList(Map<String, Object> param)
    throws Exception {
    return shopHelpDeskDao.getBbsList(param);
  }

  @Override
  public List<Map<String, Object>> getQnaList(Map<String, Object> param)
    throws Exception {
    SessionUtil.setUserInfo(param);
    return shopHelpDeskDao.getQnaList(param);
  }

  @Override
  public List<Map<String, Object>> getBbsCnt(Map<String, Object> param)
    throws Exception {
    return shopHelpDeskDao.getBbsCnt(param);
  }

  @Override
  public List<Map<String, Object>> getPromoList(Map<String, Object> param)
    throws Exception {
    return shopHelpDeskDao.getPromoList(param);
  }

  @Override
  public Map<String, Object> getPromoDtl(Map<String, Object> param)
    throws Exception {
    Map<String, Object> result = ClassLoader.loadHashMap();
    result.put("PromoInfo", shopHelpDeskDao.getPromoInfo(param));
    result.put("PromoPrdt", shopHelpDeskDao.getPromoPrdt(param));
    return result;
  }

  @Override
  public Map<String, Object> getCategPromoDtl(Map<String, Object> param)
    throws Exception {
    Map<String, Object> result = ClassLoader.loadHashMap();
    result.put("PromoInfo", shopHelpDeskDao.getPromoInfo(param));
    result.put("PromoPrdt", shopHelpDeskDao.getCategPromoPrdt(param));
    return result;
  }

  @Override
  public List<Map<String, Object>> getEstimateList(Map<String, Object> param)
    throws Exception {
    param.put("mobileNo", SessionUtil.getEstimateInfo().get("usrMo"));
    param.put("usrPw", SessionUtil.getEstimateInfo().get("usrPw"));
    return shopHelpDeskDao.getEstimateList(param);
  }

  @Override
  public String setEestimateMst(Map<String, Object> param) throws Exception {
    param.put("mobileNo", SessionUtil.getEstimateInfo().get("usrMo"));
    param.put("usrPw", SessionUtil.getEstimateInfo().get("usrPw"));
    return shopHelpDeskDao.setEestimateMst(param);
  }

  @Override
  public Map<String, Object> getEstimateInfo(Map<String, Object> param)
    throws Exception {
    param.put("mobileNo", SessionUtil.getEstimateInfo().get("usrMo"));
    param.put("usrPw", SessionUtil.getEstimateInfo().get("usrPw"));
    return shopHelpDeskDao.getEstimateInfo(param);
  }

  @Override
  public void setEestimatePrdt(Map<String, Object> param) throws Exception {
    Map<String, Object> tmp = ClassLoader.loadHashMap();
    tmp.put("mobileNo", SessionUtil.getEstimateInfo().get("usrMo"));
    tmp.put("usrPw", SessionUtil.getEstimateInfo().get("usrPw"));
    tmp.put("estId", SessionUtil.getEstimateInfo().get("estId"));
    int cnt = Integer.parseInt(CommonUtil.nvl(param.get("cnt") + "", "0"));

    for (int i = 0; i < cnt; i++) {
      Map<String, Object> tmpParm = ClassLoader.loadHashMap();
      tmpParm.putAll(tmp);
      tmpParm.put("PRDT_CD", param.get("p_cd" + i));
      tmpParm.put("PRDT_DTL_CD", param.get("p_dtl_cd" + i));
      shopHelpDeskDao.setEestimatePrdt(tmpParm);
    }
  }

  @Override
  public List<Map<String, Object>> getEstimatePrdt(Map<String, Object> param)
    throws Exception {
    param.put("mobileNo", SessionUtil.getEstimateInfo().get("usrMo"));
    param.put("usrPw", SessionUtil.getEstimateInfo().get("usrPw"));
    return shopHelpDeskDao.getEstimatePrdt(param);
  }

  @Override
  public void delEstPrdt(Map<String, Object> param) throws Exception {
    param.put("mobileNo", SessionUtil.getEstimateInfo().get("usrMo"));
    param.put("usrPw", SessionUtil.getEstimateInfo().get("usrPw"));
    param.put("estId", SessionUtil.getEstimateInfo().get("estId"));

    int cnt = Integer.parseInt(CommonUtil.nvl(param.get("cnt") + "", "0"));
    List<String> tmpList = ClassLoader.loadList();
    for (int i = 0; i < cnt; i++) {
      String tmpP = CommonUtil.nvl(param.get("prductDtlCode" + i) + "", "");
      tmpList.add(tmpP);
    }
    param.put("PRDT_DTL_CD", tmpList);
    shopHelpDeskDao.delEstPrdt(param);
  }

  @Override
  public void reqEst(Map<String, Object> param) throws Exception {
    param.put("mobileNo", SessionUtil.getEstimateInfo().get("usrMo"));
    param.put("usrPw", SessionUtil.getEstimateInfo().get("usrPw"));
    param.put("estId", SessionUtil.getEstimateInfo().get("estId"));

    String[] prdtDtl = (String[]) param.get("prdtDtl");
    String[] prdtQy = (String[]) param.get("prdtQy");
    String[] prdtRmk = (String[]) param.get("prdtRmk");

    for (int i = 0; i < prdtDtl.length; i++) {
      Map<String, Object> tmp = ClassLoader.loadHashMap();
      tmp.putAll(param);

      tmp.put("prdtDtl", prdtDtl[i]);
      tmp.put("prdtQy", prdtQy[i]);
      tmp.put("prdtRmk", prdtRmk[i]);
      shopHelpDeskDao.uptEstPrdt(tmp);
    }
    param.put("cnt", prdtDtl.length);
    shopHelpDeskDao.reqEst(param);

    param.put("send", "9to6");
    param.put("type", "EST");
    contactService.sendContactMsg(param);
  }

  @Override
  public Map<String, Object> getEstDocInfo(Map<String, Object> param)
    throws Exception {
    param.put("mobileNo", SessionUtil.getEstimateInfo().get("usrMo"));
    param.put("usrPw", SessionUtil.getEstimateInfo().get("usrPw"));
    return shopHelpDeskDao.getEstDocInfo(param);
  }

  @Override
  public List<Map<String, Object>> getEstDocPrdt(Map<String, Object> param)
    throws Exception {
    param.put("mobileNo", SessionUtil.getEstimateInfo().get("usrMo"));
    param.put("usrPw", SessionUtil.getEstimateInfo().get("usrPw"));
    return shopHelpDeskDao.getEstDocPrdt(param);
  }

  @Override
  public void canEst(Map<String, Object> param) throws Exception {
    param.put("mobileNo", SessionUtil.getEstimateInfo().get("usrMo"));
    param.put("usrPw", SessionUtil.getEstimateInfo().get("usrPw"));
    shopHelpDeskDao.canEst(param);
  }

  @Override
  public List<Map<String, Object>> getPopList(Map<String, Object> param)
    throws Exception {
    param.put("bbsId", "POP");
    return shopHelpDeskDao.getPopList(param);
  }
}
