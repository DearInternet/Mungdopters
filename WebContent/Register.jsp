<%@ page language="java" contentType="text/html; charset-utf-8" pageEncoding="utf-8" %>

<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<head>
	<meta charset="UTF-8">

		<title>
			회원가입
		</title>

		 <!-- JQuery -->

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>



		<style>
			#divimage{
				width: 150px;
				height: 150px;
				margin: 0 auto;
			}
			#imagesettings{
				width: 150px;
				height: 150px;
				margin: 0 auto;
			}
			form{
				height: 800px;
				width: 800px;
				margin:  0 auto;
			}
			form .invisibletable{
			width: 800px;
				margin-top: 20px;
			}
			form .introcolor{
				background-color: blue;
			}
			form .oddcolor{
				background-color: beige;
				border-radius: 10px;
			}
			form .rightmargin{
				margin-right: 3px;
			}
			form .typestyles{
				height: 50px;
			}
			form .datastyles{
				font-family: sans-serif;
				margin-left :5px ;
				border-radius: 10px; 
				height: 30px;
			}
			.buttons{
				margin-top: 10px;
				border-radius: 10px; 
				width: 80px;
				height: 30px;				
			}
			#backgrounds{
				background-color: lightgreen;
			}		




		</style>
</head>


<body>
	<div id="header">
        <jsp:include page="MyhomepageHeader.jsp"></jsp:include>
        </div>  
	<h3 align="center" style="margin-top: 30px;">::&nbsp;&nbsp;&nbsp;애견보호소에
		오신것을 환영합니다&nbsp;&nbsp;&nbsp;::
	</h3>
	<div id="divimage">
	<img src="./addition/doggy.png" id="imagesettings">
	</div>
	<form name="myregister" action="JSP_session_register.jsp" method="post" id="user_info">
		<table class="invisibletable" align="center">
			<tr class="introcolor" height="2">
				<td colspan="2"></td>
			</tr>
			<tr>
				<th class="typestyles">이름</th>
				<td>
					<input type="text" name="myname" class="datastyles">
				</td>
			</tr>
			<tr>
				<th class="oddcolor typestyles">아이디</th>
				<td class="oddcolor">
					<input type="text" name="myid" maxlength="10" class="datastyles" id="thisid"> 4자 이상 10자 이하
					<input type="button" value="중복확인" id="checkmyid" class="buttons">
					<div id="ajax_area"></div>
				</td>
			</tr>
			<tr>
				<th class="typestyles">비밀번호</th>
				<td>
					<input type="password" name="mypw" maxlength="10" class="datastyles"> 6자 이상 10자 이하
				</td>
			</tr>
			<tr>
				<th class="oddcolor typestyles">비밀번호 확인</th>
				<td class="oddcolor">
					<input type="password" name="mypw_re" class="datastyles">
				</td>
			</tr>
			<tr>
				<th class="typestyles">비밀번호 힌트/답변</th>
				<td>
					<select name='pwhint' size='1' class='select datastyles'>
						<option value='0'>선택하세요</option>
						<option value='1'>졸업한 초등학교 이름은?</option>
						<option value='2'>아버지 성함은?</option>
						<option value='3'>어머니 성함은?</option>
						<option value='4'>어릴 적 내 별명은?</option>
						<option value='5'>가장 아끼는 물건은?</option>
						<option value='6'>좋아하는 동물은?</option>
						<option value='7'>좋아하는 색깔은?</option>
						<option value='8'>좋아하는 음식은?</option>
					</select>
			</tr>
			<tr>
				<th class="oddcolor typestyles">답변</th>
				<td class="oddcolor">
					<input type='text' name='pwanswer' class="datastyles">
				</td>
			</tr>
			<tr>
				<th class="typestyles">이메일</th>
				<td>
					<input type='text' name="myemail" class="datastyles">
						@
						<input type='text' name="email_dns" class="datastyles">
							<select name="emailaddr" class="datastyles">
								<option value="">직접입력</option>
								<option value="naver.com">naver.com</option>
								<option value="daum.net">daum.net</option>
								<option value="empal.com">empal.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="msn.com">msn.com</option>
								<option value="nate.com">nate.com</option>
							</select>
				</td>
			</tr>
			<tr>
				<th class="oddcolor typestyles">주소</th>
				<td class="oddcolor">
					<input type="text" name="zipcode" size="49" class="datastyles">
					<input type="button" name="zipcode_select" class="datastyles" onclick="sample4_execDaumPostcode()" value="주소 검색">
				</td>
			</tr>
			<tr>
				<th class="typestyles">집 전화번호</th>
				<td>
					<select class="rightmargin datastyles" name="cel1" title="지역 번호">
						<option value='02'>02</option>
						<option value='031'>031</option>
						<option value='032'>032</option>
						<option value='033'>033</option>
						<option value='041'>041</option>
						<option value='042'>042</option>
						<option value='043'>043</option>
						<option value='044'>044</option>
						<option value='051'>051</option>
						<option value='052'>052</option>
						<option value='053'>053</option>
						<option value='054'>054</option>
						<option value='055'>055</option>
						<option value='061'>061</option>
						<option value='062'>062</option>
						<option value='063'>063</option>
						<option value='064'>064</option>
						-
						<input type="text" name="cel2" title="집 전화번호" class="datastyles">
							-
							<input type="text" name="cel3" class="datastyles">
				</td>
			</tr>
			<tr>
				<th class="oddcolor typestyles">핸드폰 번호</th>
				<td class="oddcolor">
					<input type="text" name="tel1" class="datastyles">
						-
						<input type="text" name="tel2" class="datastyles">
							-
							<input type="text" name="tel3" class="datastyles">
				</td>
			</tr>
			<tr>
				<th class="typestyles">메일/sns 정보 수신</th>
				<td class="s">
					<input type="radio" name="chk_mail" value="1" checked>
						수신
						<input type="radio" name="chk_mail" value="0"> 수신거부
				</td>
			</tr>

			<tr height="2" bgcolor="blue">
				<td colspan="2"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="회원가입" id="submit_this" class="buttons">
					<input type="button" value="test" id="use_btn" class="buttons">
				</td>
			</tr>
		</table>
	</td>
	</tr>
	</form>
		<div id="footer">
        <jsp:include page="MyhomepageFooter.jsp"></jsp:include>
        </div>   

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>

 function sample4_execDaumPostcode() {
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
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
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
    		        }
   		     }).open();
		    }

var innerText = document.getElementById('ajax_area').innerText;

		    	$('#checkmyid').click(function(){
		$.ajax({
			url : "JSP_session_idcheck_ajax.jsp",
			type : "post",
			data : { "myid" : $('#thisid').val() },
			error : function(duplicate){
				alert('error');
			},
			success : function(unique){
				$('#ajax_area').html(unique);
				innerText = document.getElementById('ajax_area').innerText;
			}

		});
	})
		    	$(document).on('click','#use_btn',function(){
		    		document.getElementById('thisid').readOnly=true;
		    		$('#thisid').css({"background-color": "gray"});
		    		alert("a");
		    	})
				
		    	$('#submit_this').click(function(){
				if(myregister.myname.value.length===0){
				alert("이름을 입력하세요!!");
				}
				else if(myregister.myid.value.length<4){
					alert("아이디는 최소 4글자 이상, 10글자 이하여야 합니다!!");
				}
				else if(innerText === "" || innerText === "중복된 아이디입니다"){
					alert("중복확인을 하셔야 합니다");
				}
				else if(myregister.mypw.value.length<6){
					alert("비밀번호는 6글자 이상, 10글자 이하여야 합니다!!");
				}
				else if(myregister.mypw_re.value!==myregister.mypw.value){
					alert("비밀번호가 다릅니다!!");
				}
				else if(myregister.pwhint.value==="0"){
					alert("비밀번호 힌트를 선택하세요!!");
				}
				else if(myregister.pwanswer.value.length===0){
					alert("비밀번호 답변은 공백으로 할수 없습니다!!");
				}
				else if(myregister.myemail.value.length===0){
					alert("이메일은 공백으로 할수 없습니다!!");
				}
				else if(myregister.emailaddr.value==="" && myregister.email_dns.value.length===0){
					alert("이메일을 직접입력으로 선택했습니다. 직접 입력해주세요!!");
				}
				else if(myregister.zipcode.value.length<4){
					alert("주소는 최소 4글자 이상여이여야 합니다!!");
				}	
				else if(myregister.cel2.value.length===0 || myregister.cel3.value.length===0){
					alert("집 전화번호는 공백으로 할수 없습니다!!");
				}	
				else if(myregister.tel1.value.length===0 || myregister.tel2.value.length===0 || myregister.tel3.value.length===0){
					alert("핸드폰 번호는 공백으로 할수 없습니다!!");
				}			
				else{
					document.getElementById("user_info").submit();
					}
		    	})


		</script>



</body>
</html>
