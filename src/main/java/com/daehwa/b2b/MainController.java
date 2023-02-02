package com.daehwa.b2b;

import javax.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Slf4j
@Controller
public class MainController {

  @GetMapping(value = "")
  public String index(HttpServletRequest request) {
    Device currentDevice = DeviceUtils.getCurrentDevice(request);
    log.debug(" OK . ");
    return "index";
  }

  @GetMapping(value = "device")
  public String device(Device device) {
    log.debug(" OK . ");
    return "index";
  }

  @GetMapping(value = "500")
  public String notFound() throws Exception {
    log.debug(" OK . ");
    throw new Exception();
  }
}
