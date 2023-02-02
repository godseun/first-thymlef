<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/layout/include/base.jsp"%>

<!-- FOOTER -->
<div class="footer">
	<div class="wid_1248">
		<div class="footer_menu">
			<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Common.Main);"> HOME </a> <span> I </span> 
			<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Helpdesk.Prologue);">회사소개 </a> <span> I </span> 
			<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Common.Provision1)"> 이용약관 </a> <span> I </span> 
			<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Common.Provision2)"> 개인정보취급방침 </a> <span> I </span> 
<!-- 			
			<a href="javascript:;" onclick="_BT.moveUrl(_BT.STORE.URL.Common.Partner);"> 업무제휴 </a> <span> I </span> 
 -->			
			<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Helpdesk.FAQ);"> 고객센터 </a>
		</div>
		<div class="footer_mark">
			<!-- <img src="http://image.inicis.com/mkt/certmark/escrow/escrow_74x74_color.png" border="0"  alt="클릭하시면 이니시스 결제시스템의 유효성을 확인하실 수 있습니다." style="cursor:hand" onclick="javascript:window.open('http://mark.inicis.com/mark/escrow_popup.php?mid=selltoolkr','mark','scrollbars=no,resizable=no,width=565,height=683');" /> -->
			<img src="http://image.inicis.com/mkt/certmark/escrow/escrow_74x74_color.png" border="0"  alt="클릭하시면 이니시스 결제시스템의 유효성을 확인하실 수 있습니다." style="cursor:hand" />
		</div>
		<div class="footer_txt">
			<p>(주) XXXXXXXX<span class="line">|</span>대표이사 : XXX<span class="line">|</span>사업자등록번호 : XXX-XX-XXXXX <a href="javascript:openPopFtc();" class="info_01">사업자정보확인</a><span class="line">|</span>
			통신판매신고번호 : XXXX-XXXXX-XXXXX</p>
			<p> 본사 : XXXXX XXXX XXXXXXXXX XX, XXXXX XXX<span class="line">|</span>고객만족센터 : XXXX-XXXX<span class="line">|</span>팩스 : XXX-XXXX-XXXX<span class="line">|</span>
			문의메일 : XXXXX@XXXXX.XXXX</p>
			<p>개인정보관리책임자 : XXXX XXXXp@XXXXX.XXX</p>
			<p>Copyright 2021 CHSoft Corp. ALL RIGHT RESERVED.</p>
		</div>
	</div>
</div>
<FORM name='AUTHMARK_FORM' METHOD='POST'>
    <input type="hidden" name="authmarkinfo">
</FORM>
<!-- FOOTER --> 
<!-- 공정거래위원회 사업자 정보 검색-->
<script type="text/javascript">
	function openPopFtc() {
		var url ="http://www.ftc.go.kr/info/bizinfo/communicationViewPopup.jsp?wrkr_no=1998700674";
		_BT.openPopup(url, "communicationViewPopup", "750", "700", "no", "no");
	}
</script>