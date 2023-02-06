<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript">
		$(function(){
			_BT.setGroupCheck("clickAll", "agree");
			$(".chk").on("click", function() {
				if(_BT.isChecked("click01") && _BT.isChecked("click02")){
					$("#btnNext").addClass("bOn");
				}else{
					$("#btnNext").removeClass("bOn");
				}					
			});
		});
		function fnNextStep() {
			if(!_BT.isChecked("click01", "이용 약관에 대한 동의를 해 주세요.")) return false;
			if(!_BT.isChecked("click02", "개인정보 수집 및 이용에 대한 동의를 해 주세요.")) return false;
			
			if(_BT.isChecked("click03")) 
				$("#adAgreeYN").val("Y");
			else
				$("#adAgreeYN").val("N");
			_BT.actFormSubmit("frm", "POST", _BT.SHOP.URL.Join.bStep2); 
		}
	</script>

	<div class="wid_1248">
		<div class="ad_content01 margintop_20">
			<img src="${staticRoot}/img/ad/m_ad_img001.jpg " alt="광고배너">
		</div>
		<div class="container">
			<div class="section center_content">
				<form id="frm" name="frm">
					<input type="hidden" id="adAgreeYN" name="adAgreeYN" value=""/>
<%--
					<h1 class="title_Type03">
						회원 가입
						<div class="sub_location">
							<div class="list_location01">
								<a href="javascript:;" onclick="_BT.moveUrl(_BT.SHOP.URL.Common.Main);" class="home">HOME</a>
								<span class="arrow"><img src="${staticRoot}/img/bl_01.jpg" alt="" /></span>
								<span class="txt01">회원</span>
								<span class="arrow"><img src="${staticRoot}/img/bl_01.jpg" alt="" /></span>
								<span class="last_txt">회원 가입</span>
							</div>
						</div>
					</h1>
--%>				
					<div class="provision_content">
						<div class="join_content_tab">
							<a href="javascript:;" class="on">
								약관동의
							</a>
							<a href="javascript:;">
								회원가입
							</a>
							<a href="javascript:;">
								정보입력
							</a>
						</div>
						<div class="margintop_20">
							<div class="signup_box">
								<p>
									제 1 장 총 칙<br/><br/>
	
									제 1 조 (목적)<br/><br/>
	
	
									이 약관은 대화 주식회사(이하 "회사"라 합니다)가 운영, 제공하는 대화 및 관련 제반 서비스(이하 "서비스")의 이용과 관련하여 회사와 회원과의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.<br/><br/>
	
									제 2 조 (용어의 정의)<br/><br/>
	
	
									이 약관에서 사용하는 용어의 정의는 다음 각 호와 같으며, 정의되지 않은 용어에 대한 해석은 관계 법령과 회사의 이용약관 및 개인정보취급방침, 회사가 별도로 정한 지침 등의 상관례에 의합니다.<br/><br/>
	
									"서비스"라 함은 회사가 웹과 모바일 환경에서 제공하는 대화 서비스 및 관련 제반 서비스를 말합니다.<br/><br/>
	
									"회원"이라 함은 회사의 "서비스"에 접속하여 이 약관에 따라 "회사"와 이용계약을 체결하고 "회사"가 제공하는 "서비스"를 이용하는 고객을 말합니다.<br/><br/>
	
									"판매자"라 함은 "서비스"에 본인의 재화 및 용역(이하"아이템"이라함) 을 등록하여 판매하거나 또는 제공할 의사로 서비스를 이용하는 자를 말합니다.<br/><br/>
	
									"아이디"라 함은 "회원"의 식별과 "서비스" 이용을 위하여 "회원"이 설정한 전화번호를 말합니다.<br/><br/>
	
									"비밀번호"라 함은 "회원"이 부여받은 "아이디"와 일치되는 "회원"임을 확인하고 비밀보호를 위해 "회원" 자신이 정한 문자 또는 숫자의 조합을 의미합니다.<br/><br/>
	
									"유료서비스"라 함은 "회사"가 유료로 제공하는 각종 온라인디지털콘텐츠(각종 정보콘텐츠, VOD, 아이템 기타 유료콘텐츠를 포함), 통계자료 및 제반 서비스를 의미합니다.<br/><br/>
	
									"크레딧"이라 함은 "서비스"의 효율적 이용을 위해 회사가 임의로 책정 또는 지급, 조정할 수 있는 재산적 가치가 없는 "서비스" 상의 가상 데이터를 의미합니다.<br/><br/>
	
									"게시물"이라 함은 "회원"이 "서비스"를 이용함에 있어 "서비스상"에 게시한 문자, 음성, 음향, 화상, 동영상 등의 정보 형태의 글, 사진, 동영상 및 각종 파일과 링크 등을 의미합니다.<br/><br/>
	
									"장소정보"라 함은 모바일 단말기의 WPS(WiFi Positioning System), GPS 기반으로 추출된 좌표를 이용하여 "회사" 또는 "회원"이 생성한 지점의 정보를 의미합니다.<br/><br/>
	
									"애플리케이션"이라 함은 모바일 단말기에서 "서비스"를 설치하여 이용할 수 있도록 구성된 프로그램을 말합니다.<br/><br/>
	
									"개인정보"라 함은 '정보통신망 이용촉진 및 정보보호에 관한 법률'(이하 "정보통신망법") 제2조 제1항 제6호 '개인정보'를 말합니다.<br/><br/>
	
									"회원정보"라 함은 제13항과 제14항의 정보를 통칭합니다.<br/><br/>
	
									제 3 조 (약관의 명시, 효력 및 변경)<br/><br/>
	
	
									"회사"는 이 약관의 내용을 "회원"이 쉽게 알 수 있도록 서비스 초기 화면에 게시합니다.<br/><br/>
	
									"회사"는 '약관의 규제에 관한 법률'(이하 "약관법"), ‘전자상거래 등에서의 소비자보호에 관한 법률(이하 "전자상거래법")’, ‘정보통신망법’ 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.<br/><br/>
	
									"회사"가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 제1항의 방식에 따라 그 개정약관의 적용일자 7일 전부터 공지합니다. 다만, "회원"에게 불리한 내용으로 약관을 개정하는 경우에는 그 적용일자 30일 전부터 공지 외에 "회원정보"에 등록된 이메일 등 전자적 수단을 통해 별도로 명확히 통지하도록 합니다.<br/><br/>
	
									"회사"가 전항에 따라 "회원"에게 통지하면서 공지 기간 이내에 거부의사를 표시하지 않으면 승인한 것으로 본다는 뜻을 명확하게 고지하였음에도 회원이 명시적으로 거부의사를 밝히지 않거나, "서비스"를 이용할 경우에는 "회원"이 개정약관에 동의한 것으로 봅니다.<br/><br/>
	
									"회원"이 개정약관에 동의하지 않는 경우 "회사"는 개정약관의 내용을 적용할 수 없으며, 이 경우 회원은 제9조 제1항의 규정에 따라 이용계약을 해지할 수 있습니다.<br/><br/>
	
									제 4 조 (약관의 해석)<br/><br/>
	
	
									"회사"는 개별 서비스에 대해서 별도의 이용약관 및 정책(이하 "기타 약관 등")을 둘 수 있으며, 해당 내용이 이 약관과 상충할 경우에는 "기타 약관 등"이 우선하여 적용됩니다.<br/><br/>
	
									이 약관에 명시되지 않은 사항은 "위치정보보호법", "약관법", "전자상거래법", 공정거래위원회가 정하는 전자상거래 등에서의 소비자보호지침 및 관계 법령 또는 상관례에 따릅니다.<br/><br/>
	
									제 2 장 계약의 체결 및 관리<br/><br/>
	
									제 5 조 (이용계약의 체결)<br/><br/>
	
	
									이용계약은 "회원"이 되고자 하는 자(이하 "가입신청자")가 약관의 내용에 대하여 동의를 한 후 회원가입신청을 하고 "회사"가 이러한 신청에 대하여 승낙함으로써 체결됩니다.<br/><br/>
	
									"회사"는 "가입신청자"의 신청에 대하여 서비스 이용을 승낙함을 원칙으로 합니다. 다만, "회사"는 다음 각 호에 해당하는 신청에 대하여는 승낙을 하지 않거나, 사후에 이용계약을 해지할 수 있습니다.<br/><br/>
	
									가입신청자가 이 약관에 의하여 이전에 회원자격을 상실한 적이 있는 경우<br/><br/>
	
									타인의 명의를 도용하여 이용신청을 하는 경우<br/><br/>
	
									허위의 정보를 기재하거나, 회사가 제시하는 내용을 기재하지 않은 경우<br/><br/>
	
									14세 미만 아동이 정보통신망 이용촉진 및 정보보호 등에 관한 법률에서 정한 "개인정보" 입력 시 법정대리인(부모 등)의 동의를 얻지 아니한 경우<br/><br/>
	
									이용자의 귀책사유로 인하여 승인이 불가능하거나 기타 규정한 제반 사항을 위반하며 신청하는 경우<br/><br/>
	
									"회원"이 "유료서비스"를 이용하는 경우 이용대금을 납부한 후 서비스를 이용하는 것을 원칙으로 하며, 유료서비스 이용계약 성립시기는 "구매완료"를 신청절차 상에서 표시한 시점으로 합니다.<br/><br/>
	
									"회사"는 만 20세 미만의 미성년회원이 "유료서비스"를 이용하고자 하는 경우에 부모 등 법정대리인의 동의를 얻거나, 계약체결 후 추인을 얻지 않으면 미성년자 본인 또는 법정대리인이 그 계약을 취소할 수 있다는 내용을 계약체결 전에 고지하는 조치를 취합니다.<br/><br/>
	
									"회사"는 서비스관련설비의 여유가 없거나, 기술상 또는 업무상 문제가 있는 경우에는 승낙을 유보할 수 있습니다.<br/><br/>
	
									제2항과 제3항에 따라 회원가입신청의 승낙을 하지 아니하거나 유보한 경우, "회사"는 원칙적으로 이를 "가입신청자"에게 알리도록 합니다.<br/><br/>
	
									이용계약의 성립 시기는 "회사"가 가입완료를 신청절차 상에서 표시한 시점으로 합니다.<br/><br/>
	
									"회사"는 "회원"에 대해 회사정책에 따라 등급별로 구분하여 이용시간, 이용횟수, 서비스 메뉴 등을 세분하여 이용에 차등을 둘 수 있습니다.<br/><br/>
	
									"회사"는 "회원"에 대하여 '영화 및 비디오물의 진흥에 관한 법률' 및 '청소년보호법' 등에 따른 등급 및 연령 준수를 위해 이용제한이나 등급별 제한을 할 수 있습니다.<br/><br/>
	
									제 6 조 ("회원정보"의 변경)<br/><br/>
	
	
									"회원"은 개인정보관리화면을 통하여 언제든지 본인의 "개인정보"를 열람하고 수정할 수 있습니다. 다만, 서비스 관리를 위해 필요한 "아이디" 등은 수정이 불가능합니다.<br/><br/>
	
									"회원"은 회원가입신청 시 기재한 사항이 변경되었을 경우 온라인으로 수정을 하거나 전자우편 기타 방법으로 "회사"에 대하여 그 변경사항을 알려야 합니다.<br/><br/>
	
									제2항의 변경사항을 "회사"에 알리지 않아 발생한 불이익에 대하여 "회사"는 책임지지 않습니다.<br/><br/>
	
									제 7 조 ("회원"의 "아이디" 및 "비밀번호"의 관리에 대한 의무)<br/><br/>
	
	
									"회원"의 "아이디"와 "비밀번호"에 관한 관리책임은 "회원"에게 있으며, 이를 제3자가 이용하도록 하여서는 안 됩니다.<br/><br/>
	
									"회사"는 "회원"의 "아이디"가 개인정보 유출 우려가 있거나, 반사회적 또는 미풍양속에 어긋나거나 회사 및 회사의 운영자로 오인한 우려가 있는 경우, 해당 "아이디"의 이용을 제한할 수 있습니다.<br/><br/>
	
									"회원"은 "아이디"및 "비밀번호"가 도용되거나 제3자가 사용하고 있음을 인지한 경우에는 이를 즉시 "회사"에 통지하고 "회사"의 안내에 따라야 합니다.<br/><br/>
	
									제3항의 경우에 해당 "회원"이 "회사"에 그 사실을 통지하지 않거나, 통지한 경우에도 "회사"의 안내에 따르지 않아 발생한 불이익에 대하여 "회사"는 책임지지 않습니다.<br/><br/>
	
									제 8 조 (이용제한 등)<br/><br/>
	
	
									"회사"는 "회원"이 이 약관의 의무를 위반하거나 "서비스"의 정상적인 운영을 방해한 경우, 경고, 일시정지, 영구이용정지 등으로 "서비스" 이용을 단계적으로 제한할 수 있습니다.<br/><br/>
	
									"회사"는 전항에도 불구하고, '주민등록법'을 위반한 명의도용 및 결제도용, '저작권법' 및 '컴퓨터 프로그램 보호법'을 위반한 불법프로그램의 제공 및 운영방해, "정보통신망법"을 위반한 불법통신 및 해킹, 악성프로그램의 배포, 접속권한 초과행위 등과 같이 관련법을 위반한 경우에는 즉시 영구이용정지를 할 수 있습니다. 본 항에 따른 영구이용정지 시 "서비스" 이용을 통해 획득한 "크레딧" 및 기타 혜택 등도 모두 소멸되며, "회사"는 이에 대해 별도로 보상하지 않습니다.<br/><br/>
	
									"회사"는 "회원"이 계속해서 3개월 이상 로그인하지 않는 경우, "회원정보"의 보호 및 운영의 효율성을 위해 이용을 제한할 수 있습니다.<br/><br/>
	
									"회사"는 본 조의 이용제한 범위 내에서 제한의 조건 및 세부내용은 이용제한정책 및 개별 서비스상의 운영정책에서 정하는 바에 의합니다.<br/><br/>
	
									본 조에 따라 "서비스" 이용을 제한하거나 계약을 해지하는 경우에 "회사"는 제30조("회원"에 대한 통지)에 따라 "회원"에게 통지합니다.<br/><br/>
	
									"회원"은 본 조에 따른 이용제한 등에 대해 "회사"가 정한 절차에 따라 이의신청을 할 수 있습니다. 이 때 이의가 정당하다고 "회사"가 인정하는 경우 "회사"는 즉시 "서비스"의 이용을 재개합니다.<br/><br/>
	
									제 9 조 (계약해제, 해지 등)<br/><br/>
	
	
									"회원"은 언제든지 서비스초기화면의 고객센터 또는 내 정보 관리 메뉴 등을 통하여 이용계약 해지 신청을 할 수 있으며, "회사"는 관련법 등이 정하는 바에 따라 이를 즉시 처리하여야 합니다.<br/><br/>
	
									"회원"이 계약을 해지할 경우, 관련법 및 개인정보취급방침에 따라 "회사"가 회원정보를 보유하는 경우를 제외하고는 해지 즉시 "회원"의 모든 데이터는 소멸됩니다.<br/><br/>
	
									"회원"이 계약을 해지하는 경우, "회원"이 작성한 "게시물" 중 메일, 블로그 등과 같이 본인 계정에 등록된 게시물 일체는 삭제됩니다. 다만, 타인에 의해 담기, 스크랩 등이 되어 재게시되거나, 공용게시판에 등록된 "게시물" 등은 삭제되지 않으니 사전에 삭제 후 탈퇴하시기 바랍니다.<br/><br/>
	
									제 3 장 서비스 이용<br/><br/>
	
									제 10 조 ("서비스"의 이용)<br/><br/>
	
	
									"회사"는 "회원"의 이용신청을 승낙한 때부터 즉시 "서비스"를 개시하며, "서비스"는 연중무휴, 1일 24시간 제공함을 원칙으로 합니다.<br/><br/>
	
									"회사"는 "서비스"를 일정범위로 분할하여 각 범위 별로 이용가능시간을 별도로 지정할 수 있습니다. 다만, 이러한 경우에는 그 내용을 사전에 공지합니다.<br/><br/>
	
									"회사"는 컴퓨터 등 정보통신설비의 보수점검, 교체 및 고장, 통신두절 또는 운영상 상당한 이유가 있는 경우 "서비스"의 제공을 일시적으로 중단할 수 있습니다. 이 경우 "회사"는 제30조("회원"에 대한 통지)에 정한 방법으로 "회원"에게 통지합니다. 다만, "회사"가 사전에 통지할 수 없는 부득이한 사유가 있는 경우 사후에 통지할 수 있습니다.<br/><br/>
	
									"회사"는 서비스의 제공에 필요한 경우 정기점검을 실시할 수 있으며, 정기점검시간은 서비스제공화면 등에 공지한 바에 따릅니다.<br/><br/>
	
									"회사"는 모바일 단말기 전용 "애플리케이션"을 무료로 제공하며, "회원"은 "회사"에서 제공하는 범위 내의 단말기에 전용 "애플리케이션"을 다운로드 및 설치하여 "서비스"를 이용할 수 있습니다. 다만, 단말의 종류 및 통신사에 따라 "애플리케이션"의 구성과 기능에 차이가 있을 수 있습니다.<br/><br/>
	
									"회원"이 공개한 "게시물"은 "서비스"를 통해 전체 회원, 관련 제반 서비스 및 제휴사에 공유될 수 있습니다.<br/><br/>
	
									“회원” 은 등록한 제품의 정보를 “회사”가 설정한 ‘가격제안단계’ 전에, 삭제는 가능하며, 수정은 불가능 합니다. “회사”가 “회원”의 요청으로 등록제품을 삭제함과 동시에 계약은 해지됩니다.<br/><br/>
	
									제 11 조 ("서비스"의 내용)<br/><br/>
	
	
									광고서비스<br/><br/>
	
									유료서비스 : 회사가 유료로 제공하는 각종 온라인디지털콘텐츠(각종 정보콘텐츠, VOD, 아이템 기타 유료콘텐츠를 포함), 제반 서비스 및 기타 물품등록서비스 또는 거래 관련 서비스를 의미합니다.<br/><br/>
	
									물품거래 서비스 : 회사가 제공하는 인터넷 사이트 (www.withsellit.com) , 어플리케이션(대화 등) 및 서비스를 통하여 회원 상호간에 물품매매거래가 이루어질 수 있는 사이버 거래장소(사이버 거래장소 marketplace)를 온라인으로 제공하는 서비스 및 관련 부가서비스 일체를 말합니다.<br/><br/>
	
									정보 서비스: 회사가 각 회원에 대한 판매정보, 구매정보, 신용도, 회원정보 등 회원의 물품기록을 모아 각 회원이 물품거래서비스를 신속하고 편리하게 이용하도록 하기 위하여 제공하는 서비스를 말합니다.<br/><br/>
	
									장소정보서비스: "회원"은 "위치정보"를 이용하여 스스로 "장소정보"를 생성하거나, "회사"가 제공한 "장소정보"와 결합하여 또는 "장소정보"와의 결합없이 독립적으로 글과 사진 등의 "게시물"을 등록할 수 있으며, 등록 내용에 대한 공개 여부를 사전에 설정할 수 있습니다.<br/><br/>
	
									기타 정보 서비스: 물품 서비스 이외에 회사가 제공하는 서비스를 통하여 회원에게 온라인으로 제공하는 정보서비스, 부동산 정보, 자동차정보, 커뮤니티등의 인터넷 서비스를 말합니다.<br/><br/>
	
									거래 활성화 서비스 기타<br/><br/>
	
									외부 및 내부 SNS로 대화의 물품 및 회원의 정보(거래정보, 댓글쓰기,찜,기타 거래 시도 활동 등) 가 공유되어 잠재적인 거래자가 접근할 수 있는 방법을 제공하는 서비스 및 관련 부가서비스 일체를 말합니다.<br/><br/>
	
									회원의 계정정보 또는 회원정보를 활용하여 친구를 추천하는 서비스<br/><br/>
	
									회원의 활동정보(사진 올리기, 좋아요 남기기, 기타 게시물 작성 등)의 수집 및 통계 서비스<br/><br/>
	
									회사의 대화 플랫폼을 활용하는 소셜게임, 인터렉티브이북, 라이브방송앱 등과의 연동 서비스<br/><br/>
	
									기타 회사가 추가 개발하거나 다른 회사와의 제휴계약 등을 통해 회원에게 제공하는 일체의 서비스<br/><br/>
	
									제 12 조 ("서비스"의 요금)<br/><br/>
	
	
									"회사"가 제공하는 "서비스"는 별도의 약정이 없는 한 무료로 제공됩니다.<br/><br/>
	
									"회사"는 "유료서비스" 이용요금을 회사와 계약한 전자지불업체에서 정한 방법에 의하거나 회사가 정한 청구서에 합산하여 청구할 수 있습니다.<br/><br/>
	
									"유료서비스" 이용을 통하여 결제된 대금에 대한 취소 및 환불은 "회사"의 결제 이용약관에 따릅니다.<br/><br/>
	
									"회원"의 개인정보도용 및 결제사기로 인한 환불요청 또는 결제자의 개인정보 요구는 법률이 정한 경우 외에는 거절될 수 있습니다.<br/><br/>
	
									무선 서비스 이용 시 발생하는 데이터 통신료는 별도이며, 가입한 각 이동통신사의 정책에 따릅니다.<br/><br/>
	
									MMS로 게시물을 등록할 경우 발생하는 요금은 이동통신사의 정책에 따릅니다.<br/><br/>
	
									제 13 조 ("서비스"의 변경 및 중지)<br/><br/>
	
	
									"회사"는 상당한 이유가 있는 경우에 운영상, 기술상의 필요에 따라 제공하고 있는 전부 또는 일부 "서비스"를 제한, 변경하거나 중지할 수 있습니다.<br/><br/>
	
									"회사"는 제1항에 의한 서비스 중단의 경우에 인터넷 등에 사전 공지하거나 제30조("회원"에 대한 통지)에 정한 방법으로 "회원"에게 통지합니다.<br/><br/>
	
									"서비스"의 내용, 이용방법, 이용시간에 대하여 변경이 있는 경우에는 변경사유, 변경될 서비스의 내용 및 제공일자 등은 그 변경 전에 해당 서비스 초기화면에 게시하여야 합니다.<br/><br/>
	
									"회사"는 무료로 제공되는 서비스의 일부 또는 전부를 회사의 정책 및 운영의 필요상 수정, 중단, 변경할 수 있으며, 이에 대하여 관련법에 특별한 규정이 없는 한 "회원"에게 별도의 보상을 하지 않습니다.<br/><br/>
	
									제 14 조 (정보의 제공 및 광고의 게재)<br/><br/>
	
	
									"회사"는 "회원"이 "서비스" 이용 중 필요하다고 인정되는 다양한 정보를 대화 소식이나 전자우편 등의 방법으로 "회원"에게 제공할 수 있습니다. 다만, "회원"은 관련법에 따른 거래관련 정보 및 고객문의 등에 대한 답변 등을 제외하고는 언제든지 전자우편에 대해서 수신 거절을 할 수 있습니다.<br/><br/>
	
									"회사"는 "서비스"의 운영과 관련하여 서비스 화면, 홈페이지, 전자우편 등에 광고를 게재할 수 있습니다. 광고가 게재된 전자우편을 수신한 "회원"은 수신거절을 할 수 있습니다.<br/><br/>
	
									"이용자(회원, 비회원 포함)"는 회사가 제공하는 서비스와 관련하여 게시물 또는 기타 정보를 변경, 수정, 제한하는 등의 조치를 취하지 않습니다.<br/><br/>
	
									제 15 조 ("게시물"의 저작권)<br/><br/>
	
	
									"이용자"는 저작권 관련 규정을 준수하기 위해 충분한 주의를 기울여야만 합니다. 만약 "이용자"가 등록한 게시물이 제 3자의 저작권을 침해한 경우, 민형사상 모든 책임은 "이용자" 당사자에게 있으며, 이와 관련해서 회사는 어떠한 책임도 지지 않습니다.<br/><br/>
	
									이용자"는 "대화"을 이용함으로써 얻은 정보 중 "회사"에게 지적재산권이 귀속된 정보를 "회사"의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제 3자에게 이용하게 하여서는 안됩니다.<br/><br/>
	
									"회사"는 "회원"이 작성한 각종 게시물을 판촉, 홍보 등의 목적으로 타 사이트에 복제, 배포, 전송, 전시할 수 있으며, 본질적인 내용에 변경을 가하지 않는 범위 내에서 수정, 편집될 수 있습니다.<br/><br/>
	
									"회사"가 작성한 저작물에 대한 저작권 및 기타 지적 재산권은 "회사"에 귀속합니다.<br/><br/>
	
									제 16 조 ("게시물"의 관리)<br/><br/>
	
	
									"회원"의 "게시물"이 "전자상거래법", "정보통신망법" 및 "저작권법"등 관련법에 위반되는 내용을 포함하는 경우, 권리자는 관련법이 정한 절차에 따라 해당 "게시물"의 게시중단 및 삭제 등을 요청할 수 있으며, "회사"는 관련법에 따라 조치를 취하여야 합니다.<br/><br/>
	
									"회사"는 전항에 따른 권리자의 요청이 없는 경우라도 권리침해가 인정될 만한 사유가 있거나 기타 회사 정책 및 관련법에 위반되는 경우에는 관련법에 따라 해당 "게시물"에 대해 임시조치 등을 취할 수 있습니다.<br/><br/>
	
									본 조에 따른 세부절차는 "전자상거래법", "정보통신망법" 및 "저작권법"이 규정한 범위 내에서 "회사"가 정한 "게시중단요청서비스"에 따릅니다.<br/><br/>
	
									제 17 조 (권리의 귀속)<br/><br/>
	
	
									"서비스"에 대한 저작권 및 지적재산권은 "회사"에 귀속됩니다. 단, "회원"의 "게시물" 및 제휴계약에 따라 제공된 저작물 등은 제외합니다.<br/><br/>
	
									"회사"는 서비스와 관련하여 "회원"에게 "회사"가 정한 이용조건에 따라 계정, "아이디", 콘텐츠, "크레딧" 등을 이용할 수 있는 이용권만을 부여하며, "회원"은 이에 대한 양도, 판매, 담보제공 등의 처분행위를 할 수 없습니다.<br/><br/>
	
									제 18 조 ("애플리케이션"의 이용)<br/><br/>
	
	
									"회원"은 모바일 단말기 제조사 및 이동통신사에서 제공하는 유무선 애플리케이션 마켓 혹은 "서비스"의 다운로드 페이지를 통해 "애플리케이션"을 설치하여 서비스를 이용할 수 있습니다.<br/><br/>
	
									"회원"이 "서비스"의 일부 또는 이용규칙을 적용하는 데에 사용되는 보안 기술이나 소프트웨어를 회피 또는 변경하려 시도를 하거나 부정 사용 및 타인이 그렇게 하는 것을 조장하는 행위 등은 금지되어 있으며, 만약 "회원"이 그와 같은 행위를 하는 경우 이에 대한 모든 책임은 "회원" 본인에게 있습니다.<br/><br/>
	
									제 19 조 ("크레딧")<br/><br/>
	
	
									"회사"는 서비스의 효율적 이용 및 운영을 위해 사전 공지 후 "크레딧"의 일부 또는 전부를 조정할 수 있으며, "크레딧"은 회사가 정한 기간에 따라 주기적으로 소멸할 수 있습니다.<br/><br/>
	
									제 20 조 ("대리행위의 부인")<br/><br/>
	
	
									"회사"는 효율적인 서비스를 위한 시스템 운영 및 관리 책임만을 부담하며, 재화 또는 용역의 거래와 관련하여 구매자 또는 판매자를 대리하지 아니하고, 회원 사이에 성립된 거래 및 회원이 제공하고 등록한 정보에 대해서는 해당 회원이 그에 대한 모든 책임을 부담하여야 합니다.<br/><br/>
	
									제 21 조 ("보증의 부인")<br/><br/>
	
	
									"회사"는 회사가 제공하는 시스템을 통하여 이루어지는 구매자와 판매자 간의 거래와 관련하여 판매의사 또는 구매의사의 존부 및 진정성, 등록물품의 품질, 완전성, 안전성, 적법성, 및 타인의 권리에 대한 비침해성, 구매자 또는 판매자가 입력하는 정보 및 그 정보를 통하여 링크된 URL에 게재된 자료의 진실성 또는 적법성 등 일체에 대하여 보증하며, 판매자가 제품의 정보를 고의적으로 속일경우에는 모든 책임은 판매자에게 있습니다.<br/><br/>
	
									제 22 조 (물품 거래서비스의 성질과 목적)<br/><br/>
	
	
									물품거래서비스는 회사가 회원 각자의 자기결정에 의하여 회원 상호간에 물품매매거래가 이루어질 수 있도록 사이버 거래장소(marketplace)를 온라인으로 제공하는 것입니다.<br/><br/>
	
									회사는 회원에게 물품을 판매하거나 회원으로부터 물품을 구매하지 않으며, 단지 회원간 거래의 안전성 및 신뢰성을 증진시키는 도구만을 제공합니다.<br/><br/>
	
									제 4 장 개인위치정보의 보호<br/><br/>
	
									제 23 조 ("위치정보"의 이용)<br/><br/>
	
	
									"회사"는 "회원"이 이 약관에 동의한 후 모바일 단말기에서 "서비스"에 접속하여 최초 1회 '위치정보이용'에 동의하는 경우 해당 "회원"의 위치정보를 이용합니다.<br/><br/>
	
									제1항과 같이 최초 1회 '위치정보이용'에 동의하지 않은 이용자의 경우 "서비스" 접속 시마다 '위치정보이용' 동의 요청을 할 수 있습니다. 동의하지 않은 이용자의 경우 모바일 단말기에서 정상적인 서비스 이용이 어려울 수 있습니다.<br/><br/>
	
									모바일 단말기로 무선 인터넷을 통해 "서비스"에 접속한 후 '위치정보이용'에 동의한 경우 'WPS(Wifi Positioning System)' 기술을 통해 수집된 "위치정보"를 이용합니다.<br/><br/>
	
									"회사"는 "장소정보" 또는 "회원"이 등록한 "게시물"을 "회원"의 현재 위치를 기반으로 추천하기 위하여 "위치정보"를 이용합니다. 그러나 "회사"는 "회원"이 '위치정보이용'에 동의하지 않은 경우에는 "위치정보"를 이용하지 않습니다.<br/><br/>
	
									"회원"은 언제든지 "서비스"를 탈퇴할 수 있으며, 서비스 탈퇴의 경우 위치정보 이용에 대한 회원의 동의를 철회하는 것으로 간주합니다.<br/><br/>
	
									제 24 조 ("개인위치정보주체"의 권리)<br/><br/>
	
	
									"개인위치정보주체"는 개인위치정보의 이용, 제공에 대한 동의의 전부 또는 일부를 철회할 수 있습니다.<br/><br/>
	
									"개인위치정보주체"는 언제든지 개인위치정보의 이용 또는 제공의 일시적인 중지를 요구할 수 있습니다. 이 경우 "회사"는 요구를 거절하지 아니하며, 이를 위한 기술적 수단을 갖추고 있습니다.<br/><br/>
	
									"개인위치정보주체"는 "회사"에 대하여 아래 자료의 열람 또는 고지를 요구할 수 있고, 당해 자료에 오류가 있는 경우에는 그 정정을 요구할 수 있습니다. 이 경우 "회사"는 정당한 이유없이 요구를 거절하지 아니합니다.<br/><br/>
	
									개인위치정보주체에 대한 위치정보 이용, 제공사실 확인자료<br/><br/>
	
									개인위치정보주체의 개인위치정보가 위치정보의 보호 및 이용 등에 관한 법률 또는 다른 법령의 규정에 의하여 제3자에게 제공된 이유 및 내용<br/><br/>
	
									"회사"는 "개인위치정보주체"가 동의의 전부 또는 일부를 철회한 경우에는 지체 없이 수집된 개인위치정보 및 위치정보 이용제공사실 확인자료(동의의 일부를 철회하는 경우에는 철회하는 부분의 개인위치정보 및 위치정보 이용제공사실 확인자료에 한합니다)를 파기합니다.<br/><br/>
	
									"개인위치정보주체"는 제1항 내지 제3항의 권리행사를 위하여 이 약관 제34조의 연락처를 이용하여 "회사"에 요구할 수 있습니다.<br/><br/>
	
									제 25 조 (법정대리인의 권리)<br/><br/>
	
	
									"회사"는 만 14세 미만 아동으로부터 개인위치정보를 이용 또는 제공하고자 하는 경우에는 만 14세 미만 아동과 그 법정대리인의 동의를 받아야 합니다.<br/><br/>
	
									"회사"는 만 14세 미만의 아동의 개인위치정보 또는 위치정보 이용, 제공사실 확인자료를 이용약관에 명시 또는 고지한 범위를 넘어 이용하거나 제3자에게 제공하고자 하는 경우에는 만 14세 미만의 아동과 그 법정대리인의 동의를 받아야 합니다. 다만, 아래의 경우는 제외합니다.<br/><br/>
	
									위치정보 및 위치기반서비스 등의 제공에 따른 요금정산을 위하여 위치정보 이용, 제공 사실 확인자료가 필요한 경우<br/><br/>
	
									통계작성, 학술연구 또는 시장조사를 위하여 특정 개인을 알아볼 수 없는 형태로 가공하여 제공하는 경우<br/><br/>
	
									법정대리인은 만 14세 미만 아동의 개인위치정보를 이용, 제공에 동의하는 경우 동의유보권, 동의철회권 및 일시중지권, 열람, 고지요구권을 행사할 수 있습니다.<br/><br/>
	
									제 26 조 (만 8세 이하의 아동 등의 보호의무자의 권리)<br/><br/>
	
	
									"회사"는 아래의 경우에 해당하는 자(이하 "만 8세 이하의 아동 등")의 보호의무자가 만 8세 이하의 아동 등의 생명 또는 신체보호를 위하여 개인위치정보의 이용 또는 제공에 동의하는 경우에는 본인의 동의가 있는 것으로 봅니다.<br/><br/>
	
									만 8세 이하의 아동<br/><br/>
	
									금치산자<br/><br/>
	
									'장애인복지법' 제2조 제2항 제2호의 규정에 의한 정신적 장애를 가진 자로서 '장애인고용촉진 및 직업재활법' 제2조 제2호의 규정에 의한 중증장애인에 해당하는 자 (장애인복지법 제29조의 규정에 의하여 장애인등록을 한 자에 한한다)<br/><br/>
	
									만 8세 이하의 아동 등의 생명 또는 신체의 보호를 위하여 개인위치정보의 이용 또는 제공에 동의를 하고자 하는 보호의무자는 서면동의서에 보호의무자임을 증명하는 서면을 첨부하여 회사에 제출하여야 합니다.<br/><br/>
	
									보호의무자는 만 8세 이하의 아동 등의 개인위치정보 이용 또는 제공에 동의하는 경우 개인위치정보주체 권리의 전부를 행사할 수 있습니다.<br/><br/>
	
									제 27 조 (위치정보 이용, 제공사실 확인자료 보유근거 및 보유기간)<br/><br/>
	
	
									"회사"는 위치정보의 보유 및 이용 등에 관한 법률 제16조 제2항에 근거하여 "개인위치정보주체"에 대한 위치정보 이용, 제공사실 확인자료를 위치정보시스템에 자동으로 기록하며, 1년 이상 보관합니다.<br/><br/>
	
									제 28 조 (개인위치정보 제3자 제공시 즉시 통보)<br/><br/>
	
	
									"회사"는 "개인위치정보주체"의 동의 없이 당해 개인위치정보주체의 개인위치정보를 제3자에게 제공하지 아니하며, 제3자 제공 서비스를 제공하는 경우에는 제공 받는 자 및 제공목적을 사전에 "개인위치정보주체"에게 고지하고 동의를 받습니다.<br/><br/>
	
									"회사"는 개인위치정보를 개인위치정보주체가 지정하는 제3자에게 제공하는 경우에는 개인위치정보를 수집한 당해 통신단말장치로 매회 "개인위치정보주체"에게 제공받는 자, 제공일시 및 제공목적을 즉시 통보합니다.<br/><br/>
	
									다만, 아래에 해당하는 경우에는 "개인위치정보주체"가 미리 특정하여 지정한 통신단말장치 또는 전자우편주소 등으로 통보합니다.<br/><br/>
	
									개인위치정보를 수집한 당해 통신단말장치가 문자, 음성 또는 영상의 수신기능을 갖추지 아니한 경우<br/><br/>
	
									개인위치정보주체가 개인위치정보를 수집한 당해 통신단말장치 외의 통신단말장치 또는 전자우편주소 등으로 통보할 것을 미리 요청한 경우<br/><br/>
	
									제 29 조 (위치정보관리책임자의 지정)<br/><br/>
	
	
									"회사"는 "위치정보"를 적절히 관리, 보호하고 "개인위치정보주체"의 불만을 원활히 처리할 수 있도록 실질적인 책임을 질 수 있는 지위에 있는 자를 위치정보관리책임자로 지정해 운영합니다.<br/><br/>
	
									"회사"의 위치정보관리책임자는 이 약관 제34조의 사업자 정보와 같이 지정합니다.<br/><br/>
	
									제 5 장 계약 당사자의 의무와 책임<br/><br/>
	
									제 30 조 ("회원"의 의무)<br/><br/>
	
	
									"회원"은 다음 행위를 하여서는 안 됩니다.<br/><br/>
	
									신청 또는 변경 시 허위내용의 등록<br/><br/>
	
									타인의 정보도용<br/><br/>
	
									"회사"에 게시된 정보의 변경<br/><br/>
	
									"회사"가 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시<br/><br/>
	
									"회사"와 기타 제3자의 저작권 등 지적재산권에 대한 침해<br/><br/>
	
									"회사" 및 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위<br/><br/>
	
									외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 "회사"에 공개 또는 게시하는 행위<br/><br/>
	
									회사의 동의 없이 영리를 목적으로 서비스를 사용하는 행위<br/><br/>
	
									기타 불법적이거나 부당한 행위<br/><br/>
	
									"회원"은 관계법, 본 약관의 규정, 이용안내 및 "서비스"와 관련하여 공지한 주의사항, "회사"가 통지하는 사항 등을 준수하여야 하며, 기타 "회사"의 업무에 방해되는 행위를 하여서는 안 됩니다.<br/><br/>
	
									제 31 조 ("회사"의 의무)<br/><br/>
	
	
									"회사"는 관련법과 이 약관이 금지하거나 미풍양속에 반하는 행위를 하지 않으며, 계속적이고 안정적으로 "서비스"를 제공하기 위하여 최선을 다하여 노력합니다.<br/><br/>
	
									"회사"는 "회원"이 안전하게 "서비스"를 이용할 수 있도록 개인정보(신용정보 포함)보호를 위해 보안시스템을 갖추어야 하며 개인정보보호정책을 공시하고 준수합니다.<br/><br/>
	
									"회사"는 서비스이용과 관련하여 "회원"으로부터 제기된 의견이나 불만이 정당하다고 인정할 경우에는 이를 처리하여야 합니다. 회원이 제기한 의견이나 불만사항에 대해서는 게시판을 활용하거나 전자우편 등을 통하여 "회원"에게 처리과정 및 결과를 전달합니다.<br/><br/>
	
									"회사"는 다음의 사항을 해당 "유료서비스"의 이용초기화면이나 그 포장, FAQ 등에 "회원"이 알기 쉽게 표시합니다.<br/><br/>
	
									유료서비스의 명칭 또는 제호<br/><br/>
	
									유료서비스의 내용, 이용방법, 이용료, 결제방법 기타 이용조건<br/><br/>
	
									이용가능 기기 및 이용에 필요한 최소한의 기술사양<br/><br/>
	
									제 32 조 (개인정보보호 의무)<br/><br/>
	
	
									"회사"는 "정보통신망법" 등 관계 법령이 정하는 바에 따라 "회원"의 "개인정보"를 보호하기 위해 노력합니다. "개인정보"의 보호 및 사용에 대해서는 관련법 및 "회사"의 개인정보보호정책이 적용됩니다. 다만, "회사"의 공식 사이트 및 서비스 외의 링크된 사이트에서는 "회사"의 개인정보보호정책이 적용되지 않습니다.<br/><br/>
	
									"회사"는 대화 플랫폼을 사용하는 연동 서비스 제공을 위해서 "회원"의 명시적인 승인 절차를 통해 "회원정보"를 해당 서비스에 공유할 수 있으며, "회원"은 어플리케이션 및 웹 사이트 개인정보 설정 페이지를 방문하여 본인의 "회원정보"에 접속하는 연동 서비스를 완전히 차단하거나 특정 어플리케이션을 차단할 수 있습니다.<br/><br/>
	
									"회사"는 타사 어플리케이션 및 웹 사이트의 이용약관 및 개인정보보호정책에 대한 보증 및 책임의 의무를 지지 않으며, "회원"은 타사 어플리케이션과 웹 사이트의 정책을 항상 검토하여 해당 어플리케이션이나 웹 사이트가 "회원"의 "회원정보"를 이용하는 방법에 만족하는지 확인해야 합니다.<br/><br/>
	
									제 33 조 ("회원"에 대한 통지)<br/><br/>
	
	
									"회사"가 "회원"에 대한 통지를 하는 경우 이 약관에 별도 규정이 없는 한 "회원"이 지정한 전자우편주소, 서비스 내 전자메모 및 쪽지 등으로 할 수 있습니다.<br/><br/>
	
									"회사"는 "회원" 전체에 대한 통지의 경우 7일 이상 "회사"의 게시판에 게시함으로써 제1항의 통지에 갈음할 수 있습니다.<br/><br/>
	
									제 34 조 (부적절 행위)<br/><br/>
	
	
									"회사"는 "대화"을 이용하는 선량한 "이용자"를 보호하기 위한 목적으로 본 약관에서 명시한 사항들과 관련법령 및 상거래의 일반 원칙을 위반하는 부적절 행위를 행한 "이용자"에게 서비스의 이용에 대한 제재를 가할 수 있으며, 민형사상의 책임까지 물을 수 있습니다.<br/><br/>
	
									"회원"이 다음의 사유에 해당하는 부적절 행위를 한 경우 "회사"는 사전 통보없이 해당 "회원" 이 등록한 내용을 삭제조치하거나, "회원" 자격을 상실시킬수 있습니다.<br/><br/>
	
									"대화"에 허위정보 등록<br/><br/>
	
									거래부적합 아이템 등록<br/><br/>
	
									과대,과장 광고 (스팸성 홍보글, 도배행위 등)<br/><br/>
	
									"회사"의 승인을 구하지 않은 상업성 광고 (개인사업자,법인의 자사홍보등)<br/><br/>
	
									외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 "대화"에 공개 또는 게시하는 행위<br/><br/>
	
									"회사"와 기타 제3자의 저작권 등 지적재산권에 대한 침해<br/><br/>
	
									"회사" 및 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위<br/><br/>
	
									결재부정행위 (타인의 명의나 카드정보,계좌정보 등을 도용하여 회사가 제공하는 구매 서비스를 이용하는 행위는 금지됩니다.)<br/><br/>
	
									회사의 동의 없이 영리를 목적으로 서비스를 사용하는 행위<br/><br/>
	
									시스템의 오류를 회사에 알리지않고 해당 오류를 이용해 이득을 취하는 행위(동일 전화번호로 인증을 반복하여 크레딧을 취하는 행위 등)<br/><br/>
	
									타인의 전화번호 또는 이메일을 도용하거나 허위로 이메일을 기재하여 이득을 취하는 행위<br/><br/>
	
									기타 불법적이거나 부당한 행위<br/><br/>
	
									"회사"가 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시<br/><br/>
	
									기타 "회사"가 필요하다고 판단하는 경우<br/><br/>
	
									제 35 조 (거래 부적합 아이템)<br/><br/>
	
	
									"회사"는 다음에 해당하는 경우에 거래 부적함 아이템으로 간주합니다.<br/><br/>
	
									"회원"이 거래부적함 아이템을 등록할 경우, "회사"는 사전 통보없이 해당 "회원"이 등록한 내용을 삭제조치하고 , "회원"의 자격을 상실시킬 수 있습니다.<br/><br/>
	
									관령 법령 및 법률에 저촉되는 경우<br/><br/>
	
									주류, 담배 및 담배대용품 (전자담배 등)<br/><br/>
	
									마약, 향정신성의약품, 전문의약품, 의료기사법 위반물 (안경, 콘텍트렌즈 등)<br/><br/>
	
									총포 도검 화약류 관련 법률 위반 무기류 , 군복 및 군용물품(주한외국군 포함) , 경찰복 및 경찰장구류<br/><br/>
	
									습득물 및 장물 , 기타 타인의 명의를 도용하는 분실폰, 대포차, 대포폰 등<br/><br/>
	
									본인 또는 타인의 개인정보 거래 (신분증 등 명의거래, 유심칩 단독판매 포함)<br/><br/>
	
									양도 또는 매매가 불가한 상품권, 홍보용으로 부여받은 할인권/ 초대권, 발행자가 통신판매를 금지한 유가증권<br/><br/>
	
									개통 불가폰 거래 (부품폰, 연체폰, 불법복제폰, 선불폰 등)<br/><br/>
	
									화장품 견본품 (샘플 판매금지)<br/><br/>
	
									통신 비밀보호법 위반물 (영상 +음성 가능한 CCTV,핀홀 카메라 등)<br/><br/>
	
									보증서나 감정서가 없는 보석류<br/><br/>
	
									"회사"가 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시<br/><br/>
	
									전문적인 달러 환전으로 인한 상행위<br/><br/>
	
									음란한 사진, 언어, 영상, 신호를 사용하여 성적 수치심을 자극하는 음란 표현물<br/><br/>
	
									각종 불법 성인용품 및 성보조용품, 풍기문란의 소지가 있는 물품<br/><br/>
	
									19세 이상 사용의 이용등급설정을 하지 아니한 각종 청소년유해상품<br/><br/>
	
									지적 재산권(상표권,저작권 등) 타인의 권리를 침해하는 경우<br/><br/>
	
									불법복제품 (국내외 유명브랜드 이미테이션, 짝퉁 등)<br/><br/>
	
									지적재산권이 있어 저작권자의 승인을 받지 않은 경우 (해적판DVD/CD,제본 도서 등)<br/><br/>
	
									초상권 및 성명권 침해, 이미지 도용<br/><br/>
	
									불법 개조품<br/><br/>
	
									정당한 권리 없이 저작권과 그 밖의 법에 의하여 보호되는 기술적 장치를 무력화하는 장치거래 (개조, 복제, 매크로기기 등)<br/><br/>
	
									정부 및 관할 관청으로부터 허가를 받지 않은 경우<br/><br/>
	
									식약청의 허가를 받지 않은 기능성 건강식품 및 다이어트 약, 음식물/ 식품<br/><br/>
	
									보건복지부의 허가를 받지 않은 의료용구 및 의료기기 (물리치료기 등)<br/><br/>
	
									자격증 소지허가를 받지 않은 총포도검류<br/><br/>
	
									동물의약품 (심장사상충 약을 포함한 각종 동물 관련 의약품)<br/><br/>
	
									멸종위기의 야생동, 식물 및 기타 박제류<br/><br/>
	
									기타 전자상거래 또는 통신 판매로 유통, 판매가 금지되어 있거나, 사회 통념상 매매에 부적합 하다고 “회사”가 판단하는 경우<br/><br/>
	
									제 6 장 이용자간 거래<br/><br/>
	
									제 36 조 (거래 신청 및 계약의 성립)<br/><br/>
	
	
									"회사"는 ""대화" 상에서 "회원"이 등록한 아이템에 대하여 "구매자“가 거래를 신청 하더라도 ,"회원"이 회원가입 시 등록한 전화번호, 이메일주소, 카카오톡 ID 등의 연락처 정보를 ”회사“가 제공할 의무는 없습니다.<br/><br/>
	
									"회사"는 "판매자"가 등록한 아이템의 원활한 거래를 위하여 SNS(페이스북,트위터 등) 블로거, 커뮤니티 사이트 등 다양한 홍보채널에 아이템을 노출 할수 있습니다. 다만, "회원"은 홍보채널별 노출 여부를 언제든지 본인의 선택하에 임의로 바꿀 수 있습니다.<br/><br/>
	
									판매 및 구매 등 거래신청에 대한 승낙의 표시가 "회사"와 “구매자” 상호간 합의하에 이루어진 경우, 거래 계약 이 성립한 것으로 봅니다.<br/><br/>
	
									미성년자가 법정대리인의 동의를 얻지 못하고 아이템을 "대화"에 등록해 파는 경우, "회사“는 사전 통보없이 계약을 해지할 수 있습니다.<br/><br/>
	
									“회원” 은 등록한 제품의 정보를 “회사”가 설정한 ‘가격제안단계’ 전에, 삭제는 가능하며, 수정은 불가능 합니다. “회사”가 “회원”의 요청으로 등록제품을 삭제함과 동시에 계약은 해지됩니다.<br/><br/>
	
									제 37 조 (대금결제)<br/><br/>
	
	
									상품의 매매계약은 회원이 판매자가 제시한 상품의 판매 조건에 응하여 청약의 의사표시를 하고 이에 대하여 판매자가 승낙의 의사표시를 함으로써 체결됩니다.<br/><br/>
	
									“회사"는 회원이 현금, 카드 기타의 방법으로 매매 대금을 결제할 수 있는 방법을 제공합니다.<br/><br/>
	
									매매 대금의 결제와 관련하여 구매자가 입력한 정보 및 그 정보와 관련하여 발생한 책임과 불이익은 전적으로 구매자가 부담하여야 합니다.<br/><br/>
	
									상품을 주문한 후 일정 기간 내에 매매대금을 결제하지 않을 경우 회사는 당해 주문을 회원의 동의 없이 취소할 수 있습니다.<br/><br/>
	
									“회사"는 구매자의 상품 매매계약 체결 내용을 구매 내역을 통해 확인할 수 있도록 조치하며, 매매계약의 취소 방법 및 절차를 안내합니다.<br/><br/>
	
									“회사"는 구매자가 매매대금 결제 시 사용한 결제수단에 대해 정당한 사용권한을 가지고 있는지의 여부를 확인할 수 있으며, 이에 대한 확인이 완료될 때까지 거래진행을 중지하거나, 확인이 불가한 해당거래를 취소할 수 있습니다.<br/><br/>
	
									제 38 조 (배송)<br/><br/>
	
	
									배송 소요기간은 입금 또는 대금결제 확인일의 익일을 기산일로 하여 배송이 완료되기까지의 기간을 말합니다.<br/><br/>
	
									“회사"는 판매자에게 구매자의 입금 또는 대금결제에 대한 확인통지를 받은 후 3영업일 이내에 배송에 필요한 조치를 취하도록 권고할 수 있습니다.<br/><br/>
	
									공휴일 및 기타 휴무일 또는 천재지변 등 불가항력적인 사유가 발생한 경우 그 해당기간은 배송 소요기간에서 제외됩니다.<br/><br/>
	
									"회사"는 "이용자"가 아이템을 배송할 수 있는 방법을 제공할 수 있습니다. 다만, 배송과 관련하여 "이용자" 는 최선의 방법으로 배송을 진행해야 하며, 배송에 문제가 발생 시 “회사”에 알려야 할 의무가 있으며, 손해가 발생 했을 시에는 귀책사유를 판단하여 배상을 하여야 합니다.<br/><br/>
	
									“회사"는 배송과 관련하여 판매자와 구매자, 배송업체, 금융기관 등과의 사이에 발생한 분쟁은 당사자들간의 해결을 원칙으로 하며, 회사는 어떠한 책임도 부담하지 않습니다.<br/><br/>
	
									제 39 조 (거래 계약의 해지)<br/><br/>
	
	
									판매 및 구매 등 거래에 있어 해지신청에 대한 승낙의 표시가 "회원"과 “회사” 상호간 합의하에 이루어진 경우, 거래 계약이 해지된 것으로 봅니다.<br/><br/>
	
									“회사”는 “대화” 의 서비스 이용약관에 위배되는 제품, 서비스 사용방법, 판매제품이 설명과 다를 경우에는 사전 통보 없이 계약을 해지 할 수 있습니다.<br/><br/>
	
									또한 “판매자” 가 “회사”가 지정한 배송날짜 안에 제품을 발송하지 않으면 자동 계약 해지될 수 있습니다.<br/><br/>
	
									“구매자” 역시 제한시간 이내 입금을 완료하지 않으면 계약이 해지될 수 있습니다.<br/><br/>
	
									“회원” 은 등록한 제품의 정보를 “회사”가 설정한 ‘가격제안단계’ 전에, 삭제는 가능하며, 수정은 불가능 합니다. “회사”가 “회원”의 요청으로 등록제품을 삭제함과 동시에 계약은 해지됩니다.<br/><br/>
	
									제 40 조 (반품/교환/환불의 적용 배제)<br/><br/>
	
	
									구매자는 다음 각 호의 경우에는 구매자가 환불 또는 교환을 요청할 수 없습니다.<br/><br/>
	
									가. 구매자의 귀책사유로 말미암아 상품이 멸실•훼손된 경우<br/><br/>
	
									나. 구매자의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우<br/><br/>
	
									다. 시간의 경과에 의하여 재판매가 곤란할 정도로 상품의 가치가 현저히 감소한 경우<br/><br/>
	
									라. 복제가 가능한 상품의 포장을 훼손한 경우<br/><br/>
	
									마. 기타 구매자가 환불 또는 교환을 요청할 수 없는 합리적인 사유가 있는 경우<br/><br/>
	
									제 41 조 (구매안전 서비스)<br/><br/>
	
	
									“회사"는 회사에서 이루어지는 선불식 통신판매에 있어서 구매자가 지급하는 결제대금을 예치하고 배송이 완료된 후 재화 또는 용역의 대금을 판매자에게 지급함으로써 구매자의 안전을 도모합니다.<br/><br/>
	
									“회사"는 구매자에게 상품을 공급받은 사실을 재화 등을 공급받은 날로부터 3영업일 이내에 통보하여 주도록 요청합니다.<br/><br/>
	
									“회사"는 구매자가 재화 등을 공급받은 날부터 3영업일이 지나도록 재화 등을 공급받은 사실을 통보하지 아니한 때에는 구매자가 재화 등을 공급받은 것으로 간주하여 판매회원에게 결제대금을 지급할 수 있습니다.<br/><br/>
	
									구매안전 서비스와 관련한 세부적인 사항은 “회사"의 ‘전자금융거래약관’규정을 준용합니다.<br/><br/>
	
									제 42 조 (금지행위)<br/><br/>
	
	
									판매회원은 다음 각 호에 해당하는 행위를 하여서는 아니 되며 이를 위반한 경우 회사는 다음 각 호에서 개별적으로 규정하고 있는 제재조치를 취할 수 있으며, 이로 인하여 삭제된 상품의 기본이용료 및 부가서비스 이용료 등은 환불되지 않습니다.<br/><br/>
	
									1. 허위체결 금지<br/><br/>
	
									1) 허위체결이란 판매자가 상품 노출순위 및 판매자 신용등급 조작, 상품평 조작 등 매출증대를 위해 본인 또는 타인의 ID를 사용하여 판매자 본인의 상품을 구매하는 체결 행위를 말하며, 회사는 이를 금지하고 있습니다.<br/><br/>
	
									2) 허위체결 적발 시 회사는 회원 ID에 대하여 신용점수 차감, 이용제한, 계약해지, 정산금 지급보류(1개월 이내) 등 필요한 조치를 취할 수 있습니다.<br/><br/>
	
									3) 허위체결 적발 시 회사는 사안에 따라 판매회원에게 부가적인 확인 요청 및 자진취소 또는 반품을 요구할 수 있으며, 판매회원은 이에 협조할 의무가 있습니다.<br/><br/>
	
									2. 경매 입찰 조작 금지<br/><br/>
	
									1) 경매 입찰 조작이란 판매회원 자신의 상품을 고가에 낙찰시키기 위하여 부정한 방법으로 경매에 입찰 또는 응찰 하는 행위를 말하며, 회사는 이를 금지하고 있습니다.<br/><br/>
	
									2) 경매 입찰 조작행위 적발 시 회사는 허위체결의 경우에 준하여 신용점수 차감, 거래 제한 등의 조치를 취할 수 있습니다.<br/><br/>
	
									3. 특정 서비스 가입조건 판매 금지<br/><br/>
	
									1) 특정 서비스 가입조건 판매행위란 등록상품, 서비스의 판매 및 광고 이외의 목적으로 상품을 등록하여 판매하는 행위를 말하며, 회사는 이를 금지하고 있습니다.<br/><br/>
	
									예) 인터넷 서비스 가입을 조건으로 하여 일정 금액을 부담하면 지급되는 사은품을 등록하여 판매하는 행위<br/><br/>
	
									2) 해당 거래 적발 시 회사는 해당 제품의 삭제, 신용점수의 불이익 및 판매중지 등의 조치를 취할 수 있습니다.<br/><br/>
	
									4. 중복등록 및 카테고리 위반등록 금지 외<br/><br/>
	
									1) 중복등록이란 동일한 상품을 상품 카테고리에 중복하여 등록하는 것으로서, 회사는 다음과 같은 유형의 중복등록 행위를 금지하고 있습니다.<br/><br/>
	
									동일한 카테고리 및 근접 카테고리를 포함하여 3개 이상의 동일 상품을 등록한 경우<br/><br/>
	
									사은품, 수량, 상품명, 무이자, 적립금 등의 정보가 상이한 동일 상품을 위 1,2항의 방법으로 등록한 경우<br/><br/>
	
									2) 카테고리 위반이란 해당상품과 관계없는 카테고리에 상품을 등록하는 것으로서, 회사는 이를 금지하고 있습니다.<br/><br/>
	
									3) 기타 비정상적인 방법으로 상품을 노출하는 모든 행위를 금지합니다.<br/><br/>
	
									4) 중복등록 및 카테고리 위반등록 적발 시 회사는 적발 횟수에 따라 신용점수 차감, 상품 판매 제한, 판매자 ID중지의 조치를 취할 수 있습니다.<br/><br/>
	
									5. 특정 상점명 사용 금지<br/><br/>
	
									1) 상점명 등록시 회사는 대화과 혼동, 오인의 여지가 있는 모든 명칭 및 문구를 사용하는 것을 금지하고 있습니다.<br/><br/>
	
									2) 회사는 타 판매자의 상점명과 혼동, 오인의 여지가 있는 상점명을 사용하거나, 타 상점명을 포함하여 사용하는 것을 금지하고 있습니다.<br/><br/>
	
									3) 위반 시 회사는 상점명 수정을 요구할 수 있으며, 판매회원은 이에 협조할 의무가 있습니다. 불응 시 등록상품 전체 삭제 등의 조치를 취할 수 있습니다.<br/><br/>
	
									6. 부정키워드 사용금지<br/><br/>
	
									1) 회사는 상품 등록 시 상품리스트 노출을 목적으로 상품명에 아래와 같은 유형의 부정 키워드를 사용하는 것을 금지하고 있습니다.<br/><br/>
	
									타 판매자명, 유사 판매자명을 기재하거나, 타 판매자명을 포함하여 기재하는 경우<br/><br/>
	
									상품명에 해당상품과 무관한 검색키워드를 기재하는 경우<br/><br/>
	
									해당 상품의 정보가 아닌, 검색을 위한 키워드나 홍보문구를 기재하는 경우<br/><br/>
	
									2) 부정키워드 사용 적발 시 회사는 신용점수 차감, 정산기일 조정 및 아래와 같은 제재조치를 취할 수 있습니다.<br/><br/>
	
									1차 발견 시 수정요청<br/><br/>
	
									2차 발견 시 위험도에 따라 키워드 수정, 삭제 및 상품 삭제(신용점수 차감)<br/><br/>
	
									3차 발견 시 위험도에 따라 대화 이용정지, 회원탈퇴 적용.<br/><br/>
	
									7. 제조사, 브랜드, 원산지 위반등록 금지<br/><br/>
	
									1) 판매회원은 상품등록 시 제조사, 브랜드, 원산지를 정확하게 기재하여야 할 의무가 있으며, 이를 위반 시 전자상거래등에서의소비자보호에관한법률에 위반되어 처벌받을 수 있습니다.<br/><br/>
	
									2) 정확한 제조사, 브랜드, 원산지를 표시하지 않은 상품이거나 노출이나 검색을 목적으로 허위 정보를 입력한 상품인 경우, 상품 등록이 거절되거나 제한상품으로 등록되며, 신용점수 차감, 상품삭제, 판매자ID 중지 등의 패널티가 적용될 수 있습니다.<br/><br/>
	
									8. 상표권 침해 금지<br/><br/>
	
									1) 판매회원은 타인의 상표나 로고를 사용할 때 반드시 사전에 해당 권리자에게 문서로써 사용허락을 받아야 합니다. 타인의 등록상표를 허가 받지 않고 무단 사용하는 것은 부정경쟁방지및영업비밀보호에관한법률상의 부정경쟁 행위에 해당되며(부정경쟁방지및영업비밀보호에관한법률 제2조), 상표권 침해의 소지가 있어 그 사용을 금합니다.<br/><br/>
	
									2) 회사는 타인(개인 또는 회사)이 소유한 상표를 무단으로 도용한 이미테이션(모조)상품의 판매를 금지하고 있습니다. 이미테이션 여부를 사전에 고지했는지 여부와 관계없이 모든 이미테이션 제품은 판매가 불가능합니다.<br/><br/>
	
									3) 유명상표를 제목, 키워드, 상품상세설명에 무단으로 도용했을 경우 해당 상품은 상품등록이 거절되거나 제한상픔으로 등록되고, 신용점수 차감, 상품삭제, 판매자ID 중지 등의 패널티가 적용되며, 기본이용료 및 부가서비스 이용료는 환불되지 않습니다.<br/><br/>
	
									9. 저작권 침해 금지<br/><br/>
	
									상품 등록 시 타인이 촬영한 사진, 타인이 창작한 이미지나 문구 등 인간의 사상 또는 감정을 표현한 모든 창작물을 무단으로 사용하는 경우 저작권 침해에 해당하므로 회사는 이를 금지하고 있습니다.<br/><br/>
	
									타인의 저작권을 침해했을 경우 해당 상품은 상품등록이 거절되거나 제한상픔으로 등록되고, 신용점수 차감, 상품삭제, 판매자ID 중지 등의 패널티가 적용되며, 기본이용료 및 부가서비스 이용료는 환불되지 않습니다.<br/><br/>
	
									10. 초상권 및 성명권 침해 금지<br/><br/>
	
									1) 연예인의 사진 및 동영상은 연예인 본인 및 소속 매니지먼트 회사, 해당 광고회사 등에 대한 저작권 또는 초상권 침해에 해당하여 이를 금하고 있습니다.<br/><br/>
	
									잡지 등에 수록된 연예인 사진을 스캔하여 사용하는 경우<br/><br/>
	
									연예인 사진 동영상을 무단으로 사용한 경우<br/><br/>
	
									연예인 이름+스타일'과 같은 문구를 제목, 키워드, 상품상세설명에 무단으로 사용하는 경우<br/><br/>
	
									방송화면을 캡쳐하여 사용한 경우<br/><br/>
	
									2) 초상권 및 성명권 침해 적발 시 해당 상품은 판매 중지됩니다.<br/><br/>
	
									3) 타인의 초상권 및 성명권을 침해했을 경우 해당 상품은 상품등록이 거절되거나 제한상픔으로 등록되고, 신용점수 차감, 상품삭제, 판매자ID 중지 등의 패널티가 적용되며, 기본이용료 및 부가서비스 이용료는 환불되지 않습니다.<br/><br/>
	
									11. 기타 권리침해 행위 금지<br/><br/>
	
									1) 회사는 전3조의 권리 이외에 특허권 등 산업재산권을 침해하는 행위 및 명예 등 타인의 권리를 침해하는 행위를 금지하고 있습니다.<br/><br/>
	
									2) 특허권 등 산업재산권을 침해하는 행위 및 명예훼손 등 타인의 권리를 침해했을 경우 해당 상품은 상품등록이 거절되거나 제한상픔으로 등록되고, 신용점수 차감, 상품삭제, 판매자ID 중지 등의 패널티가 적용되며, 기본이용료 및 부가서비스 이용료는 환불되지 않습니다.<br/><br/>
	
									12. 기타 법령 준수 의무 위반한 상품의 판매 금지행위<br/><br/>
	
									1) 전기용품, 의료기기, 식품, 화장품 등 개별 법령에 의하여 판매에 일정한 자격이 필요한 경우나 상품 자체에 유통을 위한 검증이 필요한 경우에는 관련 법령이 요구하는 조건을 갖추지 아니한 상품의 판매 또는 관련 법령이 요구하는 조건을 갖추지 아니한 판매자의 상품 판매는 금지됩니다.<br/><br/>
	
									2) 법령상 요구되는 준수의무를 다 하지 않은 경우에는 경고의 횟수에 따라 패널티가 부여될 수 있습니다. 다만, 사전 공지 또는 통지가 있은 일부 상품의 경우 아래 경고 횟수와 무관하게 회원 자격이 제한될 수 있습니다.<br/><br/>
	
									13. 청소년 유해 매체물 및 성인대상 판매상품 판매 시 카테고리 준수 의무 등<br/><br/>
	
									판매하고자 하는 상품이 청소년 유해매체물이거나 성인을 대상으로 판매하여야 하는 상품일 경우 성인용품 카테고리에 등록하여야 하며, 일반카테고리에 등록할 경우에는 지정된 카테고리에 이용등급을 반드시 설정하여 등록하여야 합니다. 청소년 유해 매체물에 청소년이 접근할 수 없는 이용등급 등의 지정을 하지 않을 경우 관련 상품은 판매중지 되며, 회원자격을 제한될 수 있습니다.<br/><br/>
	
									청소년 유해 매체물 및 성인대상 판매상품은 다음과 같습니다.<br/><br/>
	
									1) 청소년보호위원회가 청소년에게 유해한 것으로 결정하거나 확인하여 고시한 서적, 음반, 영상, 게임물<br/><br/>
	
									2) 18세 이상 사용가능한 비비탄총<br/><br/>
	
									3) 순수레저용 칼 또는 연장(총포도검화약류등단속법 기준 이하)<br/><br/>
	
									4) 날카로운 조리기구 및 예술용 작업도구<br/><br/>
	
									5) 성인용 스포츠용품 및 격투기용품<br/><br/>
	
									6) 가정용 또는 산업용 연장 및 기자재<br/><br/>
	
									7) 기타 합법적인 성인대상 이색상품<br/><br/>
	
									8) 관리자가 청소년의 접근을 차단할 필요 있다고 판단한 합법적인 판매상품<br/><br/>
	
									제 43 조 (회사의 면책)<br/><br/>
	
	
									가. 회사는 회원들에게 온라인 거래장소를 제공하고 기타 부가정보를 제공함에 그치는 것이므로 물품거래서비스를 통하여 이루어지는 회원 상호간의 거래와 관련된 물품진행의 관리, 거래이행, 물품배송, 청약철회 또는 반품, 물품하자, 이미테이션 물품으로 인한 분쟁해결 등 필요한 사후처리는 거래당사자인 회원들이 직접 수행하여야 합니다. 회사는 이에 대하여 관여하지 않으며 어떠한 책임도 부담하지 않습니다.<br/><br/>
	
									나. 회사는 천재지변 또는 이에 준하는 불가항력, 정보통신설비의 보수점검, 교체 또는 고장, 통신의 두절 등으로 인하여 일시적 또는 종국적으로 서비스를 제공할 수 없는 경우, 서비스 제공에 관한 책임이 면제됩니다. 이 경우 회사는 회사가 제공하는 인터넷사이트 화면에 게시하거나 기타의 방법으로 회원들에게 통지합니다.<br/><br/>
	
									다. 회사는 인터넷 이용자 또는 회원의 귀책사유로 인한 서비스 이용의 장애에 대하여 책임을 지지 않습니다.<br/><br/>
	
									라. 회사는 물품거래서비스를 통하여 거래되는 물품의 하자, 물품등록정보의 오류, 미비 , 가짜 상품 등으로 인하여 회원이 입는 손해에 대해서는 책임(제조물책임 포함)을 지지 않습니다.<br/><br/>
	
									마. 회사는 회원이 다른 회원이 게재한 정보, 자료, 사실의 정확성 등을 신뢰함으로써 입은 손해에 대하여 책임을 지지 않습니다. 즉, 회사는 전소법 제20조 제4항에 의거하여 판매회원의 정보를 열람할 수 있는 방법을 구매자에게 제공할 수 있으며, 판매회원은 당해 정보를 기재하지 아니하거나, 허위로 기재함으로써 발생하는 모든 책임을 부담하여야 합니다.<br/><br/>
	
									바. 회사와 피연결회사(회사의 서비스 화면과 링크 등으로 연결된 사이트를 운영하는 회사를 말합니다)는 독자적으로 운영되며, 회사는 피연결회사와 회원간에 이루어진 거래에 대하여는 책임을 지지 않습니다.<br/><br/>
	
									사. 회사는 거래시스템만을 제공할 뿐이며, 거래 내용에 관한 모든 분쟁에 대해서는 당해 거래 당사자가 책임을 져야 합니다.<br/><br/>
	
									아. 회원이 자신의 개인정보를 타인에게 유출 또는 제공함으로써, 발생하는 피해에 대해서 회사는 일체의 책임을 지지 않습니다.<br/><br/>
	
									자. 회사는 제3자가 서비스내 화면 또는 링크된 웹사이트를 통하여 광고한 제품 또는 서비스의 내용과 품질에 대하여 감시할 의무 기타 어떠한 책임도 지지 아니합니다.<br/><br/>
	
									차. 회사및 회사의 임직원 그리고 대리인은 다음과 같은 사항으로부터 발생하는 손해에 대해 책임을 지지 아니합니다.<br/><br/>
	
									1. 회원 상태정보의 허위 또는 부정확성에 기인하는 손해<br/><br/>
	
									2. 그 성질과 경위를 불문하고 "서비스"에 대한 접속 및 "서비스"의 이용과정에서 발생하는 개인적인 손해<br/><br/>
	
									3. 서버에 대한 제3자의 모든 불법적인 접속 또는 서버의 불법적인 이용으로부터 발생하는 손해<br/><br/>
	
									4. 서버에 대한 전송 또는 서버로부터의 전송에 대한 제3자의 모든 불법적인 방해 또는 중단행위로부터 발생하는 손해<br/><br/>
	
									5. 제3자가 "서비스"를 이용하여 불법적으로 전송, 유포하거나 또는 전송, 유포되도록 한 모든 바이러스, 스파이웨어 및 기타 악성 프로그램으로 인한 손해<br/><br/>
	
									6. 전송된 데이터의 오류 및 생략, 누락, 파괴 등으로 발생되는 손해<br/><br/>
	
									7. 회원간의 "회원" 상태정보 등록 및 "서비스" 이용 과정에서 발생하는 명예훼손 기타 불법행위로 인한 각종 민형사상 책임<br/><br/>
	
									8. 회사는 적법한 권리자의 요구가 있는 경우에는 당해 상품 및 용역 등에 관한 정보를 삭제하거나 수정할 수 있으며, 판매회원은 이로 인한 손해배상을 회사에 청구할 수 없습니다.<br/><br/>
	
									9. 기타 관련 법령 및 회사에서 제공한 이용약관 및 개별약관의 변경, 판매회원 대화 소식 등의 주시의무를 게을리하여 발생한 판매회원의 피해에 대해서 회사는 일절 책임을 지지 않습니다.<br/><br/>
	
									10. 회사는 가짜 상품(일명 짝퉁,SA,이미테이션 등 상표 및 저작권에 문제가 있는 것)을 판매하는 행위를 금지합니다. 즉, 거래 내용에 관한 모든 분쟁에 대해서는 당해 거래 당사자가 책임을 져야 합니다.<br/><br/>
	
									카. 회사는 대화을 기반으로 한 거래시스템만을 제공할 뿐, 판매회원이 등록한 상품 및 용역 등에 관한 정보 또는 구매자와의 거래에 관하여 분쟁이 발생한 경우 회사는 그 분쟁에 개입하지 않으며 그 분쟁의 결과로 인한 모든 책임은 판매회원이 부담합니다. 또한 이와 관련하여 회사가 제3자에게 손해를 배상하거나 기타 비용을 지출한 경우 회사는 판매회원에게 구상권을 행사할 수 있습니다. 단, 회사는 분쟁의 합리적이고 원활한 조정을 위하여 회사가 설치 운영하는 분쟁조정센터(고객센터 포함)를 통하여 예외적으로 당해 분쟁에 개입할 수 있으며, 판매회원은 분쟁조정센터의 결정을 신의칙에 입각하여 최대한 존중해야 합니다.<br/><br/>
	
									제 44 조 (분쟁조정 센터)<br/><br/>
	
	
									가. 회사는 회원 상호간 또는 회원과 제3자 사이의 분쟁을 조정하기 위하여 분쟁조정 센터를 운영 합니다.<br/><br/>
	
									나. 회사가 분쟁조정센터를 통하여 분쟁을 조정할 경우 회사는 제3자의 입장에서 공정하게 분쟁의 조정에 임하여야 합니다.<br/><br/>
	
									다. 분쟁조정센터의 조정에 대하여 회원은 신의칙에 따라 성실히 응하여야 합니다.
								</p>
							</div>
							<div class="signup_agree margintop_10">
								<input type="checkbox" id="click01" class="chk agree"/><label for="click01" class="signup_txt">이용 약관에 대한 동의 (필수)</label>
							</div>
	
							<div class="signup_box margintop_30">
								<p>
									개인정보 수집 및 이용 동의
									<table class="signup_table margintop_50">
										<caption>개인정보 수집 및 이용 동의</caption>
										<colgroup>
											<col width="10%">
											<col width="30%">
											<col width="30%">
											<col width="30%">
										</colgroup>
										<tbody>
											<tr>
												<th>
													구분
												</th>
												<th>
													목적
												</th>
												<th>
													항목
												</th>
												<th>
													보유/이용기간
												</th>
											</tr>
											<tr>
												<td>
													필수
												</td>
												<td>
													회원가입, 이용자 식별, 서비스 이용 및 상담, 부정 이용 방지
												</td>
												<td>
													이름, 이메일, 회원번호, 휴대전화번호, 성별, 생년월일
												</td>
												<td>
													회원 탈퇴 후 5일까지 또는 법령에 따른 보존기간
												</td>
											</tr>
										</tbody>
									</table>
								</p>
							</div>
							<div class="signup_agree margintop_10">
								<input type="checkbox" id="click02" class="chk agree" /><label for="click02" class="signup_txt">개인정보 수집 및 이용에 대한 동의 (필수)</label>
							</div>
							<div class="signup_agree margintop_20">
								<input type="checkbox" id="click03" class="chk agree"/><label for="click03" class="signup_txt">마케팅 정보 알림에 대한동의 (선택)</label>
							</div>
							<div class="signup_agree margintop_20">
								<input type="checkbox" id="clickAll" class="chk"/><label for="clickAll" class="signup_txt">모두동의</label>
							</div>
						</div>
						<div class="btn_content01 margintop_40 marginbottom_20">
							<span id="btnNext" onclick="fnNextStep();" >
								다음
							</span>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>