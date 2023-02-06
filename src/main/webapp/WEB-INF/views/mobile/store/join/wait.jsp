<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>

		<div class="wid_1248">
			<div class="ad_content01 margintop_20">
				<img src="${staticRoot}/img/ad/ad_img001.jpg " alt="광고배너">
			</div>

			<div class="container">
				<div class="section center_content">
					<div class="order_complete" style="margin-top: 20px;">
						<img src="${staticRoot}/img/img_complete.jpg" alt="가입완료">
						<p class="blue_txt margintop_10">
							입점요청이 완료되었습니다.
						</p>
						<p class="gray_txt margintop_50">
							대화공업 입니다.
						</p>
						<p class="gray_txt margintop_20">
							대화와 함께해 주셔서 감사드립니다.
						</p>
						<p class="gray_txt margintop_50">
							입력해주신 내용을 검토 중 입니다.<br /><br />
							검토가 완료되면 입력하신 연락처로 회신 드리겠습니다.<br /><br />
							승인완료 까지는 업무일 기준 최대 3일 정도 소요됩니다.<br /><br />
						</p>
						<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Common.Login);" class="order_check margintop_30">
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