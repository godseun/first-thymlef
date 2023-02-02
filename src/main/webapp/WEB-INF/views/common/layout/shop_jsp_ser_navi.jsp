<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript">
		$(function(){ 
			$(".main_Brand").on("click", function() {
				var isChk = _BT.isChecked("chk_Type"+$(this).attr('id'));
				var type = $(this).data("type");
				$('#cBrand').val('');
				var tmpValue = '';
				$('input:checkbox[name="chk_Brand"]').each(function() {
					if(this.checked){
						var cVal = $(this).attr('id');
						if(type == cVal){
							if(isChk){
								tmpValue += cVal + '@';
							}
						}else{
							tmpValue += cVal + '@';
						}
			      }
				 });
				tmpValue = tmpValue.substring(0,tmpValue.length-1);
				if(isChk){
					tmpValue += '@' + type;
				}				
				$('#cBrand').val(tmpValue);
				_BT.actFormSubmit('cFrm', 'POST', $(location).attr('pathname')+''+$(location).attr('search')); 
			});
	    });
		
		function goCateg(url){
			_BT.actFormSubmit('cFrm', 'POST', url); 
		}
		function fnMakerMsg(){
			_BT.openPopup( _BT.SHOP.URL.Search.popMaker,'MakerMsg', '700', '550', true, 'yes');
		}
		function fnSetHtml(){
			return $('#makerMsg').html();
		}
		function fnSendChoose(obj){
			$('#cBrand').val('');
			var tmpValue = '';
			for(var i=0; i<obj.length; i++){
				tmpValue += obj[i].value;
				if( i< obj.length -1 ){
					tmpValue += '@';
				}
			} 
			$('#cBrand').val(tmpValue);
			_BT.actFormSubmit('cFrm', 'POST', $(location).attr('pathname')+''+$(location).attr('search')); 
		}
	</script>
	<div class="sidebar">
		<form id="cFrm" name="cFrm">
			<input type="hidden" id="mValue" 	name="mValue" 	value="<c:out value="${query.mValue}"/>"/>
			<input type="hidden" id="mName" 	name="mName" 	value="<c:out value="${query.mName}"/>"/>
			<input type="hidden" id="mBrand" 	name="mBrand" 	value="<c:out value="${query.mBrand}"/>"/>
			<input type="hidden" id="mStndrd" name="mStndrd" 	value="<c:out value="${query.mStndrd}"/>"/>
			<input type="hidden" id="mModel" 	name="mModel" 	value="<c:out value="${query.mModel}"/>"/>
			<input type="hidden" id="mCode" 	name="mCode" 	value="<c:out value="${query.mCode}"/>"/>
<%-- 			
			<input type="hidden" id="mStore" 	name="mStore" 	value="<c:out value="${query.mStore}"/>"/>
 --%>			
			<input type="hidden" id="cBrand" 	name="cBrand" value="<c:out value="${query.cBrand}"/>"/>
		</form>
		<c:if test="${! empty result.categList}">
			<c:set var="LEV1_CD" 	value="0" />
			<c:set var="LEV2_CD" 	value="0" />
			<c:set var="LEV3_CD" 	value="0" />
			<c:set var="LEV4_CD" 	value="0" />
			<c:choose>
				<c:when test="${query.cTp eq '0'}">
					<h2 class="side_title">
						<span>전체</span>
					</h2>
				</c:when>
				<c:otherwise>
					<h2 class="side_title hMouse" onclick="goCateg('<c:out value="${host}"/>/shop/search/cTeg?cTp=1&cCode=<c:out value="${result.categList[0].LEV1_CD}"/>');">
						<span><c:out value="${result.categList[0].LEV1_NM}"/></span>
					</h2>
				</c:otherwise>
			</c:choose>		
			<c:choose>
				<c:when test="${query.cTp eq '0'}">
					<c:forEach items="${result.categList}" var="categ" varStatus="status">
						<div class="side_list">
							<ul>
								<li class="list_title_arrow">
									<%-- <a href="javascript:;" onclick="goCateg('<c:out value="${host}"/>/shop/search/cTeg?cTp=1&cCode=<c:out value="${categ.LEV1_CD}"/>');" class="title"> --%>
									<a href="" onclick="return false;" class="title">
										 <c:out value="${categ.LEV1_NM}"/>
									</a>
								</li>
							</ul>
						</div>
					</c:forEach>
				</c:when>
				<c:when test="${query.cTp eq '1'}">
					<c:forEach items="${result.categList}" var="categ" varStatus="status">
						<div class="side_list">
							<ul>
								<li class="list_title_arrow">
									<%-- <a href="javascript:;" onclick="goCateg('<c:out value="${host}"/>/shop/search/cTeg?cTp=2&cCode=<c:out value="${categ.LEV2_CD}"/>');" class="title"> --%> 
									<a href="" onclick="return false;" class="title">
										 <c:out value="${categ.LEV2_NM}"/>
									</a>
								</li>
							</ul>
						</div>
					</c:forEach>
				</c:when>
				<c:when test="${query.cTp eq '2'}">
					<div class="side_list">
						<ul>
							<li class="list_title_arrow">
								<%-- <a href="javascript:;" onclick="goCateg('<c:out value="${host}"/>/shop/search/cTeg?cTp=2&cCode=<c:out value="${result.categList[0].LEV2_CD}"/>');" class="title"> --%>
								<a href="" onclick="return false;" class="title">
									 <c:out value="${result.categList[0].LEV2_NM}"/>
								</a>
									<%-- <dl class="list_content">
										<c:forEach items="${result.categList}" var="categ" varStatus="status">
											<dd class="titl_02">
												<a href="javascript:;" onclick="goCateg('<c:out value="${host}"/>/shop/search/cTeg?cTp=3&cCode=<c:out value="${categ.LEV3_CD}"/>');">
											 		<c:out value="${categ.LEV3_NM}"/>
												</a>
											</dd>
										</c:forEach>
									</dl> --%>
							</li>
						</ul>
					</div>
				</c:when>
				<c:when test="${query.cTp eq '3'}">
					<div class="side_list">
						<ul>
							<li class="list_title_arrow">
								<%-- <a href="javascript:;" onclick="goCateg('<c:out value="${host}"/>/shop/search/cTeg?cTp=2&cCode=<c:out value="${result.categList[0].LEV2_CD}"/>');" class="title"> --%>
								<a href="" onclick="return false;" class="title">
									 <c:out value="${result.categList[0].LEV2_NM}"/>
								</a>
								<%-- <dl class="list_content">
									<dd class="titl_02">
										<a href="javascript:;" onclick="goCateg('<c:out value="${host}"/>/shop/search/cTeg?cTp=3&cCode=<c:out value="${result.categList[0].LEV3_CD}"/>');" class="<c:if test="${query.cTp eq '3'  and result.categList[0].LEV3_CD eq query.cCode}">naviOn</c:if>">
									 		<c:out value="${result.categList[0].LEV3_NM}"/>
										</a>
									</dd>
									<ol class="list_content01"> 
										<c:forEach items="${result.categList}" var="categ" varStatus="status">
											<li class="titl_03">
												<a href="javascript:;" onclick="goCateg('<c:out value="${host}"/>/shop/search/cTeg?cTp=4&cCode=<c:out value="${categ.LEV4_CD}"/>');" class="<c:if test="${categ.LEV4_CD eq query.cCode}">naviOn</c:if>">
													<c:out value="${categ.LEV4_NM}"/>
												</a>
											</li>
										</c:forEach>
									</ol>
								</dl> --%>
							</li>
						</ul>
					</div>
				</c:when>
				<c:when test="${query.cTp eq '4' or query.cTp eq '5'}">
					<div class="side_list">
						<ul>
							<li class="list_title_arrow">
								<%-- <a href="javascript:;" onclick="goCateg('<c:out value="${host}"/>/shop/search/cTeg?cTp=2&cCode=<c:out value="${result.categList[0].LEV2_CD}"/>');" class="title"> --%>
								<a href="" onclick="return false;" class="title">
									 <c:out value="${result.categList[0].LEV2_NM}"/>
								</a>
								<%-- <dl class="list_content">
									<dd class="titl_02">
										<a href="javascript:;" onclick="goCateg('<c:out value="${host}"/>/shop/search/cTeg?cTp=3&cCode=<c:out value="${result.categList[0].LEV3_CD}"/>');">
									 		<c:out value="${result.categList[0].LEV3_NM}"/>
										</a>
									</dd>
									<ol class="list_content01"> 
										<li class="titl_03">
											<a href="javascript:;" onclick="goCateg('<c:out value="${host}"/>/shop/search/cTeg?cTp=4&cCode=<c:out value="${result.categList[0].LEV4_CD}"/>');" class="<c:if test="${query.cTp eq '4' and  result.categList[0].LEV4_CD eq query.cCode}">naviOn</c:if>">
												<c:out value="${result.categList[0].LEV4_NM}"/> 
											</a>
										</li>
										<dt class="list_content03"> 
											<c:forEach items="${result.categList}" var="categ" varStatus="status">
												<li class=titl_03>
													<a href="javascript:;" onclick="goCateg('<c:out value="${host}"/>/shop/search/cTeg?cTp=5&cCode=<c:out value="${categ.LEV5_CD}"/>');" class="<c:if test="${categ.LEV5_CD eq query.cCode}">naviOn</c:if>">
														<c:out value="${categ.LEV5_NM}"/>
													</a>
												</li>
											</c:forEach>
										</dt>
									</ol>
								</dl> --%>
							</li>
						</ul>
					</div>
				</c:when>
			</c:choose>		
		</c:if>
<%-- 		<c:if test="${! empty result.brand}">
			<h2 class="side_title">
				브랜드
			</h2>
			<div class="side_list">
				<ul>
					<c:forEach items="${result.brand}" var="brand" varStatus="status" end="9">
						<li class="list_title">
							<a href="javascript:;" class="title main_Brand" data-type="<c:out value="${brand.MAKR_CD}"/>" id="<c:out value="${status.count}"/>">
								<input type="checkbox" id="chk_Type<c:out value="${status.count}"/>" name="m_Brand" <c:if test="${ fn:indexOf(query.cBrand, brand.MAKR_CD) ne '-1'}"> checked="checked" </c:if>/><label for="chk_Type<c:out value="${status.count}"/>"><c:out value="${brand.MAKR_NM}"/></label>
							</a>
						</li>
					</c:forEach>
					<c:if test="${fn:length(result.brand) ge '10'}">
						<li class="list_title_arrow">
							<a href="javascript:;" onclick="fnMakerMsg();" class="title">
								 더보기
							</a>
						</li>
					</c:if>
				</ul>
			</div>
		</c:if> --%>
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
	<div class="makerMsg vOff" id="makerMsg">
		<table class="tbl_Type07">
			<caption>전체 브랜드</caption>
			<colgroup>
				<col style="width: 25%;">
				<col style="width: 25%;">
				<col style="width: 25%;">
				<col style="width: 25%;">
			</colgroup>
			<tbody>
				<tr>
					<c:forEach items="${result.brand}" var="brand" varStatus="status">
							<td class="maker_table" align="left">
								<a href="javascript:;" class="title">
									<input type="checkbox" id="<c:out value="${brand.MAKR_CD}"/>" name="chk_Brand" <c:if test="${ fn:indexOf(query.cBrand, brand.MAKR_CD) ne '-1'}"> checked="checked" </c:if>/><label for="<c:out value="${brand.MAKR_CD}"/>"><c:out value="${brand.MAKR_NM}"/></label>
								</a>
							</td>
						<c:if test="${status.count%4 eq '0'}"></tr></c:if>
						<c:if test="${status.count%4 eq '0'}"><tr></c:if>
					</c:forEach>			
				</tr>			
			</tbody>
		</table>
	</div>		 