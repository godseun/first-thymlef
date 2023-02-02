<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<div class="sidebar">
		<h2 class="side_title">
			마이페이지
		</h2>
		<div class="side_list">
			<ul>
				<li class="list_title">
					<a href="/c11/c11_01.php" class="title_txt on">
						장바구니
					</a>
				</li>
				<li class="list_title">
					<a href="/c11/c11_05.php" class="title_txt">
						찜한상품
					</a>
				</li>
				<li class="list_title">
					<a href="/c11/c11_06.php" class="title_txt">
						구매내역
					</a>
				</li>
				<li class="list_title">
					<a href="/c11/c11_07_01.php" class="title_txt">
						내정보
					</a>
				</li>
				<li class="list_title">
					<a href="/c11/c11_08_01.php" class="title_txt">
						알림설정
					</a>
				</li>
			</ul>
		</div>
		<form id="tsFrm" name="tsFrm">
			<input type="hidden" name="mValue" value="#모음전"/>
		</form>
		<div class="ad_left_img02">
			<!-- <a href="javascript:;" onclick="_BT.actFormSubmit('tsFrm', 'POST',_BT.SHOP.URL.Search.mSearch);"> -->
			<a>
				<img src="${staticRoot}/img/ad/ad_left_img03.jpg" alt="광고 이미지3" />
			</a>
		</div>
		<div class="ad_left_img02">
			<img src="${staticRoot}/img/ad/ad_left_img04.jpg" alt="광고 이미지1" />
		</div>
<%-- 		
		<div class="ad_left_img02">
			<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Search.View+'?pCode=ST30291356')">
				<img src="${staticRoot}/img/ad/ad_left_img04.jpg" alt="광고 이미지1" />
			</a>
		</div>
 --%>
		<div class="ad_left_img01">
			<!-- <a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Search.View+'?pCode=ST37777777')"> -->
			<a>
				<img src="${staticRoot}/img/ad/ad_left_img05.jpg" alt="광고 이미지1" />
			</a>
		</div>
	</div>