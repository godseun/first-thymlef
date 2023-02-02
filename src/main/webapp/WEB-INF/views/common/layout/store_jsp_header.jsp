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
						<img src="${staticRoot}/img/logo_02.png" alt="로고" /> 
					</a>
				</span>
			</div>
			<div class="main_top_menu">
					<span class="icon08" onclick="_BT.moveUrl(_BT.SHOP.URL.Common.Main);"> 쇼핑몰 </span>
			<c:choose>
				<c:when test="${empty userSession}">
					<!--비로그인시 나와야될메뉴-->
<!-- 					
					<span class="icon09" onclick="_BT.moveUrl(_BT.SHOP.URL.Join.Step);"> 회원가입 </span>
 -->					
					<span class="icon02" onclick="_BT.moveUrl(_BT.STORE.URL.CsCenter.Board);"> 고객센터 </span> 
<!-- 					
					<span class="icon03" onclick="_BT.moveUrl(_BT.STORE.URL.CsCenter.Notice);"> 알림 </span> 
 -->		
					<span class="icon07" onclick="_BT.moveUrl(_BT.STORE.URL.Common.Info);"> 로그인 </span>
					<!--비로그인시 나와야될메뉴-->
				</c:when>
				<c:otherwise>
					<!--로그인시 나와야될메뉴-->
					<span class="icon05" onclick="_BT.moveUrl(_BT.STORE.URL.CsCenter.Mypage);"> 회원정보 </span>
					<span class="icon02" onclick="_BT.moveUrl(_BT.STORE.URL.CsCenter.Board);"> 고객센터 </span> 
<!-- 					
					<span class="icon03" onclick="_BT.moveUrl(_BT.STORE.URL.CsCenter.Notice);"> 알림 </span> 
 -->					
					<span class="icon06" onclick="_BT.moveUrl(_BT.SHOP.URL.Common.Logout);"> 로그아웃 </span>
					<!--로그인시 나와야될메뉴-->
				</c:otherwise>
			</c:choose>		
			</div>
		</div>
	</form>
</div>
<!-- HEADER -->
<div class="gnb2">
	<div class="wid_1248">
		<a href="javascript:;" onclick="_BT.moveUrl(_BT.STORE.URL.Product.UpLoad);" class="Type02 menus menus010" data-type="015"> 물품등록 
			<span>
				<img src="${staticRoot}/img/icon_arrow01.png" alt=" 화살표" />
			</span>
		</a>
		<a href="javascript:;" onclick="_BT.moveUrl(_BT.STORE.URL.Product.PrdtMng);" class="Type01 menus menus01" data-type="c10"> 상품관리 </a>
		<a href="javascript:;" onclick="_BT.moveUrl(_BT.STORE.URL.Order.OrderMng);" class="Type01 menus menus01" data-type="c11"> 주문관리 </a> 
		<a href="javascript:;" onclick="_BT.moveUrl(_BT.STORE.URL.Order.DeliveryMng);" class="Type01 menus menus01" data-type="c12"> 배송관리 </a> 
		<a href="javascript:;" onclick="_BT.moveUrl(_BT.STORE.URL.Calculate.DashBoard);" class="Type01 menus menus01" data-type="c13"> 정산관리 </a> 
		<a href="javascript:;" onclick="_BT.moveUrl(_BT.STORE.URL.CsCenter.Board);" class="Type01 menus menus01" data-type="c14"> 판매자지원 </a> 
	
		<div class="menu_all menu_dtl_c10" style="display: none;" data-type="c10">
			<div class="menu_all_bg"> </div>
			<div class="manu_content">
				<table class="menu_all_Type01">
					<caption>첫번째 메뉴</caption>
					<colgroup>
						<col width="18%">
						<col width="82%">
					</colgroup>
					<tbody id="c10" class="c10">
					</tbody>
				</table>
			</div>
		</div>
		<div class="menu_all menu_dtl_c11" style="display: none;" data-type="c11">
			<div class="menu_all_bg"> </div>
			<div class="manu_content">
				<table class="menu_all_Type01">
					<caption>첫번째 메뉴</caption>
					<colgroup>
						<col width="18%">
						<col width="82%">
					</colgroup>
					<tbody id="c11" class="c11">
					</tbody>
				</table>
			</div>
		</div>
		<div class="menu_all menu_dtl_c12" style="display: none;" data-type="c12">
			<div class="menu_all_bg"> </div>
			<div class="manu_content">
				<table class="menu_all_Type01">
					<caption>첫번째 메뉴</caption>
					<colgroup>
						<col width="18%">
						<col width="82%">
					</colgroup>
					<tbody id="c12" class="c12">
					</tbody>
				</table>
			</div>
		</div>
		<div class="menu_all menu_dtl_c13" style="display: none;" data-type="c13">
			<div class="menu_all_bg"> </div>
			<div class="manu_content">
				<table class="menu_all_Type01">
					<caption>첫번째 메뉴</caption>
					<colgroup>
						<col width="18%">
						<col width="82%">
					</colgroup>
					<tbody id="c13" class="c13">
					</tbody>
				</table>
			</div>
		</div>
		<div class="menu_all menu_dtl_c14" style="display: none;" data-type="c14">
			<div class="menu_all_bg"> </div>
			<div class="manu_content">
				<table class="menu_all_Type01">
					<caption>첫번째 메뉴</caption>
					<colgroup>
						<col width="18%">
						<col width="82%">
					</colgroup>
					<tbody id="c14" class="c14">
					</tbody>
				</table>
			</div>
		</div>
		<div class="menu_all menu_dtl_c15" style="display: none;" data-type="c15">
			<div class="menu_all_bg"> </div>
			<div class="manu_content">
				<table class="menu_all_Type01">
					<caption>첫번째 메뉴</caption>
					<colgroup>
						<col width="18%">
						<col width="82%">
					</colgroup>
					<tbody id="c15" class="c15">
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
