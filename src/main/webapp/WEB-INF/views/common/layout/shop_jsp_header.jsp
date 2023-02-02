<%@page language="java" contentType="text/html; charset=UTF-8" 	pageEncoding="UTF-8"%>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/views/common/layout/include/base.jsp"%>
<link rel="stylesheet" href="${staticRoot}/css/jquery-ui.css" type="text/css" />
<style>
	input[type=text]::-ms-clear {
		display:none;
	}
</style>
<%-- 
	<script type="text/javascript" src="${staticRoot}/js/allCteg.js"></script>
 --%>
 
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css"> 
<script type="text/javascript" src="${staticRoot}/js/jquery-ui.js"></script>
<script type="text/javascript">
	var type = "'";
	var dupClick1 = false;
	$(function() {
/* 		
		_BT.CategSearch.makeMenu();
 */		
		var searchTp = _BT.Cookie.get("searchTp");
		if (_BT.isEquals(searchTp, "N")) {
			$(".main_search_btn01").removeClass("mOn5");
			$("#searchBar").hide();
		} else {
			$(".main_search_btn01").addClass("mOn5");
			$("#searchBar").show();
		}
		$(".input_style11").on("focus", function() {
			$(this).val("");
			$(this).addClass("mOn");
		});
		$(".input_style11").on("focusout", function() {
			$(this).removeClass("mOn");
		});
		$("#mValue").on("focus", function() {
			$(this).val("");
		});
		$(".main_search_btn").on("click", function() { 
			$("#mValue"	).val(	_BT.getTrimValue($("#mValue").val()));
			$("#mName"	).val(	_BT.getTrimValue($("#mName").val()));
			$("#mBrand"	).val(	_BT.getTrimValue($("#mBrand").val()));
			$("#mStndrd"	).val(	_BT.getTrimValue($("#mStndrd").val()));
			$("#mModel"	).val(	_BT.getTrimValue($("#mModel").val()));
			$("#mCode"	).val(	_BT.getTrimValue($("#mCode").val()));
			if(
						_BT.isEmpty($("#mValue").val())
					&&	_BT.isEmpty($("#mName").val())
					&&	_BT.isEmpty($("#mBrand").val())
					&&	_BT.isEmpty($("#mStndrd").val())
					&&	_BT.isEmpty($("#mModel").val())
					&&	_BT.isEmpty($("#mCode").val())
			){
				alert("검색할 내용을 입력해 주시기 바랍니다.");
				return false;
			}
			_BT.actFormSubmit("sFrm", "POST",_BT.SHOP.URL.Search.mSearch); 
		});
		$(".menus").on("mouseover", function() {
			type = $(this).data("type");
			console.log(type);
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
		$("#mValue").autocomplete({
			minLength: 2,
			source : function( request, response ) {
            $.ajax({
                   type: 'post',
                   url: _BT.SHOP.URL.Search.Suggest,
                   dataType: "json",
                   //request.term = $("#autocomplete").val()
                   data: { keyWord : request.term },
                   success: function(data) {
                       //서버에서 json 데이터 response 후 목록에 뿌려주기 위함
                       response(
                           $.map(data.list, function(item) {
                               return {
                                   label: item.KEY_TEXT,
                                   value: item.KEYWORD
                               }
                           })
                       );
                   }
              });
				},
	      focus: function( event, ui ) {
	        	return false;
	      },
	      select: function( event, ui ) {
				$( "#mValue" ).val( ui.item.value );
				return false;
        }
		})
	    .autocomplete( "instance" )._renderItem = function( ul, item ) {
			return $( "<li>" )
				.append( "<div>" + item.label + "</div>")
				.appendTo( ul );
		};

		_BT.setOnEnter("mValue","main_search_btn");	
		_BT.setOnEnter("mName","main_search_btn");	
		_BT.setOnEnter("mBrand","main_search_btn");	
		_BT.setOnEnter("mStndrd","main_search_btn");	
		_BT.setOnEnter("mModel","main_search_btn");	
		_BT.setOnEnter("mCode","main_search_btn");	
	});
	function swDetail() {
		if ($("#searchBar").is(":hidden")) {
			$("#searchBar").slideDown();
			$(".main_search_btn01").addClass("mOn5");
			_BT.Cookie.set("searchTp", "D");
		} else {
			$(".main_search_btn01").removeClass("mOn5");
			$("#searchBar").hide();
			_BT.Cookie.set("searchTp", "N");
		}
	}
</script>

<!-- HEADER -->
<div class="wid_no_chg">
<!-- HEADER 
	<p class="hd_home" style="font-size:10px;z-index:999;"><a href="#" id="favorite" style="font-size:10px;z-index:999;"><i class="fa fa-lg fa-home" aria-hidden="true"style="font-size:10px;z-index:999;">&nbsp;&nbsp;즐겨찾기 추가</i></a></p>
-->
	<form id="sFrm" name="sFrm">
		<div class="top">
			<h1>
				<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Common.Main);"> 
				<img src="${staticRoot}/img/logo.png" alt="로고" />
				</a>
			</h1>
			<div class="main_search">
				<span class="search_content01"> 
					<input class="main_input_search01" id="mValue" name="mValue" type="text" style="color: #14429A;" placeholder="                                 이제 산업 부품은 대화공업에서 구매할 때!!" maxlength="30"  value="<c:out value="${query.mValue}"/>"/> 
					<a href="javascript:;" id="main_search_btn" class="main_search_btn">
						<img src="${staticRoot}/img/common/icon.png">
					</a>
					
				</span> 
				<span class="search_content02" onclick="swDetail();"> 
					<a href="javascript:;" class="main_search_btn01">상세검색</a> 
				</span>
			</div>
			<div class="main_top_menu" style="text-align: right;">
			<c:choose>
				<c:when test="${empty userSession}">
					<!--비로그인시 나와야될메뉴-->
					<span class="icon07" onclick="_BT.moveUrl(_BT.SHOP.URL.Common.goLogin);">로그인</span>
					<span class="icon09" onclick="_BT.moveUrl(_BT.SHOP.URL.Join.bStep1);">회원가입</span>
					<span class="icon02" onclick="_BT.moveUrl(_BT.SHOP.URL.Helpdesk.FAQ);">고객센터</span> 
					<!--
					<span class="icon01" onclick="_BT.moveUrl(_BT.STORE.URL.Common.Main);">상점관리</span>
					-->
					<!--비로그인시 나와야될메뉴-->
				</c:when>
				<c:otherwise>
					<!--로그인시 나와야될메뉴-->
					<span class="icon06" onclick="_BT.moveUrl(_BT.SHOP.URL.Common.Logout);">로그아웃</span>
					<span class="icon04" onclick="_BT.moveUrl(_BT.SHOP.URL.Order.cart);">장바구니</span>
					<span class="icon05" onclick="_BT.moveUrl(_BT.SHOP.URL.User.Info);">내정보</span>
					<!--
					<span class="icon03" onclick="_BT.openPopup( _BT.SHOP.URL.User.PopAlarm,'PopAlarm', '400', '700', true, true);">알림</span>
					-->
					<span class="icon02" onclick="_BT.moveUrl(_BT.SHOP.URL.Helpdesk.FAQ);">고객센터</span> 
					
					<c:if test="${userSession.usrTp eq 'S'}">
						<span class="icon01" onclick="_BT.moveUrl(_BT.SHOP.URL.Common.sMain);">상점관리</span>
					</c:if>
					<c:if test="${userSession.usrTp eq 'A'}">
						<span class="icon01" onclick="_BT.moveUrl(_BT.SHOP.URL.Common.fMain);">관리자</span>
					</c:if>
					<!--로그인시 나와야될메뉴-->
				</c:otherwise>
			</c:choose>		
			</div>
			<div id="searchBar" class="main_search" style="margin-top: 4px;">
				<span class="search_content_dtl"> 
					<input type="text" id="mName" name="mName" placeholder="           품명" class="input_style11"  maxlength="20" value="<c:out value="${query.mName}"/>"/> 
					<%-- <input type="text" id="mBrand" name="mBrand" placeholder="         브랜드" class="input_style11 marginleft_5" maxlength="20"  value="<c:out value="${query.mBrand}"/>"/>  --%>
					<input type="text" id="mStndrd" name="mStndrd" placeholder="          규격" class="input_style11 marginleft_5" maxlength="30"  value="<c:out value="${query.mStndrd}"/>"/> 
					<input type="text" id="mModel" name="mModel" placeholder="         모델명" class="input_style11 marginleft_5" maxlength="20"  value="<c:out value="${query.mModel}"/>"/> 
					<input type="text" id="mCode" name="mCode" placeholder="       대화코드" class="input_style11 marginleft_5" maxlength="10"  style="color: #3f51b5; border: 2px solid #3f51b5; font-weight: bolder;"  value="<c:out value="${query.mCode}"/>"/> 
				</span>
				<c:if test="${!empty userSession}">
					<span style="float: right;font-size:14px;color:#3f51b5; padding-top:10px;">
						<span style="font-weight: bold;">${userSession.usrNm}님</span> 환영 합니다.
					</span>
				</c:if>
			</div>
		</div>
	</form>
</div>
<!-- HEADER -->
<div class="gnb">
	<div class="wid_no_chg">
			<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Menus.D1);" class="Type01 menus menus01" data-type="D1"> 직결나사</a> 
			<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Menus.D2);" class="Type01 menus menus01" data-type="D2"> 고내식성직결나사</a> 
			<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Menus.D3);" class="Type01 menus menus01" data-type="D3"> 스텐나사</a>  
			<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Menus.D4);" class="Type01 menus menus01" data-type="D4"> TYPE17® </a> 
			<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Menus.D5);" class="Type01 menus menus01" data-type="D5"> 블라인드 리벳 </a>    
			<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Menus.D6);" class="Type01 menus menus01" data-type="D6"> 태핑나사 등 </a>
			
			<%-- <a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Menus.allList);" class="Type02 menus menus010" data-type="010"> 전체카테고리 
				<span>
					<img src="${staticRoot}/img/icon_arrow01.png" alt=" 화살표" />
				</span>
			</a> --%>
			<%@include file="/WEB-INF/views/common/layout/include/allCteg.jsp" %>
<%-- 		
<!-- 
			<div class="menu_all menu_dtl_A1" style="display: none;z-index: 999;" data-type="A1">
				<div class="menu_all_bg"> </div>
				<div class="manu_content">
					<table class="menu_all_Type01">
						<caption>첫번째 메뉴</caption>
						<colgroup>
							<col style="width: 18%;">
							<col style="width: 82%;">
						</colgroup>
						<tbody id="A1" class="A1">
						</tbody>
					</table>
				</div>
				<div class="manu_ad_content">
					 &nbsp;
				</div>
			</div>
			<div class="menu_all menu_dtl_A2" style="display: none;z-index: 999;" data-type="A2">
				<div class="menu_all_bg"> </div>
				<div class="manu_content">
					<table class="menu_all_Type01">
						<caption>첫번째 메뉴</caption>
						<colgroup>
							<col style="width: 18%;">
							<col style="width: 82%;">
						</colgroup>
						<tbody id="A2" class="A2">
						</tbody>
					</table>
				</div>
				<div class="manu_ad_content">
					 &nbsp;
				</div>
			</div>
			<div class="menu_all menu_dtl_A3" style="display: none;z-index: 999;" data-type="A3">
				<div class="menu_all_bg"> </div>
				<div class="manu_content">
					<table class="menu_all_Type01">
						<caption>첫번째 메뉴</caption>
						<colgroup>
							<col style="width: 18%;">
							<col style="width: 82%;">
						</colgroup>
						<tbody id="A3" class="A3">
						</tbody>
					</table>
				</div>
				<div class="manu_ad_content">
					 &nbsp;
				</div>
			</div>
			<div class="menu_all menu_dtl_A4" style="display: none;z-index: 999;" data-type="A4">
				<div class="menu_all_bg"> </div>
				<div class="manu_content">
					<table class="menu_all_Type01">
						<caption>첫번째 메뉴</caption>
						<colgroup>
							<col style="width: 18%;">
							<col style="width: 82%;">
						</colgroup>
						<tbody id="A4" class="A4">
						</tbody>
					</table>
				</div>
				<div class="manu_ad_content">
					 &nbsp;
				</div>
			</div>
			<div class="menu_all menu_dtl_c22" style="display: none;z-index: 999;" data-type="c22">
				<div class="menu_all_bg"> </div>
				<div class="manu_content">
					<table class="menu_all_Type01">
						<caption>첫번째 메뉴</caption>
						<colgroup>
							<col style="width: 18%;">
							<col style="width: 82%;">
						</colgroup>
						<tbody id="c22" class="c22">
						</tbody>
					</table>
				</div>
				<div class="manu_ad_content">
					 &nbsp;
				</div>
			</div>
			<div class="menu_all menu_dtl_c25" style="display: none;z-index: 999;" data-type="c25">
				<div class="menu_all_bg"> </div>
				<div class="manu_content">
					<table class="menu_all_Type01">
						<caption>첫번째 메뉴</caption>
						<colgroup>
							<col style="width: 18%;">
							<col style="width: 82%;">
						</colgroup>
						<tbody id="c25" class="c25">
						</tbody>
					</table>
				</div>
				<div class="manu_ad_content">
					 &nbsp;
				</div>
			</div>
			<div class="menu_all menu_dtl_c27" style="display: none;z-index: 999;" data-type="c27">
				<div class="menu_all_bg"> </div>
				<div class="manu_content">
					<table class="menu_all_Type01">
						<caption>첫번째 메뉴</caption>
						<colgroup>
							<col style="width: 18%;">
							<col style="width: 82%;">
						</colgroup>
						<tbody id="c27" class="c27">
						</tbody>
					</table>
				</div>
				<div class="manu_ad_content">
					 &nbsp;
				</div>
			</div>
			<div class="menu_all menu_dtl_A5" style="display: none;z-index: 999;" data-type="A5">
				<div class="menu_all_bg"> </div>
				<div class="manu_content">
					<table class="menu_all_Type01">
						<caption>첫번째 메뉴</caption>
						<colgroup>
							<col style="width: 18%;">
							<col style="width: 82%;">
						</colgroup>
						<tbody id="A5" class="A5">
						</tbody>
					</table>
				</div>
				<div class="manu_ad_content">
					 &nbsp;
				</div>
			</div>			
 -->			
 --%>	
		</div>
	</div>
