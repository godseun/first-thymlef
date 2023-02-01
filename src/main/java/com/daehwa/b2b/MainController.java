package com.daehwa.b2b;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Slf4j
@Controller
public class MainController {

  @GetMapping(value = "")
  public String getMethodName() {
    log.debug(" OK . ");
    return "index";
  }
}
