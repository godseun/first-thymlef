package com.daehwa.b2b.common.error;

import javax.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Common Error Controller
 */
@Slf4j
@Controller
@RequestMapping(value = "/error")
public class ErrorController {

  @GetMapping(value = "/404")
  public String E404(HttpServletRequest request) {
    log.info(
      "======================================" + request.getRequestURL()
    );
    log.info("404");

    return "/common/error/404";
  }

  @GetMapping(value = "/500")
  public String E500() {
    log.info("500");

    return "/common/error/500";
  }

  @GetMapping(value = "/globalError")
  public String globalError() {
    log.info("globalError");

    return "/common/error/globalError";
  }

  @GetMapping(value = "/dataAccessFailure")
  public String dataAccessFailure() {
    log.info("dataAccessFailure");

    return "/common/error/dataAccessFailure";
  }

  @GetMapping(value = "/transactionFailure")
  public String transactionFailure() {
    log.info("transactionFailure");

    return "/common/error/transactionFailure";
  }

  @GetMapping(value = "/bizException")
  public String bizException() {
    log.info("bizException");

    return "/common/error/bizException";
  }

  @GetMapping(value = "/accessDenied")
  public String accessDenied() {
    log.info("accessDenied");

    return "/common/error/accessDenied";
  }
}
