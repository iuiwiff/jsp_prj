<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--bootstrap 시작-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!--bootstrap 끝-->

<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--jQuery CDN 끝-->

<!-- datepicker 시작-->
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
	$( function() {
		// 기본 사용
		//$( "#datepicker" ).datepicker();
		
		// 옵션 부여
		$( "#datepicker" ).datepicker({
			dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ], 
			dateFormat: "yy-mm-dd",
			monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
			showMonthAfterYear: true
		});
	} );
</script>
<!-- datepicker 끝-->

<style type="text/css">
	.space {
  width: 5px;
  height: auto;
  display: inline-block;
}
</style>

<link rel="stylesheet" href="https://www.sist.co.kr/css/main.css" type="text/css" media="all" />
<link rel="stylesheet" href="https://www.sist.co.kr/css/board.css" type="text/css" media="all" />


<script type="text/javascript">
	
	window.onload=function() {
		// 1. 이벤트에 등록
		document.getElementById('idChk').addEventListener('click', idDupWin);
		
			// 우편번호를 검색하기 위한 이벤트 등록
		document.getElementById('zipcode').addEventListener('click', zipcodeApi);
		document.getElementById('addChk').addEventListener('click', zipcodeApi);
	} // function
	
	function idDupWin() {
		// 부모 창에서 자식 창으로 값 전달: QueryString을 사용하여 전달하고
		// 자식창에서는 JSP 코드로 값을 받는다  
		var id = document.frm.id.value;
		window.open('id_dup.jsp?id=' + id, 'idDup', 
			'width=472, height=340, top=' + (window.screenY + 100) + ', left=' + (window.screenX + 100));	// 첫 번째 파라미터엔 http:// 로 시작하는 값을 줘도 됨
		
		// 2. 팝업창을 띄운다. window.open('들어갈 페이지URL', '창ID', '옵션');
		//window.open('id_dup.jsp', 'idDup', 
		//	'width=472, height=340, top=' + (window.screenY + 100) + ', left=' + (window.screenX + 100));	// 첫 번째 파라미터엔 http:// 로 시작하는 값을 줘도 됨
		
	} // idDupWin
	
	$(function() {
		$("#password2").focusout(function() {
			chkCorrectPw();
		}); // focusout
		$("#btnSubmit").click(function() {
			chkInputAll();
		}); // click
		
	}); // $(document).ready(function() {});
	
	function chkCorrectPw() {
		if($("#password").val() != $("#password2").val()) {
			alert('비밀번호가 다릅니다');
			$("#password").val('');
			$("#password2").val('');
			$("#password").focus();
		} // end if
	} // chkCorrectPw	
	
	function chkInputAll() {
		let flagInputArrAll = true;
		let arrEssential = $(".essential");
		let arrLabel = ['아이디', '비밀번호', '이름', '생일', '휴대폰', '이메일', '우편번호',  '주소', '상세주소']
		
		$.each(arrEssential, function(index, value) {
			if($(value).val() == "") {
				alert(arrLabel[index] + '는 필수 입력입니다');
				flagInputArrAll = false;
				return false;
			} // end if
			//console.log($(value).val());
		});
		
		if(flagInputArrAll && !($("[name='gender']").is(":checked"))) {
			alert('성별은 필수 입력입니다');
			flagInputArrAll = false;
		} // end if
		
		if(flagInputArrAll){
			//location.href = 'http://sist.co.kr';	
			document.frm.submit();
		} // end if
	} // chkInputAll
	
	function resetInputAll() {
		let arrEssential = $("[type='text']");
		$.each(arrEssential, function(index, value) {
			$(value).val('');
		});
		$("[name='gender']").prop("checked", false);
	} // resetInputAll
	
</script>

<!--다음 우편번호 API 시작-->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function zipcodeApi() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("addr0").value = roadAddr;
                document.getElementById("addr1").focus();	// 커서를 상세 주소 input으로 이동
                
                /*
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
                */
            }
        }).open();
    }
</script>
<!--다음 우편번호 API 끝-->


</head>
<body>
<!-- //join -->
<form name="frm" action="member_join_process.jsp" method="post">
	<div class="writeForm">
			<table>
				<colgroup>
					<col class="writeForm_col01" />
					<col width="*" />
				</colgroup>
				<tr>
					<th><label for="id">아이디</label></th>
					<td>
						<input data-value="아이디를 입력해주세요." name="id" id="id" class="inputTxt inputIdtype essential" type="text" maxlength="20"  />
						<div class="space"></div>
						<input type="button" value="ID 중복확인"class="btn btn-outline-dark" id="idChk"/>
					</td>
				</tr>
				<tr>
					<th><label for="password">비밀번호</label></th>
					<td>
						<input data-value="비밀번호를 입력해주세요." name="password" id="password" class="inputPass size02 essential" type="password"  />
						<span class="password_ch"><label for="password2">비밀번호 확인</label></span>
						<input data-value="비밀번호를 입력해주세요." name="password2" id="password2" class="inputPass size02 mmarT10" type="password"  />
						<span>*6~12자의 영문, 숫자, 특수문자 3가지를 조합하여 입력</span>
					</td>
				</tr>
				<tr>
					<th><label for="name">이름</label></th>
					<td>
						<input data-value="이름을 입력해주세요." id="name" name="name" class="inputTxt inputName essential" type="text"  />
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="">생일</label></th>
					<td >
						<!--<input type="text" name="birthday" id="birthday" data-value="생년월일을 입력해 주세요."/>-->
						<input type="text" name="birthday" id="datepicker" class="essential">
						<span id="CalregistdateIcon">
						</span>
					</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>
								
						<input type="text" name="tel" id="tel" value="" data-value="" maxlength="10"  />
								
								
					</td>
				</tr>
				<tr>
					<th>휴대폰</th>
					<td>
								
						<input type="text" name="cell" class="essential" id="cell" value="" data-value="휴대폰 번호를 입력해주세요."  />
						
						<span class="label_wrap"><input type="checkbox" id="Num_check" name="issms" value="1" /><label for="Num_check">수신</label></span>
					</td>
				</tr>
						
				<tr>
					<th><label for="email">이메일</label></th>
					<td class="mail_type">
						<input data-value="이메일을 입력해주세요." name="email1" id="email1" class="inputEmail essential" type="text" maxlength="100"  /><span class="email_txt">@</span>
						<input type="text" list="selecEmail" name="email2" id="email2">
						<datalist class="selecEmail" name="selecEmail" id="selecEmail" data-value="이메일을 선택해주세요.">
							<option value="">선택해주세요.</option>
							<option value='직접 입력'>직접 입력</option>
							<option value='gmail.com'>gmail.com</option>
							<option value='naver.com'>naver.com</option>
							<option value='daum.net'>daum.net</option>
							<option value='nate.com'>nate.com</option>
							<option value='hotmail.com'>hotmail.com</option>
						</datalist>
						<span class="label_wrap"><input type="checkbox" id="Email_check" name="ismail" value="1" /><label for="Email_check">수신</label></span>
					</td>
				</tr>
				<tr>
					<th><label for="gender">성별</label></th>
		 			<td> 
						<input data-value="성별을 선택하세요." name="gender" type="radio" id="radio_check01" value="1" /><label for="radio_check01">남자</label>
		 				<input name="gender" type="radio" id="radio_check02"  value="2"/><label for="radio_check02">여자</label>
		 			</td> 
				</tr> 
				<tr>
					<th><label for="area">소재지</label></th>
					<td>
						<select id="area" name="area">
							<option value="">선택</option>
							<option value="1">서울</option>
							<option value="2">경기</option>
							<option value="3">충남</option>
							<option value="4">충북</option>
							<option value="5">경남</option>
							<option value="6">경북</option>
							<option value="7">전남</option>
							<option value="8">전북</option>
							<option value="8">제주</option>
						</select>
		<!-- 						<input  id="area" name="area" class="inputTxt inputName" type="text" /> -->
					</td>
				</tr>
				<tr>
					<th><label for="zipcode">우편번호</label></th>
					<td>
						<input data-value="우편번호를 입력해주세요." type="text" class="zipcode essential" id="zipcode" name="zipcode" value="" readonly="readonly"/>
						<div class="space"></div>
						<input type="button" value="우편번호검색"class="btn btn-outline-dark" id="addChk"/>
					</td>
				</tr>
				<tr>
					<th><label for="addr0">주소</label></th>
					<td class="addr_td">
						<input data-value="주소를 입력해주세요." type="text" id="addr0" class="addr essential" name="addr0" value="" readonly="readonly"  /><br />
						<input data-value="상세주소를 입력해주세요." type="text" id="addr1" class="addr essential" name="addr1" value="" style="margin-top:7px;"  />
					</td>
				</tr>
			</table>
	</div>
	<div class="writeForm_btn">
		<input type="button" value="확인"class="btn btn-secondary btn-lg" id="btnSubmit"/>
		<div class="space"></div>
		<input type="reset" value="취소"class="btn btn-secondary btn-lg"/>
	</div>
	<input type="hidden" name="email" id="email" value="" />
	<input type="hidden" name="cmd" id="cmd" value="write" />
			<!--<input type="hidden" name="spamkey" value="1712214436243"/> -->
	<input type="hidden" name="spamkey" value="null"/>
</form>
	<!-- text/css -->
</body>
</html>