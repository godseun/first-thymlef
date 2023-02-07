package com.daehwa.b2b.front.dao;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FrontSearchDao {
  public List<Map<String, Object>> getCodeMst(Map<String, Object> param);

  public List<Map<String, Object>> getCodeDtl(Map<String, Object> param);

  public List<Map<String, Object>> getMakerCd(Map<String, Object> param);

  public List<Map<String, Object>> getCateg(Map<String, Object> param);

  public List<Map<String, Object>> getUserList(Map<String, Object> param);

  public List<Map<String, Object>> getStoreList(Map<String, Object> param);

  public List<Map<String, Object>> getContList(Map<String, Object> param);

  public List<Map<String, Object>> getUserBbs(Map<String, Object> param);

  public List<Map<String, Object>> getUserCart(Map<String, Object> param);

  public List<Map<String, Object>> getUserDCart(Map<String, Object> param);

  public List<Map<String, Object>> getBbsList(Map<String, Object> param);

  public List<Map<String, Object>> getContBbsList(Map<String, Object> param);

  public List<Map<String, Object>> getPromoList(Map<String, Object> param);

  public List<Map<String, Object>> getPrdtList(Map<String, Object> param);

  public List<Map<String, Object>> getPrdtDistList(Map<String, Object> param);

  public List<Map<String, Object>> getPrdtInfo(Map<String, Object> param);

  public List<Map<String, Object>> getPrdtDtlList(Map<String, Object> param);

  public List<Map<String, Object>> getPrdtDtlList2(Map<String, Object> param);

  public List<Map<String, Object>> getPrdtDtlList3(Map<String, Object> param);

  public List<Map<String, Object>> getPromoPrdtList(Map<String, Object> param);

  public List<Map<String, Object>> getUpPrdtList(Map<String, Object> param);

  public List<Map<String, Object>> getMdPrdtList(Map<String, Object> param);

  public List<Map<String, Object>> getMovieList(Map<String, Object> param);

  public List<Map<String, Object>> getTmpStoreList(Map<String, Object> param);

  public Map<String, Object> getOrderDashBoard(Map<String, Object> param);

  public List<Map<String, Object>> getOrderList(Map<String, Object> param);

  public List<Map<String, Object>> getOrderDtlList(Map<String, Object> param);

  public List<Map<String, Object>> getRtnOrderDtl(Map<String, Object> param);

  public List<Map<String, Object>> getPrdtInfoMst(Map<String, Object> param);

  public List<Map<String, Object>> getPrdtInfoDtl(Map<String, Object> param);

  public List<Map<String, Object>> getOrderAll(Map<String, Object> param);

  public List<Map<String, Object>> getOrdrRmk(Map<String, Object> param);

  public List<Map<String, Object>> chartDailyMagam(Map<String, Object> param);

  public List<Map<String, Object>> chartDailyJoin(Map<String, Object> param);

  public List<Map<String, Object>> chartCategMagam(Map<String, Object> param);

  public List<Map<String, Object>> chartMakerMagam(Map<String, Object> param);

  public List<Map<String, Object>> getCalculateDashBoard(
    Map<String, Object> param
  );

  public List<Map<String, Object>> getCommMsg(Map<String, Object> param);

  public List<Map<String, Object>> getSmsList(Map<String, Object> param);

  public List<Map<String, Object>> getMagamMng(Map<String, Object> param);

  public List<Map<String, Object>> getPurchaseMng(Map<String, Object> param);

  public List<Map<String, Object>> getStrMagam(Map<String, Object> param);

  public List<Map<String, Object>> getStrMagamDtl(Map<String, Object> param);

  public List<Map<String, Object>> getStrDevy(Map<String, Object> param);

  public List<Map<String, Object>> getPurchase(Map<String, Object> param);

  public List<Map<String, Object>> getSalesMng(Map<String, Object> param);

  public List<Map<String, Object>> getSalesSum(Map<String, Object> param);

  public List<Map<String, Object>> getCancelMng(Map<String, Object> param);

  public List<Map<String, Object>> getSalesCal(Map<String, Object> param);

  public List<Map<String, Object>> getEstMstList(Map<String, Object> param);

  public List<Map<String, Object>> getEstPrdtList(Map<String, Object> param);

  public List<Map<String, Object>> searchMob(Map<String, Object> param);

  public List<Map<String, Object>> getCrmUsr(Map<String, Object> param);

  public List<Map<String, Object>> getCrmList(Map<String, Object> param);

  public List<Map<String, Object>> getCrmDtl(Map<String, Object> param);

  public Map<String, Object> getTaxInfo(Map<String, Object> param);

  public List<Map<String, Object>> getNotiList(Map<String, Object> param);

  public List<Map<String, Object>> getSaleList(Map<String, Object> param);

  public List<Map<String, Object>> getSalePrdtList(Map<String, Object> param);

  public List<Map<String, Object>> getMissCall(Map<String, Object> param);

  public Map<String, Object> getArsUsrInfo(Map<String, Object> param);

  public List<Map<String, Object>> getCaImgInfo(Map<String, Object> param);

  public List<Map<String, Object>> getSetPrdMst(Map<String, Object> param);

  public List<Map<String, Object>> getSetPrdtList(Map<String, Object> param);

  public List<Map<String, Object>> getAdPrdtList(Map<String, Object> param);

  public List<Map<String, Object>> getPrdtImgL(Map<String, Object> param);

  public List<Map<String, Object>> getImgPrdt(Map<String, Object> param);

  public Map<String, Object> getOrdrUsrInfo(Map<String, Object> param);
}
