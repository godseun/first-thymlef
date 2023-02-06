<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
<script type="text/javascript" src="${staticRoot}/js/allCteg.js"></script>
<script type="text/javascript">
	$(function() {
		_BT.CategSearch.makeCategMap();
	});
</script>

			<div class="section">
				<h1 class="title_Type03">
					전체카테고리
					<div class="sub_location">
						<div class="list_location01">
							<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Common.Main);" class="home">HOME</a>
							<span class="arrow"><img src="${staticRoot}/img/bl_01.jpg" alt=">" /></span>
							<span class="last_txt">전체카테고리</span>
						</div>
					</div>
				</h1>
				
				<!--메뉴시작-->
				<div>
					<h1 class="title_con_Type01 margintop_40">직결나사</h1>
					<table class="join_form">
						<caption>전체메뉴</caption>
						<colgroup>
							<col width="15%">
							<col width="85%">							
						</colgroup>
						<tbody id="c_D1" class="c_D1">
						</tbody>
					</table>					
				</div>
				<!--메뉴끝-->

				<!--메뉴시작-->
				<div>
					<h1 class="title_con_Type01 margintop_40">고내식성직결나사</h1>
					<table class="join_form">
						<caption>전체메뉴</caption>
						<colgroup>
							<col width="15%">
							<col width="85%">							
						</colgroup>
						<tbody id="c_D2" class="c_D2">
						</tbody>
					</table>					
				</div>
				<!--메뉴끝-->

				<!--메뉴시작-->
				<div>
					<h1 class="title_con_Type01 margintop_40">스텐나사</h1>
					<table class="join_form">
						<caption>전체메뉴</caption>
						<colgroup>
							<col width="15%">
							<col width="85%">							
						</colgroup>
						<tbody id="c_D3" class="c_D3">
						</tbody>
					</table>					
				</div>
				<!--메뉴끝-->

				<!--메뉴시작-->
				<div>
					<h1 class="title_con_Type01 margintop_40">TYPE17®</h1>
					<table class="join_form">
						<caption>전체메뉴</caption>
						<colgroup>
							<col width="15%">
							<col width="85%">							
						</colgroup>
						<tbody id="c_D4" class="c_D4">
						</tbody>
					</table>					
				</div>
				<!--메뉴끝-->
				
				<!--메뉴시작-->
				<div>
					<h1 class="title_con_Type01 margintop_40">블라인드 리벳</h1>
					<table class="join_form">
						<caption>전체메뉴</caption>
						<colgroup>
							<col width="15%">
							<col width="85%">							
						</colgroup>
						<tbody id="c_D5" class="c_D5">
						</tbody>
					</table>					
				</div>
				<!--메뉴끝-->

				<!--메뉴시작-->
				<div>
					<h1 class="title_con_Type01 margintop_40">태핑나사 등</h1>
					<table class="join_form">
						<caption>전체메뉴</caption>
						<colgroup>
							<col width="15%">
							<col width="85%">							
						</colgroup>
						<tbody id="c_D6" class="c_D6">
						</tbody>
					</table>					
				</div>
				<!--메뉴끝-->

			
			</div>
			</div>
			</div>
