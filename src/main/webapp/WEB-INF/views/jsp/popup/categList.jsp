<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript" src="${staticRoot}/js/allCteg.js"></script>
	<script type="text/javascript">
		$(function(){ 
			$( '.ca' ).on('change', function() {
				var cSel= eval($(this).data('value')+1);
				_BT.CategSearch.clearSelect(cSel);
				_BT.CategSearch.makeSelect(cSel, $(this).val());
	    	});
			initSelect();
		});
		function initSelect(){
			_BT.CategSearch.makeSelect('1');
			for(var sel=2; sel<6; sel++){
				$('#ca'+sel).empty();
				$('#ca'+sel).append('<option value="C9999">미지정</option>');
			}
		}
		function fnChoice(){
			var text = 
				$("#ca2 option:selected").text() +" > " +
				$("#ca3 option:selected").text() +" > " +
				$("#ca4 option:selected").text() +" > " +
				$("#ca5 option:selected").text();
			var code  = 	
				$("#ca5 option:selected").val();
			var obj = {
					'text' : text
					,'code' : code
					};
			opener.parent.fnSetCateg(obj);
			window.close();
		}
		function fnClose(){
			window.close();
		}
	</script>
	<!-- 팝업창 시작 -->
	<form id="mFrm" name="mFrm">
	</form>
	<h1 class="blue_title">
		전체 브랜드
		<span class="close" onclick="fnClose();">
		</span>
	</h1> 
	<div class="maker_msg_substance">
		<table class="front_form border_bottom">
			<caption>정보입력</caption>
			<colgroup>
				<col width="20%">
				<col width="*">
			</colgroup>
			<tbody>
				<tr>
					<th>
						<img class=""/>1단계
					</th>
					<td align="left">
						<select class="ca" id="ca1" name="ca1" data-value="1" style="margin-left:5px;">
							<option value="C9999">미분류</option>
						</select>
					</td>
				</tr>	
				<tr>
					<th>
						<img class=""/>2단계
					</th>
					<td align="left">
						<select class="ca" id="ca2" name="ca2"  data-value="2" style="margin-left:5px;">
							<option value="C9999">미분류</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>
						<img class=""/>3단계
					</th>
					<td align="left">
						<select class="ca" id="ca3" name="ca3" data-value="3" style="margin-left:5px;">
							<option value="C9999">미분류</option>
						</select>
					</td>
				</tr>	
				<tr>
					<th>
						<img class=""/>4단계
					</th>
					<td align="left">
						<select class="ca" id="ca4" name="ca4" data-value="4" style="margin-left:5px;">
							<option value="C9999">미분류</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>
						<img class=""/>5단계
					</th>
					<td align="left">
						<select class="ca" id="ca5" name="ca5" data-value="5" style="margin-left:5px;">
							<option value="C9999">미분류</option>
						</select>
					</td>
				</tr>	
			</tbody>
		</table>
	</div> 
	<div class="btn_group marginbottom_10">
		<span class="form_btn_Type_blue" onclick="fnChoice();">선 택</span>
		<span class="form_btn_Type_gray" onclick="fnClose();">취 소</span>
	</div>