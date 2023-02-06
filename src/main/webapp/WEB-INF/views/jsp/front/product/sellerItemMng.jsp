<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript">
		var dupClick1 = false;
		$(function(){ 
			$( ":input" ).on("focus", function() {
	    		$(this).addClass("mOn");
	    	});
	
			$( ":input" ).on("focusout", function() {
	    		$(this).removeClass("mOn");
	    	}); 
			initSheet();
		});
		
		function initSheet(){
			var initData = {};
			initData.Cfg = {
										"SearchMode": 2,
										"Page": 10,
										"FrozenCol": 0,
										"UseHeaderActionMenu": false,
										"MouseHoverMode": 0,
										"SelectionRowsMode": 1,
										"AutoFitColWidth": "resize"
										};
			initData.HeaderMode = {"Sort": 0, "ColMove": 0, "ColResize": 0, "HeaderCheck": 0};
			
			initData.Cols = [
					{"Header": "순번", "Type": "Seq", "Width": 50, "SaveName": "sSeq", "Align": "Right" }, 
					{"Header": "상태", "Type": "Status", "Width": 100, "SaveName": "sStatus", "Align": "Center","ShowMobile": 0},  
					{"Header": "1단계", "Type": "Status", "Width": 80, "SaveName": "sStatus", "Align": "Center","ShowMobile": 0},  
					{"Header": "2단계", "Type": "Status", "Width": 80, "SaveName": "sStatus", "Align": "Center","ShowMobile": 0},  
					{"Header": "3단계", "Type": "Status", "Width": 80, "SaveName": "sStatus", "Align": "Center","ShowMobile": 0},  
					{"Header": "4단계", "Type": "Status", "Width": 80, "SaveName": "sStatus", "Align": "Center","ShowMobile": 0},  
					{"Header": "5단계", "Type": "Status", "Width": 80, "SaveName": "sStatus", "Align": "Center","ShowMobile": 0},  
					{"Header": "상품구분", "Type": "Status", "Width": 80, "SaveName": "sStatus", "Align": "Center","ShowMobile": 0},  
					{"Header": "상품코드", "Type": "Status", "Width": 80, "SaveName": "sStatus", "Align": "Center","ShowMobile": 0},  
					{"Header": "품명", "Type": "Status", "Width": 150, "SaveName": "sStatus", "Align": "Center","ShowMobile": 0},  
					{"Header": "규격", "Type": "Status", "Width": 150, "SaveName": "sStatus", "Align": "Center","ShowMobile": 0},  
					{"Header": "제조사", "Type": "Status", "Width": 150, "SaveName": "sStatus", "Align": "Center","ShowMobile": 0},  
					{"Header": "판매가", "Type": "Status", "Width": 150, "SaveName": "sStatus", "Align": "Center","ShowMobile": 0},  
					{"Header": "매입가", "Type": "Status", "Width": 150, "SaveName": "sStatus", "Align": "Center","ShowMobile": 0},  
					{"Header": "공급처", "Type": "Status", "Width": 150, "SaveName": "sStatus", "Align": "Center","ShowMobile": 0}  
			];			
			
			// IBSheet 생성
			var container = $('#ib-container1')[0];
			createIBSheet2(container, 'mySheet1', '100%', '300px');
			
			// IBSheet 초기화
			IBS_InitSheet(mySheet1, initData);	
			
			// 편집 가능 여부 설정
			mySheet1.SetEditable(true);
			
			// 사이즈 맞춤
			mySheet1.FitColWidth();
		}		
		
	</script>
	<div class="main_content06" style="padding-top: 0px; min-height: 800px; margin-bottom: 20px;">
		<div >
			<table class="tbl_Type02">
				<caption>조회</caption>
				<colgroup>
					<col width="10%">
					<col width="%">
				</colgroup>
				<tbody>
					<tr>
						<th>
							조회
						</th>
						<td style="text-align: left;">
							<input class="input_style20" type="text" placeholder="검색어" />							
							<input class="input_style20 marginleft_5" type="text" placeholder="품명" />							
							<input class="input_style20 marginleft_5" type="text" placeholder="브랜드" />							
							<input class="input_style20 marginleft_5" type="text" placeholder="규격" />							
							<input class="input_style20 marginleft_5" type="text" placeholder="모델명" />							
							<input class="input_style20 marginleft_5" type="text" placeholder="코드번호" />							
							<span class="inquiry_btn marginleft_7">
								<span data-type="save" data-value="1" class="sButton btn_span fs-13 pink marginleft_5" style="float: right;">저장</span>
								<span data-type="search" data-value="1"  class="sButton btn_span fs-13 blue" style="float: right;">조회</span>
							</span>
							<div class="margintop_5">
								<span class="return_select6">
									<select id="" class="" name="">
										<option value="">전체</option>
										<option value="1">정상</option>
										<option value="5">일시품절</option>
										<option value="2">단종</option>
										<option value="3">삭제</option>
									</select>
								</span>
								<span class="return_select6 marginleft_5">
									<select id="" class="" name="">
										<option value="">1단계</option>
									</select>
								</span>
								<span class="return_select6 marginleft_5">
									<select id="" class="" name="">
										<option value="">2단계</option>
									</select>
								</span>
								<span class="return_select6 marginleft_5">
									<select id="" class="" name="">
										<option value="">3단계</option>
									</select>
								</span>
								<span class="return_select6 marginleft_5">
									<select id="" class="" name="">
										<option value="">4단계</option>
									</select>
								</span>
								<span class="return_select6 marginleft_5">
									<select id="" class="" name="">
										<option value="">5단계</option>
									</select>
								</span>
							</div>
						</td>
					</tr>
				</tbody>
			</table>	
		</div>
		<div class='col-sm-5 col-md-5' style='padding-top:5px;'>
		    <div id='ib-container1'></div>
		</div>
	</div>
