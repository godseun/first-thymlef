package com.daehwa.b2b.config.filter;

import com.daehwa.b2b.common.util.SessionUtil;
import java.io.IOException;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

@Slf4j
@Component
public class CustomAuthenticationFIlter extends OncePerRequestFilter {

  @Override
  protected void doFilterInternal(
    HttpServletRequest request,
    HttpServletResponse response,
    FilterChain filterChain
  ) throws ServletException, IOException {
    if (
      !request.getRequestURI().startsWith("/m") &&
      !request.getRequestURI().startsWith("/img") &&
      !request.getRequestURI().startsWith("/css") &&
      !request.getRequestURI().startsWith("/js") &&
      !request.getRequestURI().startsWith("/upload") &&
      !request.getRequestURI().startsWith("/resource") &&
      !request.getRequestURI().startsWith("/error")
    ) {
      log.info(
        "======================================          LoginInterceptor preHandle START         ======================================"
      );

      try {
        log.info(
          "======================================" + request.getServerName()
        );
        log.info(
          "======================================" + request.getRequestURI()
        );
        if (request.getRequestURI().startsWith("/IniPay")) {} else if (
          request.getRequestURI().startsWith("/test")
        ) {} else if (request.getRequestURI().startsWith("/api")) {
          if (request.getRequestURI().toLowerCase().indexOf("login") == -1) {
            if (request.getSession().getAttribute("userSession") == null) {
              response.sendRedirect("/api/login");
            }
          }
        } else if (request.getRequestURI().startsWith("/shop")) {
          if (
            request.getRequestURI().toLowerCase().indexOf("chgpw") == -1 &&
            request.getRequestURI().toLowerCase().indexOf("search") == -1 &&
            request.getRequestURI().toLowerCase().indexOf("join") == -1 &&
            request.getRequestURI().toLowerCase().indexOf("login") == -1 &&
            request.getRequestURI().toLowerCase().indexOf("helpdesk") == -1 &&
            request.getRequestURI().toLowerCase().indexOf("provision") == -1 &&
            request.getRequestURI().toLowerCase().indexOf("error") == -1 &&
            request.getRequestURI().toLowerCase().indexOf("main") == -1
          ) {
            if (request.getSession().getAttribute("userSession") == null) {
              response.sendRedirect("/shop/main");
            }
          }
        } else if (request.getRequestURI().startsWith("/store")) {
          if (
            request.getRequestURI().toLowerCase().indexOf("join") == -1 &&
            request.getRequestURI().toLowerCase().indexOf("login") == -1 &&
            request.getRequestURI().toLowerCase().indexOf("info") == -1 &&
            request.getRequestURI().toLowerCase().indexOf("error") == -1 &&
            request.getRequestURI().toLowerCase().indexOf("partner") == -1
          ) {
            if (request.getSession().getAttribute("userSession") == null) {
              response.sendRedirect("/store/info");
            } else if (!"S".equals(SessionUtil.getUserSession().get("usrTp"))) {
              response.sendRedirect("/store/info");
            }
            /*	
					else if(
							SessionUtil.getUserSession().get("bizNo").equals("") ||
							SessionUtil.getUserSession().get("bizNo").equals("null") ||
							SessionUtil.getUserSession().get("bizNo").equals("NULL") ||
							SessionUtil.getUserSession().get("bizNo") == null){
						response.sendRedirect("/store/info");
					}
				*/
          }
        } else if (request.getRequestURI().startsWith("/front")) {
          if (
            request.getRequestURI().toLowerCase().indexOf("join") == -1 &&
            request.getRequestURI().toLowerCase().indexOf("login") == -1 &&
            request.getRequestURI().toLowerCase().indexOf("error") == -1 &&
            request.getRequestURI().toLowerCase().indexOf("main") == -1 &&
            request.getRequestURI().toLowerCase().indexOf("info") == -1
          ) {
            if (request.getSession().getAttribute("userSession") == null) {
              response.sendRedirect("/front/main");
            } else if (!"A".equals(SessionUtil.getUserSession().get("usrTp"))) {
              response.sendRedirect("/front/main");
            } else {
              if (
                request.getRequestURI().toLowerCase().indexOf("/order/") > 0 &&
                "0".equals(
                    (SessionUtil.getUserSession().get("aLv") + "").substring(
                        1,
                        2
                      )
                  )
              ) {
                response.sendRedirect("/front/info");
              } else if (
                request.getRequestURI().toLowerCase().indexOf("/calculate/") >
                0 &&
                "0".equals(
                    (SessionUtil.getUserSession().get("aLv") + "").substring(
                        4,
                        5
                      )
                  )
              ) {
                response.sendRedirect("/front/info");
              } else if (
                request.getRequestURI().toLowerCase().indexOf("/product/") >
                0 &&
                "0".equals(
                    (SessionUtil.getUserSession().get("aLv") + "").substring(
                        3,
                        4
                      )
                  )
              ) {
                response.sendRedirect("/front/info");
              } else if (
                request.getRequestURI().toLowerCase().indexOf("/customer/") >
                0 &&
                "0".equals(
                    (SessionUtil.getUserSession().get("aLv") + "").substring(
                        2,
                        3
                      )
                  )
              ) {
                response.sendRedirect("/front/info");
              } else if (
                request.getRequestURI().toLowerCase().indexOf("/site/") > 0 &&
                "0".equals(
                    (SessionUtil.getUserSession().get("aLv") + "").substring(
                        3,
                        4
                      )
                  )
              ) {
                response.sendRedirect("/front/info");
              } else if (
                request.getRequestURI().toLowerCase().indexOf("/setup/") > 0 &&
                "0".equals(
                    (SessionUtil.getUserSession().get("aLv") + "").substring(
                        5,
                        6
                      )
                  )
              ) {
                response.sendRedirect("/front/info");
              }
            }
          }
        }
      } catch (Exception e) {
        e.printStackTrace();
      }
      log.info(
        "======================================          LoginInterceptor preHandle END         ======================================"
      );
    }

    filterChain.doFilter(request, response);
  }
}
