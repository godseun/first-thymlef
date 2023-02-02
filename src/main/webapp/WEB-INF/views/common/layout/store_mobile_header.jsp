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
<div class="wid_no_chg2">
	<div class="ad_content01" style="text-align: center; margin: 3px 0 ;">
		<a href="javascript:;" onclick="_BT.moveUrl(_BT.STORE.URL.Common.Main);"> 
			<img src="${staticRoot}/img/logo_02.png" alt="로고" style="width: auto; height: 30px;" />
		</a>
	</div>
</div>
<!-- HEADER -->
<div class="gnb3">
		<a href="javascript:;" onclick="_BT.moveUrl(_BT.STORE.URL.Product.UpLoad);" class="Type02 menus menus010" data-type="015"> 물품등록 
			<span>
				<img src="${staticRoot}/img/icon_arrow01.png" alt=" 화살표" />
			</span>
		</a>
		<a href="javascript:;" onclick="_BT.moveUrl(_BT.STORE.URL.Menus.c10);" class="Type01 menus menus01" data-type="c10"> 상품관리 </a>
		<a href="javascript:;" onclick="_BT.moveUrl(_BT.STORE.URL.Menus.c11);" class="Type01 menus menus01" data-type="c11"> 주문관리 </a> 
<%--
		<a href="javascript:;" onclick="_BT.moveUrl(_BT.STORE.URL.Menus.c12);" class="Type01 menus menus01" data-type="c12"> 배송관리 </a> 
 --%>

</div>
