package com.daehwa.b2b.common.error;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

@Slf4j
public class CustomExceptionResolver implements HandlerExceptionResolver {

  @Override
  public ModelAndView resolveException(
    HttpServletRequest request,
    HttpServletResponse response,
    Object handler,
    Exception ex
  ) {
    if (!ex.equals(null)) log.info(ex.getMessage());
    // 적당히 반환할 값 처리 (Map이 아니어도 상관없음)
    Map<String, String> resultMap = new HashMap<>();
    resultMap.put("result", "에러 결과 처리");
    ModelAndView modelAndView = new ModelAndView("common/error/404", resultMap);
    modelAndView.setStatus(HttpStatus.BAD_REQUEST);
    return modelAndView;
  }
}
