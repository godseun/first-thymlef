<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@include file="/WEB-INF/views/common/layout/include/base.jsp" %>
		<script type='text/javascript'>
			var dupClick1 = false;
			var dev = 1;
			var url = '';
			$(function () {
				$(".search").on("click", function () {
					initSearch(2);
				});
				initSearch(1);
			});
			function initSearch(type) {
				var supply = $('#supply option:selected').val();
				if (supply == '') {
					if (type == '2') {
						alert('대상사이트를 선택해 주세요.');
					}
					return false;
				}
				if (supply == 'CR') {
					var url2 = 'http://ctx.cretec.kr/nctx/signon.do?mode=1280&uid=12082029&upasswd=SY2511';
					$('#lgFrame').attr('src', url2);

				} else if (supply == 'KB') {
					$('#FrmKB').attr('method', 'POST').attr('target', 'lgFrame').attr('action', 'http://tnet.kb-one.co.kr/j_spring_security_check').submit();

				} else if (supply == 'DS') {
					$('#FrmDS').attr('method', 'POST').attr('target', 'lgFrame').attr('action', 'http://dstoolpia.co.kr/index.aspx').submit();
				}

				if (supply == 'CR') {
					url = 'http://ctx.cretec.kr/nctx/order/search.do?1=1';
					if ($('#mCode').val() != '') {
						url += '&prod_cd=' + $('#mCode').val().substring(3);
					} else {
						url += '&search=' + $('#mName').val();
						url += '&brnd_nm=' + $('#mBrand').val();
					}
				} else if (supply == 'KB') {
					url = 'http://tnet.kb-one.co.kr/guide/prodSearchList/index.do?callType=powerSearch&pageSize=400';
					if ($('#mCode').val() != '') {
						url += '&powerITEMCD=' + $('#mCode').val().substring(3);
					} else {
						url += '&powerSearchKeyword=' + $('#mName').val();
						url += '&powerBNDNM=' + $('#mBrand').val();
					}
				} else if (supply == 'DS') {
					url = 'http://dstoolpia.co.kr/product/product02.aspx?SectionNo=AB';
					if ($('#mName').val() != '') {
						url += '&PromNo=' + $('#mName').val();
						//url+= '&txtPower=' + $('#mName').val();
					}
					if ($('#mBrand').val() != '') {
						//url+= '&txtMaker=' + $('#mBrand').val();
					}
				}
				if (url != '') {
					$('#sFrame').attr('src', url);
				}
			}
		</script>
		<!-- 팝업창 시작 -->
		<h1 class="blue_title">
			DAEHWA - 상세 검색
			<span class="close" onclick="fnClose();">
			</span>
		</h1>
		<div id="searchDiv" class="">
			<div>
				<form id="FrmDS" name="FrmDS">
					<input type="hidden" id="txtID" name="txtID" value="51339" />
					<input type="hidden" id="txtPass" name="txtPass" value="ehdtls" />
					<input type="hidden" id="cmb01" name="cmb01" value="00" />
					<input type="hidden" id="cmdLogIn.x" name="cmdLogIn.x" value="33" />
					<input type="hidden" id="cmdLogIn.y" name="cmdLogIn.y" value="15" />
					<input type="hidden" id="TabContainer1_ClientState" name="TabContainer1_ClientState"
						value='{"ActiveTabIndex":0,"TabState":[true,true]}' />
					<input type="hidden" id="__VIEWSTATE" name="__VIEWSTATE"
						value='/wEPDwUKLTkwMzYyMjA2NQ9kFgICAw9kFgwCCQ8PZBYEHgpvbmtleXByZXNzBUZpZihldmVudC5rZXlDb2RlPT0xMykgIHtfX2RvUG9zdEJhY2soJ2NtZFNlYXJjaCcsJycpOyAgcmV0dXJuIGZhbHNlOyB9HgdvbmZvY3VzBRJ0eHRQb3dlci5zZWxlY3QoKTtkAgsPD2QWAh8ABUdpZihldmVudC5rZXlDb2RlPT0xMykgIHs7X19kb1Bvc3RCYWNrKCdjbWRTZWFyY2gnLCcnKTsgIHJldHVybiBmYWxzZTsgfWQCEQ9kFgQCAQ8PZBYCHwAFOWlmKGV2ZW50LmtleUNvZGU9PTEzKSB7dHh0UGFzcy5zZWxlY3QoKSA7IHJldHVybiBmYWxzZTsgfWQCBQ8PZBYCHwAFRGlmKGV2ZW50LmtleUNvZGU9PTEzKSB7IF9fZG9Qb3N0QmFjaygnY21kTG9nSW4nLCcnKTsgcmV0dXJuIGZhbHNlOyB9ZAIpD2QWBGYPZBYCAgEPZBYCAgEPDxYCHgRUZXh0BfAJPGEgaHJlZj1jb21tdW5pdHkvYm9hcmR2aWV3LmFzcHg/Qm9hcmRJRD1ib2FyZGdvbmcmc2Vxbm89MzE5OD4xMi0yOCZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOzIwMTfrhYQg7IOI7ZW0IOuztSDrp47snbQ8L2E+PGJyPjxhIGhyZWY9Y29tbXVuaXR5L2JvYXJkdmlldy5hc3B4P0JvYXJkSUQ9Ym9hcmRnb25nJnNlcW5vPTMxNzQ+MTAtMTMmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDtb6rO17KeAXSDtlZzqta3rr7jsiqTrr7gg7IOBPC9hPjxicj48YSBocmVmPWNvbW11bml0eS9ib2FyZHZpZXcuYXNweD9Cb2FyZElEPWJvYXJkZ29uZyZzZXFubz0zMTU5PjA4LTA0Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7W+qzteyngF0gMjAxNyDri6zroKVf64uk7J20Li4uPC9hPjxicj48YSBocmVmPWNvbW11bml0eS9ib2FyZHZpZXcuYXNweD9Cb2FyZElEPWJvYXJkZ29uZyZzZXFubz0zMTUwPjA3LTI1Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7W+qzteyngF0gKOyjvCnrj5nsi6DtiLTtlLzslYQuLi48L2E+PGJyPjxhIGhyZWY9Y29tbXVuaXR5L2JvYXJkdmlldy5hc3B4P0JvYXJkSUQ9Ym9hcmRnb25nJnNlcW5vPTMxMjU+MDQtMTEmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDtb7KCE7Iuc7JWI64K0XSBTSU1UT1MgMjA8L2E+PGJyPjxhIGhyZWY9Y29tbXVuaXR5L2JvYXJkdmlldy5hc3B4P0JvYXJkSUQ9Ym9hcmRnb25nJnNlcW5vPTMxMDc+MDItMDMmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsyMDE264WEIOyEpOyXsO2ctCDslYjrgrQ8L2E+PGJyPjxhIGhyZWY9Y29tbXVuaXR5L2JvYXJkdmlldy5hc3B4P0JvYXJkSUQ9Ym9hcmRnb25nJnNlcW5vPTE2MTk+MTItMzAmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsyMDE264WEIOyDiO2VtCDrs7Ug66eO7J20PC9hPjxicj48YSBocmVmPWNvbW11bml0eS9ib2FyZHZpZXcuYXNweD9Cb2FyZElEPWJvYXJkZ29uZyZzZXFubz0xNTk4PjEwLTE0Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7QjJCIOusuOyekOuplOyEuOyngCDrsJzshqEuLi48L2E+PGJyPjxhIGhyZWY9Y29tbXVuaXR5L2JvYXJkdmlldy5hc3B4P0JvYXJkSUQ9Ym9hcmRnb25nJnNlcW5vPTE1OTc+MTAtMTImbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsyMDE17ISc7Jq46rWt7KCc6rO16rWs7KCEIOu2gDwvYT48YnI+PGEgaHJlZj1jb21tdW5pdHkvYm9hcmR2aWV3LmFzcHg/Qm9hcmRJRD1ib2FyZGdvbmcmc2Vxbm89MTU4Mj4wOC0wMyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOzIwMTYg64us66ClLeuLpOydtOyWtOumrCDso7w8L2E+PGJyPmRkAgEPZBYCAgEPZBYCAgEPDxYCHwIFlgk8YSBocmVmPWNvbW11bml0eS9ib2FyZHZpZXcuYXNweD9Cb2FyZElEPWJvYXJkcW5hJnNlcW5vPTMzMTk+MDEtMTEmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDvqsbDrnpjsg4Hri7Q8L2E+PGJyPjxhIGhyZWY9Y29tbXVuaXR5L2JvYXJkdmlldy5hc3B4P0JvYXJkSUQ9Ym9hcmRxbmEmc2Vxbm89MzMxOD4wMS0wMiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwO+qxsOuemOusuOydmDwvYT48YnI+PGEgaHJlZj1jb21tdW5pdHkvYm9hcmR2aWV3LmFzcHg/Qm9hcmRJRD1ib2FyZHFuYSZzZXFubz0zMzE3PjAxLTAyJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A766y47J2Y65Oc66a964uI64ukLjwvYT48YnI+PGEgaHJlZj1jb21tdW5pdHkvYm9hcmR2aWV3LmFzcHg/Qm9hcmRJRD1ib2FyZHFuYSZzZXFubz0zMzE2PjEyLTI4Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A77KCc7ZKI6rWs66ek66y47J2YPC9hPjxicj48YSBocmVmPWNvbW11bml0eS9ib2FyZHZpZXcuYXNweD9Cb2FyZElEPWJvYXJkcW5hJnNlcW5vPTMzMTM+MTItMTkmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDvtmozsm5DqsIDsnoXrrLjsnZg8L2E+PGJyPjxhIGhyZWY9Y29tbXVuaXR5L2JvYXJkdmlldy5hc3B4P0JvYXJkSUQ9Ym9hcmRxbmEmc2Vxbm89MzMxMj4xMi0wOSZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwO+ybuey5tOuLpOuhnSDsmKTrpZjrsJzsg508L2E+PGJyPjxhIGhyZWY9Y29tbXVuaXR5L2JvYXJkdmlldy5hc3B4P0JvYXJkSUQ9Ym9hcmRxbmEmc2Vxbm89MzMwND4xMS0wNyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwO+yerOqzoOusuOydmDwvYT48YnI+PGEgaHJlZj1jb21tdW5pdHkvYm9hcmR2aWV3LmFzcHg/Qm9hcmRJRD1ib2FyZHFuYSZzZXFubz0zMzAzPjExLTA2Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A77ZqM7JuQ6rCA7J6FIOusuOydmDwvYT48YnI+PGEgaHJlZj1jb21tdW5pdHkvYm9hcmR2aWV3LmFzcHg/Qm9hcmRJRD1ib2FyZHFuYSZzZXFubz0zMjk1PjA5LTA1Jm5ic3A7Jm5i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l6Av7Jew66eIIOyekOyytO2UhOuhnOuqqOyFmC8xNzEwMjQwMSkyMDE364WEIDEy7JuUIO2VnOq1rU9TRyBIU1Mg7JeU65Oc67CAICMxNzEyMDEwMSntlZzqta1PU0cg7LSI6rK97JeU65Oc67CAIDwxNzA5MjcxMynimIYyMDE364WEIOuPmeygiOq4sCDtlZzsnbwo7KCE6riw7J6l7YyQKSBkbSDtmY3rs7QgMTcxMTEzMDkpMjAxOOuFhCAx7JuUIERNIOychO2VmCAzMTgwMTAyMDcpMjAxOOuFhCAwMeyblCDsmKTthqDsiqQg7J6Q7LK07ZSE66Gc66qo7IWYPzE3MTExMzEyKTIwMTjrhYQgMeyblCBETSDsvIDsnbTrlJTsmYDsnbTrs7TtmLjrs7UoS0RZ67O07Zi467O1KTQxNzA5MjgwMinimIYyMDE364WEIOuPmeygiOq4sCDrk5zrprzslYjsoIQgZG0g7ZmN67O0RTE3MDkxNTAzKTIwMTfrhYQg6rWs66ek7J6F7LKY7ZSE66Gc66qo7IWYKOyEnOu4jOybkCzsl5DsiqTrlJTsg4HsgqwuKUUxNzA5MTUwMykyMDE364WEIOq1rOunpOyeheyymO2UhOuhnOuqqOyFmCjshJzruIzsm5As7JeQ7Iqk65SU7IOB7IKsLilDMTcxMDI1MDEpMjAxN+uFhCAxMeyblCDsnpDssrTtlITroZzrqqjshZgg7Iug7KCV6riA65+s67iMIFBVIOyepeqwkSAxNzExMTgwMSkyMDE464WEIDHsm5QgRE0g7ZWY7ZSEIDUxNzExMTYwMikyMDE464WEIDHsm5QgRE0gQUxMSVQg7JWM66Oo66+464qEIOqzteq1rO2VqCIxNzExMTgwMikyMDE464WEIDHsm5QgRE0g7IqI7Y2867CxLzE3MTIwNDAxKTIwMTfrhYQgMeyblCBETSDsnbTsl5HsiqTtjIzsm4wg7KSE7J6QNTE3MTIyOTAyKTIwMTjrhYQgMeyblCDsiqTrr7jthqDrqqgg7J6Q7LK07ZSE66Gc66qo7IWYMTE3MTExNTAyKeKYhjIwMTfrhYQg64+Z7KCI6riwIO2bhOyngOy5tCBkbSDtmY3rs7QfMTcxMTEzMTApMjAxOOuFhCAx7JuUIERNIOyKiO2NvCcxODAxMDUwMSkyMDE464WEIOy9lOuyoOyVhCDtlITroZzrqqjshZhFMTcwOTE1MDMpMjAxN+uFhCDqtazrp6TsnoXsspjtlITroZzrqqjshZgo7ISc67iM7JuQLOyXkOyKpOuUlOyDgeyCrC4pHzE3MTExMzExKTIwMTjrhYQgMeyblCBETSDrsqHshYBFMTcwOTE1MDMpMjAxN+uFhCDqtazrp6TsnoXsspjtlITroZzrqqjshZgo7ISc67iM7JuQLOyXkOyKpOuUlOyDgeyCrC4pRTE3MDkxNTAzKTIwMTfrhYQg6rWs66ek7J6F7LKY7ZSE66Gc66qo7IWYKOyEnOu4jOybkCzsl5DsiqTrlJTsg4HsgqwuKTcxNzA5MjcxMCnimIYyMDE364WEIOuPmeygiOq4sCDrgpjrnbzsp4DtgrTsnbQgZG0g7ZmN67O0MTE3MDkyNzAyKeKYhjIwMTfrhYQg64+Z7KCI6riwIOyLoOyngOuCqCBkbSDtmY3rs7Q0MTcxMTIzMDMpMjAxOOuFhCAx7JuUIERNIEVYLVBPV0VSIO2FjO2UhOuhoO2FjOydtO2UhDsxNzEyMDgwMSkyMDE464WEIDHsm5QgRE0g7J207JeR7Iqk7YyM7JuMIOyVjOujqOuvuOuKhOy7pO2EsDQxNzA5MjcwOCnimIYyMDE364WEIOuPmeygiOq4sCDtmITrjIDtmZTtlZkgZG0g7ZmN67O0NDE3MDkyNzAzKeKYhjIwMTfrhYQg64+Z7KCI6riwIO2DgOydtOqxsO2CuSBkbSDtmY3rs7QxMTcwOTI3MDcp4piGMjAxN+uFhCDrj5nsoIjquLAg7KeA7JmA7Yq4IGRtIO2ZjeuztEUxNzExMzAwMykyMDE464WEIDHsm5Qg7J6Q7LK07ZSE66Gc66qo7IWYIOydtOyXkeyKpO2MjOybjCDqsIDsiqTthqDsuZg9MTcxMTEzMDEpMjAxN+uFhCAxMuyblCAyMDE464WEIDHsm5QgRE0g7J207JeR7Iqk7YyM7JuMIO2ZgOyGjDExODAxMDIwMSkyMDE464WEIOyCvOybkOyghOyEoCDsnpDssrQg7ZSE66Gc66qo7IWYKDE3MTExMzE0KTIwMTjrhYQgMeyblCBETSDsm7Drk5ztlIzrn6zsiqQ8MTcxMjA4MDUpMjAxOOuFhCAx7JuUIOy8gOydtOuUlOyZgOydtCDsoITshKDrprQg7ZSE66Gc66qo7IWYMDE3MTIyOTA1KTIwMTjrhYQg7ZWc6rWt7JW86riIIOyekOyytO2UhOuhnOuqqOyFmC4xNzA5MjcwNCnimIYyMDE364WEIOuPmeygiOq4sCDsi6DsnbwgZG0g7ZmN67O0QTE3MTExNTAzKTIwMTfrhYQg7L2U66as7JWE7KCE6riwIOyepeq4sOyerOqzoCDshozsp4Qg7ZSE66Gc66qo7IWYLTE3MTExMzE1KTIwMTjrhYQgMeyblCBETSDtg5zslpEo67aA7YOE6rCA7IqkKTQxNzA5MjcxMSnimIYyMDE364WEIOuPmeygiOq4sCDsiqTrhbjsmrDrp6ggZG0g7ZmN67O0OzE3MTEwNjA0KTIwMTjrhYQgMeyblCBETSDsnbTsl5HsiqTtjIzsm4wg7JWE7YGQ66eI7YK57IS87YSwGTE3MTAxNjE0Ke2DnO2ZlCAxMuyblCBETSAzMTcxMjI5MDQpMjAxOOuFhCAx7JuUIO2VmOyasO2KuCDsnpDssrQg7ZSE66Gc66qo7IWYQDE3MDEwOTAxKTIwMTfrhYQg7J207JeR7Iqk7YyM7JuMIOuniOq3uOuTnOumtCDsnpDssrTtlITroZzrqqjshZhFMTcwOTE1MDMpMjAxN+uFhCDqtazrp6TsnoXsspjtlITroZzrqqjshZgo7ISc67iM7JuQLOyXkOyKpOuUlOyDgeyCrC4pLzE3MTIyOTA2KTIwMTjrhYQgMeyblCDtg5zsp4Qg7J6Q7LK07ZSE66Gc66qo7IWYIDE3MTIwODAyKTIwMTjrhYQgMDHsm5QgRE0g64yA7KeEKDE3MTIwODAzKTIwMTjrhYQgMeyblCBETSDslYTtgZDtirjroInsiqRFMTcwOTE1MDMpMjAxN+uFhCDqtazrp6TsnoXsspjtlITroZzrqqjshZgo7ISc67iM7JuQLOyXkOyKpOuUlOyDgeyCrC4pRTE3MDkxNTAzKTIwMTfrhYQg6rWs66ek7J6F7LKY7ZSE66Gc66qo7IWYKOyEnOu4jOybkCzsl5DsiqTrlJTsg4HsgqwuKTAxNjEyMjcwMykyMDE364WEIDHsm5Qg67Kg7IWAIOyekOyytCDtlITroZzrqqjshZg3MTcwOTI3MTIp4piGMjAxN+uFhCDrj5nsoIjquLAg64yA7JuF66qo64ud7Lu0IGRtIO2ZjeuztDExNzA5MjcwOSnimIYyMDE364WEIOuPmeygiOq4sCDrsoTtjJTroZwgZG0g7ZmN67O0MjE3MTEyOTAxKTIwMTjrhYQgMeyblCBETSDtgrnthqDri4gg7YyM7J207ZSE7Luk7YSwLzE3MTEyMzAyKTIwMTjrhYQgMeyblCBETSDsjaztgqQg66Gx67mE7Yq47IaM7LyTMjE3MTIwNDAyKTIwMTjrhYQgMeyblCBETSDsnbTsl5HsiqTtjIzsm4wg7LqY66as7Y28QDE3MTEyNTAyKTIwMTjrhYQgMeyblCDsnpHsl4Xqs7Xqtawg7J6Q7LK07ZSE66Gc66qo7IWYKOuqqOultOyKpCkVQgBFMTcwOTE1MDMpMjAxN+uFhCDqtazrp6TsnoXsspjtlITroZzrqqjshZgo7ISc67iM7JuQLOyXkOyKpOuUlOyDgeyCrC4pRTE3MDkxNTAzKTIwMTfrhYQg6rWs66ek7J6F7LKY7ZSE66Gc66qo7IWYKOyEnOu4jOybkCzsl5DsiqTrlJTsg4HsgqwuKTQxNzA5MjcwNinimIYyMDE364WEIOuPmeygiOq4sCDsmrDso7zsoITsl7QgZG0g7ZmN67O0RTE3MDkxNTAzKTIwMTfrhYQg6rWs66ek7J6F7LKY7ZSE66Gc66qo7IWYKOyEnOu4jOybkCzsl5DsiqTrlJTsg4HsgqwuKS8xNzEyMjkwMSkyMDE464WEIDHsm5Qg64uk7J24IOyekOyytO2UhOuhnOuqqOyFmDgxNzExMTMxMykyMDE464WEIDHsm5Qg7Zqo7ISx65SU7JWk7ZS8IOyekOyytO2UhOuhnOuqqOyFmCQxNzExMTMwOCkyMDE464WEIDHsm5Qg7L2U66a0KOyCvOq1rSkmMTcxMTIzMDEpMjAxOOuFhCAx7JuUIERNIEtEWSDsnqXqsJHrpZg0MTgwMTAyMDIpMjAxOOuFhCDsk7Drpqzsl6Av7Jew66eIIOyekOyytO2UhOuhnOuqqOyFmC8xNzEwMjQwMSkyMDE364WEIDEy7JuUIO2VnOq1rU9TRyBIU1Mg7JeU65Oc67CAICMxNzEyMDEwMSntlZzqta1PU0cg7LSI6rK97JeU65Oc67CAIDwxNzA5MjcxMynimIYyMDE364WEIOuPmeygiOq4sCDtlZzsnbwo7KCE6riw7J6l7YyQKSBkbSDtmY3rs7QgMTcxMTEzMDkpMjAxOOuFhCAx7JuUIERNIOychO2VmCAzMTgwMTAyMDcpMjAxOOuFhCAwMeyblCDsmKTthqDsiqQg7J6Q7LK07ZSE66Gc66qo7IWYPzE3MTExMzEyKTIwMTjrhYQgMeyblCBETSDsvIDsnbTrlJTsmYDsnbTrs7TtmLjrs7UoS0RZ67O07Zi467O1KTQxNzA5MjgwMinimIYyMDE364WEIOuPmeygiOq4sCDrk5zrprzslYjsoIQgZG0g7ZmN67O0RTE3MDkxNTAzKTIwMTfrhYQg6rWs66ek7J6F7LKY7ZSE66Gc66qo7IWYKOyEnOu4jOybkCzsl5DsiqTrlJTsg4HsgqwuKUUxNzA5MTUwMykyMDE364WEIOq1rOunpOyeheyymO2UhOuhnOuqqOyFmCjshJzruIzsm5As7JeQ7Iqk65SU7IOB7IKsLilDMTcxMDI1MDEpMjAxN+uFhCAxMeyblCDsnpDssrTtlITroZzrqqjshZgg7Iug7KCV6riA65+s67iMIFBVIOyepeqwkSAxNzExMTgwMSkyMDE464WEIDHsm5QgRE0g7ZWY7ZSEIDUxNzExMTYwMikyMDE464WEIDHsm5QgRE0gQUxMSVQg7JWM66Oo66+464qEIOqzteq1rO2VqCIxNzExMTgwMikyMDE464WEIDHsm5QgRE0g7IqI7Y2867CxLzE3MTIwNDAxKTIwMTfrhYQgMeyblCBETSDsnbTsl5HsiqTtjIzsm4wg7KSE7J6QNTE3MTIyOTAyKTIwMTjrhYQgMeyblCDsiqTrr7jthqDrqqgg7J6Q7LK07ZSE66Gc66qo7IWYMTE3MTExNTAyKeKYhjIwMTfrhYQg64+Z7KCI6riwIO2bhOyngOy5tCBkbSDtmY3rs7QfMTcxMTEzMTApMjAxOOuFhCAx7JuUIERNIOyKiO2NvCcxODAxMDUwMSkyMDE464WEIOy9lOuyoOyVhCDtlITroZzrqqjshZhFMTcwOTE1MDMpMjAxN+uFhCDqtazrp6TsnoXsspjtlITroZzrqqjshZgo7ISc67iM7JuQLOyXkOyKpOuUlOyDgeyCrC4pHzE3MTExMzExKTIwMTjrhYQgMeyblCBETSDrsqHshYBFMTcwOTE1MDMpMjAxN+uFhCDqtazrp6TsnoXsspjtlITroZzrqqjshZgo7ISc67iM7JuQLOyXkOyKpOuUlOyDgeyCrC4pRTE3MDkxNTAzKTIwMTfrhYQg6rWs66ek7J6F7LKY7ZSE66Gc66qo7IWYKOyEnOu4jOybkCzsl5DsiqTrlJTsg4HsgqwuKTcxNzA5MjcxMCnimIYyMDE364WEIOuPmeygiOq4sCDrgpjrnbzsp4DtgrTsnbQgZG0g7ZmN67O0MTE3MDkyNzAyKeKYhjIwMTfrhYQg64+Z7KCI6riwIOyLoOyngOuCqCBkbSDtmY3rs7Q0MTcxMTIzMDMpMjAxOOuFhCAx7JuUIERNIEVYLVBPV0VSIO2FjO2UhOuhoO2FjOydtO2UhDsxNzEyMDgwMSkyMDE464WEIDHsm5QgRE0g7J207JeR7Iqk7YyM7JuMIOyVjOujqOuvuOuKhOy7pO2EsDQxNzA5MjcwOCnimIYyMDE364WEIOuPmeygiOq4sCDtmITrjIDtmZTtlZkgZG0g7ZmN67O0NDE3MDkyNzAzKeKYhjIwMTfrhYQg64+Z7KCI6riwIO2DgOydtOqxsO2CuSBkbSDtmY3rs7QxMTcwOTI3MDcp4piGMjAxN+uFhCDrj5nsoIjquLAg7KeA7JmA7Yq4IGRtIO2ZjeuztEUxNzExMzAwMykyMDE464WEIDHsm5Qg7J6Q7LK07ZSE66Gc66qo7IWYIOydtOyXkeyKpO2MjOybjCDqsIDsiqTthqDsuZg9MTcxMTEzMDEpMjAxN+uFhCAxMuyblCAyMDE464WEIDHsm5QgRE0g7J207JeR7Iqk7YyM7JuMIO2ZgOyGjDExODAxMDIwMSkyMDE464WEIOyCvOybkOyghOyEoCDsnpDssrQg7ZSE66Gc66qo7IWYKDE3MTExMzE0KTIwMTjrhYQgMeyblCBETSDsm7Drk5ztlIzrn6zsiqQ8MTcxMjA4MDUpMjAxOOuFhCAx7JuUIOy8gOydtOuUlOyZgOydtCDsoITshKDrprQg7ZSE66Gc66qo7IWYMDE3MTIyOTA1KTIwMTjrhYQg7ZWc6rWt7JW86riIIOyekOyytO2UhOuhnOuqqOyFmC4xNzA5MjcwNCnimIYyMDE364WEIOuPmeygiOq4sCDsi6DsnbwgZG0g7ZmN67O0QTE3MTExNTAzKTIwMTfrhYQg7L2U66as7JWE7KCE6riwIOyepeq4sOyerOqzoCDshozsp4Qg7ZSE66Gc66qo7IWYLTE3MTExMzE1KTIwMTjrhYQgMeyblCBETSDtg5zslpEo67aA7YOE6rCA7IqkKTQxNzA5MjcxMSnimIYyMDE364WEIOuPmeygiOq4sCDsiqTrhbjsmrDrp6ggZG0g7ZmN67O0OzE3MTEwNjA0KTIwMTjrhYQgMeyblCBETSDsnbTsl5HsiqTtjIzsm4wg7JWE7YGQ66eI7YK57IS87YSwGTE3MTAxNjE0Ke2DnO2ZlCAxMuyblCBETSAzMTcxMjI5MDQpMjAxOOuFhCAx7JuUIO2VmOyasO2KuCDsnpDssrQg7ZSE66Gc66qo7IWYQDE3MDEwOTAxKTIwMTfrhYQg7J207JeR7Iqk7YyM7JuMIOuniOq3uOuTnOumtCDsnpDssrTtlITroZzrqqjshZhFMTcwOTE1MDMpMjAxN+uFhCDqtazrp6TsnoXsspjtlITroZzrqqjshZgo7ISc67iM7JuQLOyXkOyKpOuUlOyDgeyCrC4pLzE3MTIyOTA2KTIwMTjrhYQgMeyblCDtg5zsp4Qg7J6Q7LK07ZSE66Gc66qo7IWYIDE3MTIwODAyKTIwMTjrhYQgMDHsm5QgRE0g64yA7KeEKDE3MTIwODAzKTIwMTjrhYQgMeyblCBETSDslYTtgZDtirjroInsiqRFMTcwOTE1MDMpMjAxN+uFhCDqtazrp6TsnoXsspjtlITroZzrqqjshZgo7ISc67iM7JuQLOyXkOyKpOuUlOyDgeyCrC4pRTE3MDkxNTAzKTIwMTfrhYQg6rWs66ek7J6F7LKY7ZSE66Gc66qo7IWYKOyEnOu4jOybkCzsl5DsiqTrlJTsg4HsgqwuKTAxNjEyMjcwMykyMDE364WEIDHsm5Qg67Kg7IWAIOyekOyytCDtlITroZzrqqjshZg3MTcwOTI3MTIp4piGMjAxN+uFhCDrj5nsoIjquLAg64yA7JuF66qo64ud7Lu0IGRtIO2ZjeuztDExNzA5MjcwOSnimIYyMDE364WEIOuPmeygiOq4sCDrsoTtjJTroZwgZG0g7ZmN67O0MjE3MTEyOTAxKTIwMTjrhYQgMeyblCBETSDtgrnthqDri4gg7YyM7J207ZSE7Luk7YSwLzE3MTEyMzAyKTIwMTjrhYQgMeyblCBETSDsjaztgqQg66Gx67mE7Yq47IaM7LyTMjE3MTIwNDAyKTIwMTjrhYQgMeyblCBETSDsnbTsl5HsiqTtjIzsm4wg7LqY66as7Y28QDE3MTEyNTAyKTIwMTjrhYQgMeyblCDsnpHsl4Xqs7Xqtawg7J6Q7LK07ZSE66Gc66qo7IWYKOuqqOultOyKpCkUKwNCZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnFgFmZAIvDw9kFgIfAAVIaWYoZXZlbnQua2V5Q29kZT09MTMpICB7O19fZG9Qb3N0QmFjaygnY21kU2VhcmNoMicsJycpOyAgcmV0dXJuIGZhbHNlOyB9ZAI8DzwrAAkBAA8WBB4IRGF0YUtleXMWAB4LXyFJdGVtQ291bnQCBWQWCmYPZBYCZg8VAw8wNDYxNTYxLTExMC5qcGcEMzMxNRpLRFkg6rCA7KCV7JqpIOqzteq1rOyEuO2KuGQCAQ9kFgJmDxUDDzA0NjA5MDUtMTEwLmpwZwQzMzE0E0tEWSDtjIzsnbTtlITsu6TthLBkAgIPZBYCZg8VAw8wNDQ1Mjg3LTExMC5qcGcEMzMxMRnsl6DsvZjti7Ag7Yi07ZSE66as7IS47YSwZAIDD2QWAmYPFQMPMDQ0NzE5Ny0xMTAuanBnBDMzMTAd7IK87LKc66as7Yi066eBIOuTnOumtOyymSDsmbhkAgQPZBYCZg8VAw8wNDYwNDk0LTExMC5qcGcEMzMwORzsvIDsnbTrlJTsmYDsnbQg7Juw65Sp7Jqp7ZKIZBgCBR5fX0NvbnRyb2xzUmVxdWlyZVBvc3RCYWNrS2V5X18WCQUMSW1hZ2VCdXR0b24yBQljbWRTZWFyY2gFDGNtZFN1YlNlYXJjaAUIY21kTG9nSW4FC2NtZFNlbmRCaWxsBQxJbWFnZUJ1dHRvbjQFDVRhYkNvbnRhaW5lcjEFCGJ0bkNsb3NlBQpjbWRTZWFyY2gyBQ1UYWJDb250YWluZXIxDw9kZmRSdWu5V0XFyscwq1jzOOEA8TEsgw==' />
					<input type="hidden" id="__EVENTVALIDATION" name="__EVENTVALIDATION"
						value='/wEWMALVt5aMBALSwtXkAgLChMzTCQLRjcOVDALbxvf1BwLkrqrpBgKs+5bqDwLlx830CALKw6LdBQKostXwBALSwv2aBAKT+PmaCALEt5iDCALU2PLuBALL2PLuBALL2P7uBALL2PruBALL2MbuBALL2MLuBALL2M7uBALL2MruBALL2NbuBALL2JLtBALL2J7tBALK2PLuBALK2P7uBALK2PruBALK2MbuBALK2MLuBALK2M7uBALK2MruBALK2NbuBALK2JLtBALT2NbuBALT2JLtBALT2J7tBALBt5iDCALEhISFCwLfqL3fBwLX+6j7CQLEhIhJAq2bzvANAoTC8aYFAov+pMgNAqKWhPUMAtvGr/cHAov2mPQCAub6jfQCypgHnq4E4+Rhqc5FoqxFA7+wrfU=' />
				</form>
				<form id="FrmKB" name="FrmKB">
					<input type="hidden" id="nowUriInfo" name="nowUriInfo" value="/user/main/index.do" />
					<input type="hidden" id="j_username" name="j_username" value="18025" />
					<input type="hidden" id="j_password" name="j_password" value="sy7121" />
				</form>
				<form id="sheetFrm" name="sheetFrm">
					<table class="tbl_Type02">
						<caption>조회</caption>
						<colgroup>
							<col width="8%">
							<col width="%">
						</colgroup>
						<tbody>
							<tr>
								<th>
									조회
								</th>
								<td style="text-align: left;">
									<input class="input_style20" type="text" id="mValue" name="mValue"
										style="color: #3f51b5; border: 2px solid #3f51b5; font-weight: bolder;" placeholder="키워드" />
									<input class="input_style20 marginleft_5" type="text" id="mName" name="mName" placeholder="품명"
										value="<c:out value=" ${pageParm.NAME}" />"/>
									<input class="input_style20 marginleft_5" type="text" id="mBrand" name="mBrand" placeholder="브랜드"
										value="<c:out value=" ${pageParm.MAKER}" />"/>
									<input class="input_style20 marginleft_5" type="text" id="mStndrd" name="mStndrd" placeholder="규격"
										value="<c:out value=" ${pageParm.STNDRD}" />"/>
									<input class="input_style20 marginleft_5" type="text" id="mModel" name="mModel" placeholder="모델명" />
									<input class="input_style20 marginleft_5" type="text" id="mCode" name="mCode" placeholder="코드번호"
										value="<c:out value=" ${pageParm.CODE}" />"/>
									<span class="return_select6">
										<select id="supply" name="supply" style="width:80px;">
											<option value="">선택</option>
											<option value="CR" <c:if test="${pageParm.SUPPLY eq 'CR'}">selected="selected"</c:if>>CTX</option>
											<option value="KB" <c:if test="${pageParm.SUPPLY eq 'KB'}">selected="selected"</c:if>>TNET
											</option>
											<option value="DS" <c:if test="${pageParm.SUPPLY eq 'DS'}">selected="selected"</c:if>>KTH</option>
										</select>
									</span>
									<span class="inquiry_btn marginleft_7">
										<span class="sButton btn_span fs-13 blue search" id="itemSearch" style="float: right;">조회</span>
									</span>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>
		<iframe id="sFrame" name="sFrame" style="width: 100%;height:675px;"></iframe>
		<iframe id="lgFrame" name="lgFrame" style="width: 100%;height:0%; display:none;"></iframe>