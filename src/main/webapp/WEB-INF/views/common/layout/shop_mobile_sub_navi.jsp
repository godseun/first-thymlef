<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/layout/include/base.jsp" %>
    
		<div class="lnb">
			<!-- 샵 관리 -->
			<div class="sideBar" style="display: none;">
				<h2 class="sideBar-P">샵<br>관 리</h2>	
				<div class="sideList">
					<div><a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Shop.Info.View);">샵 정보</a></div>
					<div><a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Shop.Designer.List);">디자이너</a></div>
					<div><a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Shop.Work.List);">근무정보</a></div>
					<div><a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Shop.Service.List);">서비스</a></div>
					<div><a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Shop.Feed.List);">게시물</a></div>
					<div><a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Shop.Tag.List);">태그</a></div>
				</div>
			</div>

			<!-- 예약관리 -->  
			<div class="sideBar" style="display: none;">
				<h2 class="sideBar-P">예 약<br>관 리</h2>	 
				<div class="sideList">
					<div><a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Reserve.Status.View);">예약(요청)현황</a></div>
					<div><a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Reserve.Register.View);">예약등록</a></div>
					<div><a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Reserve.Surgery.View);">시술내역등록</a></div>
					<div><a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Reserve.Info.View);">예약정보</a></div>
				</div>
			</div> 


			<!-- 고객관리 -->  
			<div class="sideBar" style="display: none;">
				<h2 class="sideBar-P">고 객<br>관 리</h2>	 
				<div class="sideList">
					<div><a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Customer.Manage.List);">고객관리</a></div>
					<div><a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Customer.Register.List);">고객등록</a></div>
				</div>
			</div> 
			
			<!-- 설정 -->  
			<div class="sideBar" style="display: none;">
				<h2 class="sideBar-P">설 정</h2>	 
				<div class="sideList">
					<div><a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Setting.Service.View);">이용서비스관리</a></div>
					<div><a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Setting.Payment.View);">서비스구매</a></div>
					<div><a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Setting.Manage.View);">설정</a></div>
				</div>
			</div> 
			
			<!-- 통계조회 -->  
			<div class="sideBar" style="display: none;">
				<h2 class="sideBar-P">통 계<br>조 회</h2>	 
				<div class="sideList">
					<div><a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Status.Report.View);">분석리포트</a></div>
					<div><a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Status.Customer.View);">고객현황</a></div>
					<div><a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Status.Sales.View);">영업현황</a></div>
					<div><a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Status.SNS.View);">SNS현황</a></div>
				</div>
			</div> 
			
			<!-- 고객센터 -->  
			<div class="sideBar" style="display: none;">
				<h2 class="sideBar-P">고 객<br>센 터</h2>	 
				<div class="sideList">
					<div><a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Helpdesk.Introduce.View);">서비스 소개</a></div>
					<div><a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Helpdesk.Notice.List);">공지사항</a></div>
					<div><a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Helpdesk.FAQ.List);">자주 묻는 질문</a></div>
					<div><a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Helpdesk.Inquiry.List);">1:1 문의</a></div>
				</div>
			</div> 
		</div> 
	  
	   