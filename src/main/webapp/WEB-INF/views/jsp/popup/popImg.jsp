<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/layout/include/base.jsp" %>
    <link rel="stylesheet" href="${staticRoot}/sdk/css/swiper.min.css">
	<style>
	    .swiper-container {
	        width: 100%;
	        height: auto;
	        margin: 10px auto;
	    }
	    .swiper-slide {
	        text-align: center;
	        font-size: 18px;
	        background: #fff;
	        /* Center slide text vertically */
	        display: -webkit-box;
	        display: -ms-flexbox;
	        display: -webkit-flex;
	        display: flex;
	        -webkit-box-pack: center;
	        -ms-flex-pack: center;
	        -webkit-justify-content: center;
	        justify-content: center;
	        -webkit-box-align: center;
	        -ms-flex-align: center;
	        -webkit-align-items: center;
	        align-items: center;
    	}
    </style>
	<script type="text/javascript" src="${staticRoot}/sdk/js/swiper.min.js"></script>  	
	<script type="text/javascript">
	$(function(){
	}); 
	function fnClose(){
		window.close();
	}
	</script>
	<!-- 팝업창 시작 -->
	<h1 class="blue_title">
		카탈로그 확인
		<span class="close" onclick="fnClose();">
		</span>
	</h1>
    <div class="swiper-container">
        <div class="swiper-wrapper">
			<c:set var="page" 		value="0" />
			<c:set var="chkP" 		value="0" />
			<c:forEach items="${ImgInfo}" var="catlog" varStatus="status">
				<c:if test="${catlog.CUR eq 'O'}">
					<c:set var="chkP" 		value="1" />
					<c:set var="page" 		value="${status.count}" />
				</c:if>
				<c:if test="${chkP eq '1'}">
		            <div class="swiper-slide eBOOK" data-type="eBOOK" data-value='<c:out value="${catlog.FILE_ID}"/>'>
		            	<img src="${upload}<c:out value="${catlog.IMG}"/>" style="width: auto; height: 875px;" data-type='<c:out value="${catlog.FILE_ID}"/>' class="ctaImg" alt="카탈로그 이미지" onerror="this.src='${staticRoot}/img/common/no_catag.jpg'"/> 
		            </div>
				</c:if>
			</c:forEach>	
			<c:forEach items="${ImgInfo}" var="catlog" varStatus="status" end="${page}" >
	            <div class="swiper-slide eBOOK" data-type="eBOOK" data-value='<c:out value="${catlog.FILE_ID}"/>'>
	            	<img src="${upload}<c:out value="${catlog.IMG}"/>" style="width: auto; height: 875px;" data-type='<c:out value="${catlog.FILE_ID}"/>' class="ctaImg" alt="카탈로그 이미지" onerror="this.src='${staticRoot}/img/common/no_catag.jpg'"/> 
	            </div>
			</c:forEach>	
      		</div>
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
	</div>
    <script>
	    var swiper = new Swiper('.swiper-container', {
	        pagination: '.swiper-pagination',
	        nextButton: '.swiper-button-next',
	        prevButton: '.swiper-button-prev',
	        slidesPerView: 1,
	        centeredSlides: true,
	        paginationClickable: true,
	        spaceBetween: 30,
	        loop: true
	    });
    </script>	
