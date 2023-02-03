package com.daehwa.b2b.shop.web;

import com.daehwa.b2b.common.util.ClassLoader;
import com.daehwa.b2b.common.util.CommonUtil;
import com.daehwa.b2b.common.util.SessionUtil;
import com.daehwa.b2b.shop.service.ShopLogService;
import com.daehwa.b2b.shop.service.ShopSearchService;
import com.daehwa.b2b.shop.service.ShopUserService;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.site.SitePreference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * shop Login Controller
 */
@Controller
@RequestMapping(value = "/shop")
public class ShopLoginController {

  private static final Logger logger = LoggerFactory.getLogger(
    ShopLoginController.class
  );

  @Autowired
  private ShopSearchService shopSearchService;

  @Autowired
  private ShopUserService shopUserService;

  @Autowired
  private ShopLogService shopLogService;

  /**
   * 메인 컨트롤러
   */

  @RequestMapping(value = "/main")
  public String main(
    SitePreference sitePreference,
    Device device,
    Model model,
    @RequestParam Map<String, Object> param
  ) throws Exception {
    logger.info("SitePreference : " + sitePreference);
    logger.info("Device : " + device);
    logger.info("param : " + param);
    model.addAttribute("banners", shopSearchService.getBanner(param));
    logger.info("1111 : ");
    if ("MOBILE".equals(sitePreference + "")) {
      model.addAttribute("mPprdt", shopSearchService.getTagList(param));
      model.addAttribute("tsPprdt", shopSearchService.getTSList(param));
    } else {
      logger.info("222 : ");
      model.addAttribute("mdPprdt", shopSearchService.getMainList(param));
      logger.info("333 : ");
    }
    logger.info("4444 : ");
    return "/shop/main";
  }

  /**
   *  shop 이용약관
   */
  @RequestMapping(value = "/provision")
  public String prologue(Model model, @RequestParam Map<String, Object> param)
    throws Exception {
    model.addAttribute("pageParm", param);
    return "/shop/provision";
  }

  /**
   *  패스워드 변경 페이지 유효성
   */
  @RequestMapping(value = "/chgPw")
  public String chgPw(Model model, @RequestParam Map<String, Object> param)
    throws Exception {
    String result = shopUserService.chkUrl(param);
    param.put("chk", result);
    model.addAttribute("pageParm", param);
    return "/shop/chgPw";
  }

  /**
   * shop 로그인 페이지 이동
   */
  @RequestMapping(value = "/login", method = RequestMethod.GET)
  public String login() throws Exception {
    logger.info("login");
    return "/shop/login";
  }

  /**
   * shop 인증번호 발송
   */
  @RequestMapping(value = "/loginAuthNo", method = RequestMethod.POST)
  public @ResponseBody Map<String, Object> ajaxSendAuthNo(
    @RequestParam Map<String, Object> param
  ) throws Exception {
    CommonUtil.log(logger, param, "sendAuthNo");
    Map<String, Object> jsonObject = ClassLoader.loadHashMap();

    try {
      String result = shopUserService.insertAuthSMS(param);
      if ("sendOk".equals(result)) {
        jsonObject.put("code", "success");
      } else {
        jsonObject.put("code", result);
      }
    } catch (Exception e) {
      e.printStackTrace();
      jsonObject.put("code", "error");
    }
    return jsonObject;
  }

  /**
   * shop 비밀번호 변경 - 인증번호 유효성 검사 후
   */
  @RequestMapping(value = "/setLoginPw", method = RequestMethod.POST)
  public @ResponseBody Map<String, Object> setLoginPw(
    @RequestParam Map<String, Object> param
  ) throws Exception {
    CommonUtil.log(logger, param, "setLoginPw");
    Map<String, Object> jsonObject = ClassLoader.loadHashMap();

    try {
      String result = shopUserService.setPassWord(param);
      if ("chgOk".equals(result)) {
        jsonObject.put("code", "success");
      } else {
        jsonObject.put("code", result);
      }
    } catch (Exception e) {
      e.printStackTrace();
      jsonObject.put("code", "error");
    }
    return jsonObject;
  }

  /**
   * shop 비밀번호 변경 - 인증번호 유효성 검사 후
   */
  @RequestMapping(value = "/setLoginPw2", method = RequestMethod.POST)
  public @ResponseBody Map<String, Object> setLoginPw2(
    @RequestParam Map<String, Object> param
  ) throws Exception {
    CommonUtil.log(logger, param, "setLoginPw2");
    Map<String, Object> jsonObject = ClassLoader.loadHashMap();

    try {
      shopUserService.setPassWord2(param);
      jsonObject.put("code", "success");
    } catch (Exception e) {
      e.printStackTrace();
      jsonObject.put("code", "error");
    }
    return jsonObject;
  }

  /**
   * shop 패스워드 초기화 이메일 발송.
   */
  @RequestMapping(value = "/setLoginEmail", method = RequestMethod.POST)
  public @ResponseBody Map<String, Object> setLoginEmail(
    @RequestParam Map<String, Object> param
  ) throws Exception {
    CommonUtil.log(logger, param, "setLoginEmail");
    Map<String, Object> jsonObject = ClassLoader.loadHashMap();

    try {
      String result = shopUserService.sendSetMail(param);

      if ("sendOk".equals(result)) {
        jsonObject.put("code", "success");
      } else {
        jsonObject.put("code", result);
      }
    } catch (Exception e) {
      e.printStackTrace();
      jsonObject.put("code", "error");
    }
    return jsonObject;
  }

  /**
   * shop 로그인 처리
   */
  @RequestMapping(value = "/doLogin", method = RequestMethod.POST)
  public @ResponseBody Map<String, Object> doLogin(
    Device device,
    HttpServletRequest request,
    @RequestParam Map<String, Object> param
  ) throws Exception {
    CommonUtil.log(logger, param, "do login");

    Map<String, Object> jsonObject = ClassLoader.loadHashMap();
    logger.info("Device : " + device);
    String ip = request.getRemoteAddr();
    param.put("ip", ip);
    param.put("device", device.toString());

    try {
      Map<String, Object> user = shopUserService.getView(param);
      //1 - 이메일 정보 없음.
      if (user == null) {
        param.put("isLogin", "N");
        jsonObject.put("code", "fail");
        jsonObject.put(
          "msg",
          "이메일 또는 비밀번호가 일치 하지 않습니다.\n\n비밀번호 5회 오류시 비밀번호 변경 후 이용 가능 합니다."
        );
        //2 - 패스워드 입력 오류 횟수 초과.
      } else if ("6".equals(user.get("USR_LV") + "")) {
        param.put("isLogin", "Y");
        jsonObject.put("code", "fail");
        jsonObject.put(
          "msg",
          "비밀번호 입력오류 횟수 초과 입니다.\n\n비밀번호 변경 후 이용 가능 합니다."
        );
        //3 - 패스워드 틀림.
      } else if (!(user.get("KEYIN_PW") + "").equals(user.get("USR_PW") + "")) {
        param.put("isLogin", "N");
        jsonObject.put("code", "fail");
        jsonObject.put(
          "msg",
          "이메일 또는 비밀번호가 일치 하지 않습니다.\n\n비밀번호 5회 오류시 비밀번호 변경 후 이용 가능 합니다."
        );

        shopUserService.updateLoginInfo(param);
        //4 - 패스워드 맞음
      } else if ("0".equals(user.get("USR_LV") + "")) {
        param.put("isLogin", "Y");
        jsonObject.put("code", "fail");
        jsonObject.put(
          "msg",
          "미승인 아이디 입니다.관리자 승인후 이용 가능 합니다."
        );
      } else if ("8".equals(user.get("USR_LV") + "")) {
        param.put("isLogin", "Y");
        jsonObject.put("code", "fail");
        jsonObject.put(
          "msg",
          "이용정지 된 계정입니다.\n\n자세한 사항은 고객센터에 문의 바랍니다."
        );
      } else if ("9".equals(user.get("USR_LV") + "")) {
        param.put("isLogin", "Y");
        jsonObject.put("code", "fail");
        jsonObject.put(
          "msg",
          "장기 미사용으로 인한 휴면계정으로 전환되었습니다\n\n재사용 하시려면 고객센터에 문의 바랍니다."
        );
      } else {
        if (
          "S".equals(user.get("USR_TP") + "") &&
          "YES".equals(user.get("EXTRA_INFO") + "")
        ) {
          user.put("additional_info", "N");
          jsonObject.put("code", "additional_info");
          jsonObject.put(
            "msg",
            "거래에 필요한 추가정보를 입력하시기 바랍니다."
          );
        } else {
          user.put("additional_info", "Y");
          jsonObject.put("code", "success");
          jsonObject.put("msg", "로그인에 성공 하였습니다.");
        }
        SessionUtil.setLoginSession("userSession", user);

        param.put("isLogin", "Y");
        shopUserService.updateLoginInfo(param);
      }
      shopLogService.insertLog(param);
    } catch (Exception e) {
      e.printStackTrace();
      jsonObject.put("code", "error");
      jsonObject.put(
        "msg",
        "로그인 중 오류가 발생하였습니다.\n\n다시 확인 바랍니다."
      );
    }
    return jsonObject;
  }

  /**
   * do login
   */
  @RequestMapping(value = "/doSNSLogin", method = RequestMethod.POST)
  public @ResponseBody Map<String, Object> doSNSLogin(
    Device device,
    HttpServletRequest request,
    @RequestParam Map<String, Object> param
  ) throws Exception {
    CommonUtil.log(logger, param, "do SNS Login");

    Map<String, Object> jsonObject = ClassLoader.loadHashMap();
    logger.info("Device : " + device);
    String ip = request.getRemoteAddr();
    param.put("ip", ip);
    param.put("device", device.toString());

    try {
      Map<String, Object> user = shopUserService.getView(param);

      if (user == null) {
        param.put("isLogin", "N");
        shopUserService.updateLoginInfo(param);

        jsonObject.put("code", "fail");
        jsonObject.put(
          "msg",
          "회원정보가 없습니다.회원가입 후 이용 하시기 바랍니다."
        );
      } else if ("0".equals(user.get("USR_LV") + "")) {
        param.put("isLogin", "Y");
        jsonObject.put("code", "fail");
        jsonObject.put(
          "msg",
          "미승인 아이디 입니다.관리자 승인후 이용 가능 합니다."
        );
      } else if ("6".equals(user.get("USR_LV") + "")) {
        param.put("isLogin", "Y");
        jsonObject.put("code", "fail");
        jsonObject.put(
          "msg",
          "비밀번호 입력오류 횟수 초과 입니다.\n\n비밀번호 변경 후 이용 가능 합니다."
        );
      } else if ("8".equals(user.get("USR_LV") + "")) {
        param.put("isLogin", "Y");
        jsonObject.put("code", "fail");
        jsonObject.put(
          "msg",
          "이용정지된 겨정입니다.\n\n재사용 하시려면 고객센터에 문의 바랍니다."
        );
      } else if ("9".equals(user.get("USR_LV") + "")) {
        param.put("isLogin", "Y");
        jsonObject.put("code", "fail");
        jsonObject.put(
          "msg",
          "장기 미사용으로 인한 휴면계정으로 전환되었습니다\n\n재사용 하시려면 고객센터에 문의 바랍니다."
        );
      } else {
        user.put("additional_info", "Y");
        jsonObject.put("code", "success");
        jsonObject.put("msg", "로그인에 성공 하였습니다.");
        SessionUtil.setLoginSession("userSession", user);

        param.put("isLogin", "Y");
        shopUserService.updateLoginInfo(param);
      }
      shopLogService.insertLog(param);
    } catch (Exception e) {
      e.printStackTrace();
      jsonObject.put("code", "error");
      jsonObject.put(
        "msg",
        "로그인 중 오류가 발생하였습니다.\n\n다시 확인 바랍니다."
      );
    }
    return jsonObject;
  }

  /**
   * shop logout
   */
  @RequestMapping(value = "/logout", method = RequestMethod.GET)
  public String logout(HttpSession session) throws Exception {
    logger.info("logout");
    session.invalidate();
    return "redirect:/shop/main";
  }

  /**
   * do ajax login
   */
  @RequestMapping(value = "/login", method = RequestMethod.POST)
  public @ResponseBody Map<String, Object> doAjaxLogin(
    @RequestParam Map<String, Object> param
  ) throws Exception {
    CommonUtil.log(logger, param, "do ajax login");

    Map<String, Object> jsonObject = ClassLoader.loadHashMap();

    try {
      Map<String, Object> user = shopUserService.getView(param);

      if (user != null) {
        jsonObject.put("code", "success");
      } else {
        jsonObject.put("code", "fail");
        jsonObject.put("msg", "이메일 또는 비밀번호가 일치 하지 않습니다.");
      }
    } catch (Exception e) {
      e.printStackTrace();

      jsonObject.put("code", "error");
      jsonObject.put("msg", "로그인 중 오류가 발생하였습니다.");
    }

    return jsonObject;
  }

  /**
   * check login
   */
  @RequestMapping(value = "/checkLogin")
  public @ResponseBody boolean checkAjaxLogin() throws Exception {
    logger.info("checkLogin");

    return SessionUtil.isLogin();
  }

  /**
   * get session
   */
  @RequestMapping(value = "/getSession")
  public @ResponseBody Map<String, Object> getSession() throws Exception {
    logger.info("getSession");

    Map<String, Object> jsonObject = ClassLoader.loadHashMap();

    try {
      Map<String, Object> userSession = SessionUtil.getUserSession();

      if (userSession != null) {
        jsonObject.put("code", "success");
        jsonObject.put("userSession", CommonUtil.convertToJson(userSession));
      } else {
        jsonObject.put("code", "fail");
        jsonObject.put("msg", "로그인정보가 없습니다.");
      }
    } catch (Exception e) {
      e.printStackTrace();

      jsonObject.put("code", "error");
      jsonObject.put("msg", "처리중 오류가 발생하였습니다.");
    }

    return jsonObject;
  }
}
