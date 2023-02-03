package com.daehwa.b2b.tmp;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Slf4j
@Controller
public class MainController {

  @Autowired
  private MainService mainService;

  @GetMapping(value = "")
  public String index(HttpServletRequest request) {
    return "index";
  }

  @GetMapping(value = "test1")
  public String test1(HttpServletRequest request) {
    log.debug(" test1 . ");

    try {
      List<?> mm = mainService.getSelect();
      System.out.println("zz1");
    } catch (Exception e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }

    return "index";
  }

  @GetMapping(value = "test2")
  public String test2(HttpServletRequest request) {
    log.debug(" test2 . ");

    try {
      List<?> mm = mainService.getSelect2();
      System.out.println("zz2");
    } catch (Exception e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }

    return "index";
  }

  @GetMapping(value = "device")
  public String device(Device device) {
    log.debug(" OK . ");
    if (null == device) {
      log.debug("is null");
    }
    return "index";
  }

  @GetMapping(value = "500")
  public String notFound() throws Exception {
    log.debug(" OK . ");
    throw new Exception();
  }
}
