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
					<%-- <a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Common.Main);"> --%>
					<a> 
						<img src="${staticRoot}/img/logo_adm.png" alt="로고" />
					</a>
				</span>
			</div>
			<div class="main_top_menu">
			<c:choose>
				<c:when test="${empty userSession}">
					<!--비로그인시 나와야될메뉴-->
					<span class="icon08" onclick="_BT.moveUrl(_BT.SHOP.URL.Common.Main);"> 쇼핑몰 </span>
					<span class="icon09" onclick="_BT.moveUrl(_BT.FRONT.URL.Common.Join);"> 회원가입 </span>
					<span class="icon07" onclick="_BT.moveUrl(_BT.FRONT.URL.Common.Login);"> 로그인 </span>
					<!--비로그인시 나와야될메뉴-->
				</c:when>
				<c:otherwise>
					<!--로그인시 나와야될메뉴-->
					<span class="icon06" onclick="_BT.moveUrl(_BT.FRONT.URL.Common.Logout);"> 로그아웃 </span>
					<!-- <span class="icon01" onclick="_BT.moveUrl(_BT.STORE.URL.Common.Main);"> 상점관리 </span>
					<span class="icon03" onclick="_BT.openPopup( _BT.FRONT.URL.Common.PopSms,'PopSms', '800', '810', true, true);"> SMS </span>
					<span class="icon09" onclick="_BT.openPopup( _BT.FRONT.URL.Common.PopPwS,'PopSearch', '1270', '800', true, true);"> 검색 </span> -->
					<span class="icon08" onclick="_BT.moveUrl(_BT.SHOP.URL.Common.Main);"> 쇼핑몰 </span>
					<!--로그인시 나와야될메뉴-->
				</c:otherwise>
			</c:choose>		
			</div>
		</div>
	</form>
</div>
<!-- HEADER -->
<div class="gnb4">
	<div class="wid_1248">
		<!-- <a href="javascript:;" onclick="_BT.moveUrl(_BT.FRONT.URL.Search.Search);" class="Type02 menus menus010" data-type="015"> CRM 센터 -->
		<a href="javascript:;" onclick="_BT.moveUrl(_BT.FRONT.URL.Common.Main);" class="Type01 menus menus010 on" data-type="015"> 메인 센터
			<%-- <span>
				<img src="${staticRoot}/img/icon_arrow01.png" alt=" 화살표" />
			</span> --%>
		</a>
		<a href="javascript:;" onclick="_BT.moveUrl(_BT.FRONT.URL.Order.DashBoard);" class="Type01 menus menus01" data-type="c10"> 주문 관리 </a>
		<a href="javascript:;" onclick="_BT.moveUrl(_BT.FRONT.URL.Calculate.DashBoard);" class="Type01 menus menus01" data-type="c15"> 마감 관리 </a>
		<a href="javascript:;" onclick="_BT.moveUrl(_BT.FRONT.URL.Product.ItemMng);" class="Type01 menus menus01" data-type="c11"> 상품 관리 </a> 
		<a href="javascript:;" onclick="_BT.moveUrl(_BT.FRONT.URL.Customer.UserMng);" class="Type01 menus menus01" data-type="c12"> 고객 관리 </a> 
		<a href="javascript:;" onclick="_BT.moveUrl(_BT.FRONT.URL.Site.Board);" class="Type01 menus menus01" data-type="c13"> 사이트 관리 </a> 
		<a href="javascript:;" onclick="_BT.moveUrl(_BT.FRONT.URL.Setup.Code);" class="Type01 menus menus01" data-type="c14"> 설  정 </a> 
	</div>
</div>
