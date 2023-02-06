<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>

		<div class="wid_1248">
			<div class="ad_content01 margintop_20">
				<img src="${staticRoot}/img/ad/ad_img001.jpg " alt="광고배너">
			</div>

			<div class="container">
				<div class="section center_content">
					<div class="order_complete">
						<img src="${staticRoot}/img/img_complete.jpg" alt="가입완료">
						<p class="blue_txt margintop_30">
							회원가입을 축하드립니다.
						</p>
						<p class="gray_txt margintop_20">
							대화공업 입니다.
						</p>

						<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Common.goLogin);" class="order_check margintop_30">
							로그인 하러 가기
						</a>
						<span class="marginleft_5"> </span>

						<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Common.Main);" class="join_check margintop_30">
							메인페이지로 이동
						</a>
					</div>
				</div>
			</div>
		</div>