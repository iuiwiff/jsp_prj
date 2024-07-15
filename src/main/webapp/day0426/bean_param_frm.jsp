<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
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

</script>
<!--다음 우편번호 API 끝-->


</head>
<body>
<!-- //join -->
<form name="frm" method="post" action="bean_param_frm_process.jsp">
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
								
						<input type="text" name="tel" id="tel" value="" onkeyup="isNumberOrHyphen(this);" onblur="cvtUserPhoneNumber(this)" data-value=""  />
								
								
					</td>
				</tr>
				<tr>
					<th>휴대폰</th>
					<td>
								
						<input type="text" name="cell" class="essential" id="cell" value="" onkeyup="isNumberOrHyphen(this);" onblur="cvtUserPhoneNumber(this)" data-value="휴대폰 번호를 입력해주세요."  />
						
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
						<input data-value="우편번호를 입력해주세요." type="text" class="zipcode essential" id="zipcode" name="zipcode" />
						<div class="space"></div>
						<input type="button" value="우편번호검색"class="btn btn-outline-dark" id="addChk"/>
					</td>
				</tr>
				<tr>
					<th><label for="addr0">주소</label></th>
					<td class="addr_td">
						<input data-value="주소를 입력해주세요." type="text" id="addr0" class="addr essential" name="addr0" /><br />
						<input data-value="상세주소를 입력해주세요." type="text" id="addr1" class="addr essential" name="addr1" value="" style="margin-top:7px;"  />
					</td>
				</tr>
				<tr>
					<th>점심식사</th>
					<td>
						<input type="checkbox" name="lunch" value="고등어구이"/> 고등어식당<br/>
						<input type="checkbox" name="lunch" value="구내식당"/> 구내식당<br/>
						<input type="checkbox" name="lunch" value="자장면"/> 홍짬뽕<br/>
						<input type="checkbox" name="lunch" value="돈까스"/> 탄<br/>
						<input type="checkbox" name="lunch" value="오삼불고기"/> 오삼불<br/>
						<input type="checkbox" name="lunch" value="해장국"/> 제주은희네<br/>
						<input type="checkbox" name="lunch" value="백반"/> 연탄마을<br/>
						<input type="checkbox" name="lunch" value="뼈해장국"/> 원당감자탕<br/>
					</td>
				</tr>
			</table>
	</div>
	<div class="writeForm_btn">
		<input type="submit" value="확인"class="btn btn-secondary btn-lg" id="submit"/>
		<div class="space"></div>
		<input type="button" value="취소"class="btn btn-secondary btn-lg" id="cancel"/>
	</div>
	<input type="hidden" name="email" id="email" value="" />
	<input type="hidden" name="cmd" id="cmd" value="write" />
			<!--<input type="hidden" name="spamkey" value="1712214436243"/> -->
	<input type="hidden" name="spamkey" value="null"/>
</form>
	<!-- text/css -->
</body>
</html>