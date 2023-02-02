<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/views/common/layout/include/base.jsp" %>
<link rel="stylesheet" href="${staticRoot}/css/jquery-ui.css" type="text/css" />
<style>
	input[type=text]::-ms-clear {
		display:none;
	}
</style>
	<script type="text/javascript" src="${staticRoot}/js/allCteg.js"></script>
 	<script type="text/javascript" src="${staticRoot}/js/jquery-ui.js"></script>
	<script type="text/javascript">
		var type = "'";
		var dupClick1 = false;
		$(function() {
			var searchTp = _BT.Cookie.get("searchTp");
			if (_BT.isEquals(searchTp, "D")) {
				$(".icon_serch").addClass("on");
				$("#searchBar").show();
			} else {
				$(".icon_serch").removeClass("on");
				$("#searchBar").hide();
			}
			$('.c1').click(function() {
				 if($(this).hasClass('on')){
/* 					 
					 $(this).removeClass('on');
					$('.'+$(this).attr('id')).addClass('vOff');
*/				
				 } else{
					$(this).addClass('on');
					$('.'+$(this).attr('id')).removeClass('vOff');
					//var aa = _BT.CategSearch.getChildrenList($(this).data('value'),2);
				 }
			}); 
			$(".m_search_icon").on("click", function() { 
				$("#mValue"	).val(	_BT.getTrimValue($("#mValue").val()));
				$("#mName"	).val(	_BT.getTrimValue($("#mName").val()));
				$("#mBrand"	).val(	_BT.getTrimValue($("#mBrand").val()));
				$("#mStndrd"	).val(	_BT.getTrimValue($("#mStndrd").val()));
				$("#mModel"	).val(	_BT.getTrimValue($("#mModel").val()));
				$("#mCode"		).val(	_BT.getTrimValue($("#mCode").val()));
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
			_BT.setOnEnter("mValue","m_search_icon");	
			_BT.setOnEnter("mName","m_search_icon");	
			_BT.setOnEnter("mBrand","m_search_icon");	
			_BT.setOnEnter("mStndrd","m_search_icon");	
			_BT.setOnEnter("mModel","m_search_icon");	
			_BT.setOnEnter("mCode","m_search_icon");	
			_BT.CategSearch.makeMobileMenu();
		});
		function ckMenu() {
			if ( $( "#m_menu" ).is( ":hidden" ) ) {
			   $( "#m_menu" ).show( "slow" );
			} else {
			 $( "#m_menu" ).hide( "slow" );
			}
		} 
		function swDetail() {
			if ($("#searchBar").is(":hidden")) {
				$("#searchBar").slideDown();
				$(".icon_serch").addClass("on");
				_BT.Cookie.set("searchTp", "D");
			} else {
				$(".icon_serch").removeClass("on");
				$("#searchBar").hide();
				_BT.Cookie.set("searchTp", "N");
			}
		}
		function ch(obj){
			if($(obj).hasClass('on')){
				$(obj).removeClass('on');
				$(obj).removeClass('vOff');
				$('.'+$(obj).attr('id')).addClass('vOff');
			} else{
				$(obj).addClass('on');
				$('.'+$(obj).attr('id')).removeClass('vOff');
			}
			event.stopPropagation();
		}
		function go(obj){
    		_BT.actFormSubmit('tFrm', 'POST', '<c:out value="${host}"/>/shop/search/cTeg?cTp='+$(obj).data("type")+'&cCode='+$(obj).attr('id')); 
			event.stopPropagation();
		}
	</script>
	<form id="tFrm" name="tFrm">
	</form>
	<form id="sFrm" name="sFrm">
		<div class="">
			<div class="m_top" style="height:62px;">
				<span class="all_menu" onclick="ckMenu()">
				</span>
	<%-- 			
				<a href="" class="logo">
					<img src="${staticRoot}/m/img/logo_01.png" alt="로고" />
				</a>
	 --%>
	 			<span class="top_search">
					<input class="m_search_input" id="mValue" name="mValue" style="color: #3f51b5;" placeholder="이제 카탈로그 코드로 간편하게 검색하세요!!" maxlength="30" type="text">
					<label class="m_search_icon" id="m_search_icon"></label>
				</span>
				<span class="icon_serch on" onclick="swDetail()"></span>
				<!--<span class="icon_member"></span> -->
			</div>
		</div>
		<div id="searchBar" class="main_search" style="width: 100%;margin-left: 0px; display: none;">
			<span class="" style="width: 100%;"> 
				<input type="text" id="mName" name="mName" placeholder="    품명" class="input_style11"  maxlength="20"  style="width: 19%; margin-left :1px; margin-right:1px;"/>
				<input type="text" id="mBrand" name="mBrand" placeholder="   브랜드" class="input_style11" maxlength="20"   style="width: 19%; margin-right:1px;"/>
				<input type="text" id="mStndrd" name="mStndrd" placeholder="    규격" class="input_style11" maxlength="30"   style="width: 19%; margin-right:1px;"/>
				<input type="text" id="mModel" name="mModel" placeholder="   모델명" class="input_style11" maxlength="20"  style="width: 19%; margin-right:1px;"/>
				<input type="text" id="mCode" name="mCode" placeholder=" 대화코드" class="input_style11" maxlength="10"  style="width: 19%;  color: #3f51b5; border: 2px solid #3f51b5; font-weight: bolder;" />
			</span>
		</div>
	</form>	
	<div class="m_menu" id ="m_menu" style="display: none;">
		<div class="m_menu_con">
			<c:choose>
				<c:when test="${empty userSession}">
					<!--비로그인시 나와야될메뉴-->
					<!--
						<span class="bg_02" onclick="_BT.moveUrl(_BT.SHOP.URL.Join.Step);" alt="회원가입">회원가입</span>
					-->
						<span class="bg_02" onclick="_BT.moveUrl(_BT.SHOP.URL.Join.bStep1);" alt="회원가입">회원가입</span>
						<span class="bg_03" onclick="_BT.moveUrl(_BT.SHOP.URL.Common.goLogin);" alt="로그인">로그인</span>
					<!--비로그인시 나와야될메뉴-->
				</c:when>
				<c:otherwise>
					<!--로그인시 나와야될메뉴-->
					<span class="bg_01" onclick="_BT.moveUrl(_BT.SHOP.URL.Order.cart);" alt="장바구니">장바구니</span>
					<span class="bg_04" onclick="_BT.moveUrl(_BT.SHOP.URL.User.Info);" alt="마이페이지">마이페이지</span>
					<span class="bg_05" onclick="_BT.moveUrl(_BT.SHOP.URL.Common.Logout);" alt="로그아웃">로그아웃</span>
					<!--로그인시 나와야될메뉴-->		
				</c:otherwise>
			</c:choose>		
			<span class="close_btn" onclick="ckMenu()"><img src="${staticRoot}/m/img/m_menu_top_close.jpg" alt="메뉴닫기"></span>
		</div>
		<div class="m_menu_txt">
			<ul>
				<!--1차메뉴-->	
				<li class="depth_01 c1"><a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Helpdesk.Promo);">프로모션</a></li>
				<!-- <li class="depth_01 c1"><a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Menus.allList);">전체카테고리</a></li> -->
				<li class="depth_01 c1" id="D1"><a href="javascript:;">직결나사</a></li>
				<li class="depth_01 c1" id="D2"><a href="javascript:;" data-type="D2">고내식성직결나사</a></li>
				<li class="depth_01 c1" id="D3"><a href="javascript:;" data-type="D3">스텐나사</a></li>
				<li class="depth_01 c1" id="D4"><a href="javascript:;" data-type="D4">TYPE17®</a></li>
				<li class="depth_01 c1" id="D5"><a href="javascript:;" data-type="D5">블라인드 리벳</a></li>
				<li class="depth_01 c1" id="D6"><a href="javascript:;" data-type="c25">태핑나사 등</a></li>
				
			</ul>
		</div>
	</div>