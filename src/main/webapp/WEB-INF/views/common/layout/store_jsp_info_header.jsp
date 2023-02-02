<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/views/common/layout/include/base.jsp"%>
<link rel="stylesheet" href="${staticRoot}/css/jquery-ui.css" type="text/css" />
<script type="text/javascript" src="${staticRoot}/js/jquery-ui.js"></script>
<script type="text/javascript">
	var type = "'";
	var dupClick1 = false;
	$(function() {
		$(".menus").on("mouseover", function() {
			type = $(this).data("type");
			$(".menu_dtl_" + type).show();
			$(".menus").removeClass("on");
			$(this).addClass("on");
		});
		$(".gnb").on("mouseout", function() {
			type = "'";
			$(".menu_all").hide();
			$(".menus").removeClass("on");
		});
		$(".menu_all").on("mouseover", function() {
			type = $(this).data("type");
			$(".menu_dtl_" + type).show();
			$(".menus").removeClass("on");
			$(".menus" + type).addClass("on");
		});
		$(".menu_all").on("mouseout", function() {
			type = "'";
			$(".menu_all").hide();
			$(".menus").removeClass("on");
		});
	});
</script>

<!-- HEADER -->
<div class="wid_1248">
	<form id="sFrm" name="sFrm">
		<div class="top">
			<div class="store_main">
				<span class="search_content01"> 
					<a href="javascript:;" onclick="_BT.moveUrl(_BT.STORE.URL.Common.Main);"> 
						<img src="${staticRoot}/img/logo.png" alt="로고" /> 
						<span class="store_title">
							파트너 센터
						</span>
					</a>
				</span>
			</div>
			<div class="main_top_menu">
			<c:choose>
				<c:when test="${empty userSession}">
					
					<!--비로그인시 나와야될메뉴-->
					<span class="icon08" onclick="_BT.moveUrl(_BT.SHOP.URL.Common.Main);"> 쇼핑몰 </span>
					<span class="icon09" onclick="_BT.moveUrl(_BT.SHOP.URL.Join.Step);"> 회원가입 </span>
					<span class="icon07" onclick="_BT.moveUrl(_BT.SHOP.URL.Common.goLogin);"> 로그인 </span>
					<span href="/c12/c12_04.php" class="icon02"> 고객센터 </span> 
					<span href="/c12/c12_02.php" class="icon03"> 알림 </span>
					<!--비로그인시 나와야될메뉴-->
				</c:when>
				<c:otherwise>
					<!--로그인시 나와야될메뉴-->
					<c:if test="${userSession.usrTp eq 'S'}">
						<span class="icon01" onclick="_BT.moveUrl(_BT.SHOP.URL.Join.Step);"> 상점관리 </span>
					</c:if>
						<span class="icon04" onclick="_BT.moveUrl(_BT.SHOP.URL.Order.cart);"> 장바구니 </span>
					<span class="icon05"> 마이페이지 </span>
					<span class="icon06" onclick="_BT.moveUrl(_BT.SHOP.URL.Common.Logout);"> 로그아웃 </span>
					<!--로그인시 나와야될메뉴-->
				</c:otherwise>
			</c:choose>		
			</div>
		</div>
	</form>
</div>