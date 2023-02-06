<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript">
		var dupClick1 = false;
		$(function(){  
		});
	</script>
	<div class="section">
		<h1 class="title_Type03">
			파워 블로거
			<div class="sub_location">
				<div class="list_location01">
					<span class="txt01">고객만족 센터</span>
					<span class="arrow"><img src="${staticRoot}/img/bl_01.jpg" alt=">" /></span>
					<span class="last_txt">파워 블로거</span>
				</div>
			</div>
		</h1>
		<div class="notcie_board">
			<!--공지사항 제목-->
			<div class="notcie_board1">
				<div class="notcie_board_tit"><a href="/c12/c12_02_03.php">[기획] 김공구님을 만나 봤습니다.</a></div>
				<div class="notcie_board_date">2017-12-20</div>	
				<a href="#" class="notcie_board_arrow_on"> </a>
			</div>					
			<!--공지사항 제목-->
			
			<!--공지사항 내용들어갈곳-->
			<div class="notcie_board_con">
				공지사항 내용 들어갈곳입니다.<br />
				<img src="../img/notcie_board_img01.jpg">
			</div>
			<!--공지사항 내용들어갈곳-->

			<div class="notcie_board1">
				<div class="notcie_board_tit"><a href="/c12/c12_02_03.php">[기사] 공구 특종</a></div>
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
