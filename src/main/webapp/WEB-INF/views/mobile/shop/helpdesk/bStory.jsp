<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript">
		var dupClick1 = false;
		$(function(){  
		});
	</script>
	<div class="section">
		<h1 class="title_Type03">
			브랜드 스토리
			<div class="sub_location">
				<div class="list_location01">
					<span class="txt01">고객만족 센터</span>
					<span class="arrow"><img src="${staticRoot}/img/bl_01.jpg" alt=">" /></span>
					<span class="last_txt">브랜드 스토리</span>
				</div>
			</div>
		</h1>
		<div class="notcie_board">
			<!--공지사항 제목-->
			<div class="notcie_board1">
				<div class="notcie_board_tit"><a href="/c12/c12_02_03.php">[스마토] 적당히 좋다...써보니 더 좋다</a></div>
				<div class="notcie_board_date">2017-12-20</div>	
				<a href="#" class="notcie_board_arrow_on"> </a>
			</div>					
			<!--공지사항 제목-->
			
			<!--공지사항 내용들어갈곳-->
			<div class="notcie_board_con">
				스마토는 블라블라
				<img src="../img/notcie_board_img01.jpg">
			</div>
			<!--공지사항 내용들어갈곳-->
			<div class="notcie_board1">
				<div class="notcie_board_tit"><a href="/c12/c12_02_03.php">[계양] 이름이 농촌틱 해 보인다. 하지만 기술은 사이버~</a></div>
				<div class="notcie_board_date">2017-12-20</div>	
				<a href="#" class="notcie_board_arrow_off"> </a>
			</div>
		</div>

		<!--페이지넘버-->
		<div class="pageing">
			<img src="${staticRoot}/img/borad_arrow_left01.jpg" alt="">
			<img src="${staticRoot}/img/borad_arrow_left02.jpg" alt="">
			<span>
				<label class="on">1</label>
				<label>2</label>
				<label>3</label>
			</span>
			<img src="${staticRoot}/img/borad_arrow_right02.jpg" alt="">
			<img src="${staticRoot}/img/borad_arrow_right01.jpg" alt="">
		</div>
		<!--페이지넘버-->
 
	</div>
