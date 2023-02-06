<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<div class="wid_1248">
		<div class="ad_content01 margintop_20">
			<a href="javascript:;">
				<img src="${staticRoot}/img/ad/m_ad_img001.jpg " alt="광고배너">
			</a>
		</div>
		<div class="container">
			<div class="section center_content">
				<div class="join_content01">
					<p class="join_ment">
						* 회원유형을 선택해 주세요.
					</p>
					<div class="join_choice">
						<a href="javascript:;" class="join_choice_Type01 img01 mg_Type01" onclick="_BT.moveUrl(_BT.SHOP.URL.Join.bStep1);">	
							<span class="box img01">
								구매회원 가입
							</span>
						</a>
						<a href="javascript:;" class="join_choice_Type01 img01" onclick="_BT.moveUrl(_BT.STORE.URL.Join.sStep1);">	
							<span class="box img02">
								판매자 입점신청(사업자만 가능)
							</span>
						</a>
					</div>
				</div>
				<div class="join_content02">
					<p>
						TOOLTOOL 쇼핑몰을 이용하기 위해서는 회원 가입이 필요 합니다.<br/>
						판매자 입점신청은 사업자 등록증이 있는 사업자만 가입이 가능 합니다.
					</p>
				</div>
			</div>
		</div>
	</div >