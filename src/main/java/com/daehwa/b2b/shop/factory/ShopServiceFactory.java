package com.daehwa.b2b.shop.factory;

import com.daehwa.b2b.shop.service.ShopHelpDeskService;
import com.daehwa.b2b.shop.service.ShopJoinService;
import com.daehwa.b2b.shop.service.ShopLogService;
import com.daehwa.b2b.shop.service.ShopOrderService;
import com.daehwa.b2b.shop.service.ShopSearchService;
import com.daehwa.b2b.shop.service.ShopUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@RequiredArgsConstructor
@Component
public class ShopServiceFactory {

  private ShopJoinService shopJoinService;

  private ShopLogService shopLogService;

  private ShopUserService shopUserService;

  private ShopSearchService shopSearchService;

  private ShopOrderService shopOrderService;

  private ShopHelpDeskService shopHelpDeskService;

  public ShopJoinService getShopJoinService() {
    return shopJoinService;
  }

  public ShopLogService getShopLogService() {
    return shopLogService;
  }

  public ShopUserService getShopUserService() {
    return shopUserService;
  }

  public ShopSearchService getShopSearchService() {
    return shopSearchService;
  }

  public ShopOrderService getShopOrderService() {
    return shopOrderService;
  }

  public ShopHelpDeskService getShopHelpDeskService() {
    return shopHelpDeskService;
  }
}
