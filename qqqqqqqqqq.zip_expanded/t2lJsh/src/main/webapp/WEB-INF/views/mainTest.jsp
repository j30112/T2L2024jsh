<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<%@ include file="/WEB-INF/views/header.jsp" %>
<link rel="stylesheet" href="../css/template.css">

<script>
    document.addEventListener('DOMContentLoaded', () => {
        console.log("start");

        // 모든 sumRadio 라디오 버튼을 선택
        const sumRadios = document.querySelectorAll('.sumRadio');
        
        // sumRadio 클래스를 가진 요소 카운트 (한 문항당 sumRadio가 3개 있으므로 /3을 해준다)
        const sumRadioCnt = $('.sumRadio').length / 3;
        console.log("$('.sumRadio').length = "+sumRadioCnt);
        
        // sumId라는 ID를 가진 input 요소를 선택
        const sumInput = document.getElementById('sumId');  
        const sum_scr_bInput = document.getElementById('scoreBNum');  
        
        // scoreAInput 값 가져오기
        const scoreAInput = document.getElementById('scoreAInput');

        // 합산 계산 함수
        function calculateSum() {
            console.log("calculateSum start");
            let totalSum = 0;
            let allChecked = 0;

            // 라디오 버튼을 하나씩 확인하여 체크된 값 합산
            sumRadios.forEach(radio => {
                if (radio.checked) {
                    totalSum += parseInt(radio.value, 10);
                    console.log("calculateSum: " + totalSum);
                    allChecked += 1;
                    console.log("allChecked = "+allChecked);
                }
            });

            // 모든 라디오 버튼이 체크되었을 때만 값을 입력 필드에 업데이트
            if (allChecked == sumRadioCnt) {
                console.log("All radios checked, totalSum: " + totalSum);
                sumInput.value = totalSum + "점";  // 계산된 값을 sumId input의 value로 설정
                sum_scr_bInput.value = totalSum;

                // scoreAInput 값이 입력된 경우 totalSum과 합산하여 출력
                if (scoreAInput.value.trim() !== "") {
                    const scoreAValue = parseInt(scoreAInput.value, 10);  // scoreAInput 값 가져오기
                    const finalScore = totalSum + scoreAValue;
                    console.log("Final score (totalSum + scoreAValue): " + finalScore);
                    sumIdAB.value = finalScore+"점";
                    scoreABNum.value = finalScore;
                } else {
                    console.log("scoreAInput에 값이 없습니다.");
                }
            } else {
                console.log("Not all radios are checked.");
                sumInput.value = "점수 합산 결과";  // 하나라도 체크되지 않으면 텍스트로 표시
            }
        }

        // scoreAInput 값이 변경되었을 때 처리
        scoreAInput.addEventListener('input', calculateSum);

        // 각 라디오 버튼에 change 이벤트 리스너 추가
        sumRadios.forEach(radio => {
            radio.addEventListener('change', calculateSum);
        });
        
        
        //글 작성란 추가, 삭제를 위한 변수 정의
     	// 글 작성란 추가, 삭제를 위한 변수 정의
        const wrapper = $('.seongGwa'); // 글쓰기 란을 추가할 클래스 선택
        const addButton = $('#insertButt'); // 글쓰기 란 추가 버튼
        var fieldCount = 1; // 글쓰기 란 갯수
        var test= `aaaaaa`;

     // 글쓰기 란 추가 함수
        function addInsert(event) {
            console.log('addInsert start...');
            event.preventDefault(); // 페이지 새로고침 방지

            fieldCount++; // 글쓰기 란 갯수 증가
            console.log('fieldCount 증가:', fieldCount); // 증가된 fieldCount 출력

            // 화면상에 글쓰기 란 추가
            const newInput = `
                <div class="seongGwaInput" data-field-count="`+fieldCount+`">
                    <div class="seongGwaCTGR">
                        <label class="ctgrTxt">카테고리</label>
                        <input type="hidden" value="`+fieldCount+`" name="se_no[]">
                        <select class="ctgrSelect" name="ctgry_no[]">
                            <option value="0" selected="selected">성과 종류를 선택해주세요</option>
                            <option value="프로젝트 참여">프로젝트 참여</option>
                            <option value="솔루션 개발">솔루션 개발</option>
                            <option value="영업을 통한 매출개발">영업을 통한 매출개발</option>
                            <option value="이익 개선">이익 개선</option>
                            <option value="기타">기타</option>
                        </select>
                        
                        <label class="ctgrTxt">달성률</label>
                        <input type="text" placeholder="0~100 사이의 값을 입력해주세요" class="seongGwaPer" name="ajmt_rt[]">
                        <label class="ctgrTxtperIcon">%</label>
                        
                        <button class="deleteButt">
                            <img class="deleteButtImg" alt="삭제버튼" src="image/clodeButt.png">
                        </button>
                    </div>
                    
                    <div class="inputDetail">
                        <textarea name="prfmnc_cn[]"></textarea>
                    </div>
                </div>
            `;

            console.log('생성된 HTML:', newInput); // 생성된 HTML 확인

            // 화면에 추가
            wrapper.append(newInput.trim())
        }
     
        // 글쓰기 란 삭제 함수
        function deleteInsert(event) {
            console.log('deleteInsert start...');
            event.preventDefault(); // 페이지 새로고침 방지

            const target = $(event.currentTarget); // 클릭된 버튼
            const parentDiv = target.closest('.seongGwaInput'); // 해당 버튼의 부모 .seongGwaInput 찾기
            parentDiv.remove(); // 부모 요소 제거
            console.log('삭제 완료:', parentDiv.attr('data-field-count'));
        }

        // 이벤트 리스너 추가
        addButton.on('click', addInsert);
        wrapper.on('click', '.deleteButt', deleteInsert);
    });
    
  	 function submitChk(){
  		//alert('start');
  		
  		if(frm.jbgd_nm.value == 0){
  			alert('직위를 선택해주세요.');
  			frm.jbgd_nm.focus();
  			return false;
  		}
  		if(!frm.wrt_nm.value){
  			alert('이름을 입력해주세요.');
  			frm.wrt_nm.focus();
  			return false;
  		}
  		//카테고리 개수만큼 fot문을 돌려서 하나..
  		//name값이 배열을 가지는 경우 document.getElementsByName으로 값을 가져와야 하는 것 같음..
  		const ctgry = document.getElementsByName('ctgry_no[]');
  		//<select> 요소의 value는 항상 문자열 형태로 반환된다고 함.............. 그래서 타입까지 비교해줘야 함
  		for (let i = 0; i < ctgry.length; i++) {
  		    //alert(ctgry_no[i].value); // 각 요소의 값 출력
  		    if(ctgry[i].value==="0"){
  		    	alert(i+1+'번 글의 카테고리를 선택해주세요.');
  		    	//하단 같은 경우 이미 document.getElementsByName('ctgry_no[]')로 정의해줘서 frm안 붙여줘도 되는 듯..
  		    	ctgry[i].focus();
  		    	return false;
  		    }
  		}
  		
  		/* 달성률은 그냥 내가 있으면 좋을 것 같아서 넣은거라 굳이 null체크 안 함...
  		const ajmt_rt = document.getElementsByName('ajmt_rt[]');
  		//alert(ajmt_rt.length);
  		for (let i = 0; i < ajmt_rt.length; i++){
  			if(ajmt_rt[i].value===""){
  				alert(i+1+'번 글의 달성률을 입력해주세요.');
  				ajmt_rt[i].focus();
  				return false;
  			}
  		}*/
  		
  		const prfmnc_cn = document.getElementsByName('prfmnc_cn[]');
  		//alert(prfmnc_cn.length);
  		for (let i = 0; i < prfmnc_cn.length; i++){
  			if(prfmnc_cn[i].value===""){
  				alert(i+1+'번 글의 내용을 입력해주세요.');
  				prfmnc_cn[i].focus();
  				return false;
  			}
  		}
  		
  		if(!frm.sum_scr_a.value){
  			alert('업무성과 환산점수를 입력해주세요.');
  			frm.sum_scr_a.focus();
  			return false;
  		}
  		
  		if(!frm.evltr_nm1.value){
  			alert('1차 평가자명을 입력해주세요.');
  			frm.evltr_nm1.focus();
  			return false;
  		}
  		if(!frm.evl_cn1.value){
  			alert('1차 평가자의 평가 의견을 입력해주세요.');
  			frm.evl_cn1.focus();
  			return false;
  		}
  		if(frm.evl_rslt_cn1.value==0){
  			alert('1차 평가 등급을 선택해주세요.');
  			frm.evl_rslt_cn1.focus();
  			return false;
  		}
  		if(!frm.evl_cn_ceo.value){
  			alert('대표이사의 평가 등급을 입력해주세요.');
  			frm.evl_cn_ceo.focus();
  			return false;
  		}
  		if(frm.evl_rslt_cn_ceo.value==0){
  			alert('대표이사의 평가 등급을 선택해주세요.');
  			frm.evl_rslt_cn_ceo.focus();
  			return false;
  		}
  		
  		// 하나도 선택되지 않았다면 false 반환하게 해야하는데 안돼서.... 걍 숫자로 구분하게...
  		// 걍 문항들마다 name 다르게 하지말고 얘네도 배열로 저장할걸... 왜 굳이 이름으로 평가자를 나누려고 했지...
  		// 페이지 내 모든 타입이 라디오 버튼인 항목 선택
  		//114
  	    const qItemOrigin = document.querySelectorAll('input[type="radio"]');
  		//'input[type="radio"]'가 name상관없이 라디오버튼 요소를 다 카운트 하는 것 같음.. 그래서 나누기 3.....
  		//38
		const qItem = qItemOrigin.length/3;
  		
  		var chkQitem = document.querySelectorAll('input[type="radio"]:checked');
  		//alert('chkQitem >> '+chkQitem.length);
  		
  	    // 모든 라디오 버튼을 돌면서 하나라도 선택되었는지 확인
  	    
  	    console.log('chkQitem >> '+chkQitem+' qItem>> '+qItem);
  	    //alert('chkQitem != qItem >> '+chkQitem.length != qItem);
  	    if (chkQitem.length != qItem) {
  	        alert('모든 평가 항목을 체크해주세요.');
  	        return false; // 폼 제출을 중단
  	    }
  	    return true; // 라디오 버튼이 하나라도 선택되었으면 제출
  	}
    
</script>





<body>
	
	<form action="/formSubmit" name="frm" onsubmit="return submitChk()">
		<div class="info">
			<label id="ttl">평가서</label>
			<p>
			<label class="subTtl">평가 기간</label>
			<label class="subTtl"  id="subTtlDate">${quaterInfoNow } - ${quaterInfoNext }</label>
			
			<div class="userInfo">
				<label class="userInfoTxt">직위</label>
				<select name="jbgd_nm" class="userInfoInsert1" >
					<option value="0" selected="selected">직위를 선택해주세요</option>
					<option value="부장">부장</option>
					<option value="차장">차장</option>
					<option value="과장">과장</option>
					<option value="대리">대리</option>
					<option value="사원">사원</option>
					<option value="일학습병행제">일학습병행제</option>
				</select>
				
				<label class="userInfoTxt">성명</label>
				<input type="text" placeholder="성명을 입력해주세요" class="userInfoInsert" name="wrt_nm">
			</div>
		</div>
		
		<div class="seongGwa">
			<div class="infoBox">
				<div class="seongGwaInfo">
					<label>${quaterInfoNow } - ${quaterInfoNext } 업무성과 작성</label>
					<br>
					<label id="infoBoxSub">프로젝트 참여, 솔루션 개발, 영업을 통한 매출개발, 이익 개선 등 성과 기술</label>
				</div>
				
				<button id="insertButt">입력란 추가</button>
			</div>
			
			<input type="hidden" value="1" name="se_no[]">
			
			<div class="seongGwaInput">
				<div class="seongGwaCTGR">
					<label class="ctgrTxt">카테고리</label>
					<select class="ctgrSelect" name="ctgry_no[]" id="ctgrTest">
						<option value="0" selected="selected">성과 종류를 선택해주세요</option>
						<option value="프로젝트 참여">프로젝트 참여</option>
						<option value="솔루션 개발">솔루션 개발</option>
						<option value="영업을 통한 매출개발">영업을 통한 매출개발</option>
						<option value="이익 개선">이익 개선</option>
						<option value="기타">기타</option>
					</select>
					
					<label class="ctgrTxt">달성률</label>
						<input type="number" placeholder="0~100 사이의 값을 입력해주세요" class="seongGwaPer" name="ajmt_rt[]">
						<label class="ctgrTxtperIcon">%</label>
					
				</div>
				<div class="inputDetail">
					<textarea name="prfmnc_cn[]"></textarea>
				</div>
				
			</div>
		</div>
		<div class="scoreA">
			<label>A. 업무성과 환산점수(70점 만점)</label>
			<input type="number" id="scoreAInput" min="0" max="70" step="1" name="sum_scr_a">
		</div>
		
		
		<div id="wishBox">
			<div class="infoBox">
				<label>기타 희망 사항 및 요청사항 입력</label>
			</div>
			
			<div id="inputDetail">
				<textarea name="dmnd_mtr"></textarea>
			</div>
		</div>
		
		
		<div id="assessment">
			<div class="infoBox">
				<label>업무 능력 자기 평가</label>
			</div>
			
			<div id="inputDetail">
			
			
				<table border="1">
				    <thead>
				        <tr>
				            <td colspan="4"></td>
				            <td class="pyeonggaGubun">평가 구분</td>
				            <td class="tdRadio">상<br>(3점)</td>
				            <td class="tdRadio">중<br>(2점)</td>
				            <td class="tdRadio">하<br>(1점)</td>
				        </tr>
				    </thead>
				    <tbody>
				        <tr>
				            <td rowspan="20" class="td1">업무능력평가</td>
				            <td rowspan="10" class="td2">직무역할</td>
				            <td rowspan="2" class="tdLeft" id="td3">1. 근태</td>
				            <td rowspan="2" class="tdLeft" id="td4">지각 및 근무태도</td>
				            <td>자기평가</td>
					            <td><input type="radio" class="sumRadio" name="qItemNo1" value="3"></td>
					            <td><input type="radio" class="sumRadio" name="qItemNo1" value="2"></td>
					            <td><input type="radio" class="sumRadio" name="qItemNo1" value="1"></td>
				        </tr>
				        <tr>
				            <td>1차 평가자</td>
					            <td><input type="radio" name="ilChaQItemNo1" value="3"></td>
					            <td><input type="radio" name="ilChaQItemNo1" value="2"></td>
					            <td><input type="radio" name="ilChaQItemNo1" value="1"></td>
				        </tr>
				        <tr>
				        	<td rowspan="2" class="tdLeft">2. 규정이해도</td>
				            <td rowspan="2" class="tdLeft">회사의 규정 및 방침을 준수하고 수용하는 자세</td>
				            <td>자기평가</td>
				            	<td><input type="radio" class="sumRadio" name="qItemNo2" value="3"></td>
					            <td><input type="radio" class="sumRadio" name="qItemNo2" value="2"></td>
					            <td><input type="radio" class="sumRadio" name="qItemNo2" value="1"></td>
				        </tr>
				        <tr>
				            <td>1차 평가자</td>
			            	<td><input type="radio" name="ilChaQItemNo2" value="3"></td>
				            <td><input type="radio" name="ilChaQItemNo2" value="2"></td>
				            <td><input type="radio" name="ilChaQItemNo2" value="1"></td>
				        </tr>
				        
				        
				        <tr>
				        	<td rowspan="2" class="tdLeft">3. 성실도</td>
				            <td rowspan="2" class="tdLeft">업무수행에 대한 열정과 자발적으로 임하는 자세</td>
				            <td>자기평가</td>
				            	<td><input type="radio" class="sumRadio" name="qItemNo3" value="3"></td>
					            <td><input type="radio" class="sumRadio" name="qItemNo3" value="2"></td>
					            <td><input type="radio" class="sumRadio" name="qItemNo3" value="1"></td>
				        </tr>
				        <tr>
				            	<td>1차 평가자</td>
				            	<td><input type="radio" name="ilChaQItemNo3" value="3"></td>
					            <td><input type="radio" name="ilChaQItemNo3" value="2"></td>
					            <td><input type="radio" name="ilChaQItemNo3" value="1"></td>
				        </tr>
				        
				        
				        <tr>
				        	<td rowspan="2" class="tdLeft">4. 역할 수행</td>
				            <td rowspan="2" class="tdLeft">직급, 경력, 나이에 맞는 역할 및 임무수행</td>
				            <td>자기평가</td>
				            	<td><input type="radio" class="sumRadio" name="qItemNo4" value="3"></td>
					            <td><input type="radio" class="sumRadio" name="qItemNo4" value="2"></td>
					            <td><input type="radio" class="sumRadio" name="qItemNo4" value="1"></td>
				        </tr>
				        <tr>
				            	<td>1차 평가자</td>
				            	<td><input type="radio" name="ilChaQItemNo4" value="3"></td>
					            <td><input type="radio" name="ilChaQItemNo4" value="2"></td>
					            <td><input type="radio" name="ilChaQItemNo4" value="1"></td>
				        </tr>
				        
				        
				        <tr>
				        	<td rowspan="2" class="tdLeft">5. 리더십</td>
				            <td rowspan="2" class="tdLeft">동료와 부하직원을 이끌 수 있는 통솔능력</td>
				            <td>자기평가</td>
				            	<td><input type="radio" class="sumRadio" name="qItemNo5" value="3"></td>
					            <td><input type="radio" class="sumRadio" name="qItemNo5" value="2"></td>
					            <td><input type="radio" class="sumRadio" name="qItemNo5" value="1"></td>
				        </tr>
				        <tr>
				            	<td>1차 평가자</td>
				            	<td><input type="radio" name="ilChaQItemNo5" value="3"></td>
					            <td><input type="radio" name="ilChaQItemNo5" value="2"></td>
					            <td><input type="radio" name="ilChaQItemNo5" value="1"></td>
				        </tr>
				        
				        
				        
				        <tr>
				        	<td rowspan="10">업무 능력</td>
				        	<td rowspan="2" class="tdLeft">6. 업무 지식</td>
				        	<td rowspan="2" class="tdLeft">자기업무에 대한 정확한 업무숙지 및 수행능력</td>
				        	<td>자기평가</td>
					        	<td><input type="radio" class="sumRadio" name="qItemNo6" value="3"></td>
					            <td><input type="radio" class="sumRadio" name="qItemNo6" value="2"></td>
					            <td><input type="radio" class="sumRadio" name="qItemNo6" value="1"></td>
				        </tr>
				        <tr>
			            	<td>1차 평가자</td>
			            	<td><input type="radio" name="ilChaQItemNo6" value="3"></td>
				            <td><input type="radio" name="ilChaQItemNo6" value="2"></td>
				            <td><input type="radio" name="ilChaQItemNo6" value="1"></td>
				        </tr>
				        
				        
				        <tr>
				        	<td rowspan="2" class="tdLeft">7. 업무 수행도</td>
				        	<td rowspan="2" class="tdLeft">맡은 업무에 대해서 빠르고 정확히 처리하는 능력</td>
				        	<td>자기평가</td>
				        	<td><input type="radio" class="sumRadio" name="qItemNo7" value="3"></td>
				            <td><input type="radio" class="sumRadio" name="qItemNo7" value="2"></td>
				            <td><input type="radio" class="sumRadio" name="qItemNo7" value="1"></td>
				        </tr>
				        <tr>
			            	<td>1차 평가자</td>
			            	<td><input type="radio" name="ilChaQItemNo7" value="3"></td>
				            <td><input type="radio" name="ilChaQItemNo7" value="2"></td>
				            <td><input type="radio" name="ilChaQItemNo7" value="1"></td>
				        </tr>
				        
				        
				        <tr>
				        	<td rowspan="2" class="tdLeft">8. 추진력</td>
				        	<td rowspan="2" class="tdLeft">주어진 업무 및 목표에 대해서 끝까지 밀고나가는 힘</td>
				        	<td>자기평가</td>
				        	<td><input type="radio" class="sumRadio" name="qItemNo8" value="3"></td>
				            <td><input type="radio" class="sumRadio" name="qItemNo8" value="2"></td>
				            <td><input type="radio" class="sumRadio" name="qItemNo8" value="1"></td>
				        </tr>
				        <tr>
			            	<td>1차 평가자</td>
			            	<td><input type="radio" name="ilChaQItemNo8" value="3"></td>
				            <td><input type="radio" name="ilChaQItemNo8" value="2"></td>
				            <td><input type="radio" name="ilChaQItemNo8" value="1"></td>
				        </tr>
				        
				        
				        <tr>
				        	<td rowspan="2" class="tdLeft">9. 기획 보고력</td>
				        	<td rowspan="2" class="tdLeft">주어진 일을 기획하거나 보고하는 능력</td>
				        	<td>자기평가</td>
				        	<td><input type="radio" class="sumRadio" name="qItemNo9" value="3"></td>
				            <td><input type="radio" class="sumRadio" name="qItemNo9" value="2"></td>
				            <td><input type="radio" class="sumRadio" name="qItemNo9" value="1"></td>
				        </tr>
				        <tr>
			            	<td>1차 평가자</td>
			            	<td><input type="radio" name="ilChaQItemNo9" value="3"></td>
				            <td><input type="radio" name="ilChaQItemNo9" value="2"></td>
				            <td><input type="radio" name="ilChaQItemNo9" value="1"></td>
				        </tr>
				        
				        
				        <tr>
				        	<td rowspan="2" class="tdLeft">10. 창의력</td>
				        	<td rowspan="2" class="tdLeft">새롭고 능률적인 아이디어로 업무를 개선하는 능력</td>
				        	<td>자기평가</td>
				        	<td><input type="radio" class="sumRadio" name="qItemNo10" value="3"></td>
				            <td><input type="radio" class="sumRadio" name="qItemNo10" value="2"></td>
				            <td><input type="radio" class="sumRadio" name="qItemNo10" value="1"></td>
				        </tr>
				        <tr>
			            	<td>1차 평가자</td>
			            	<td><input type="radio" name="ilChaQItemNo10" value="3"></td>
				            <td><input type="radio" name="ilChaQItemNo10" value="2"></td>
				            <td><input type="radio" name="ilChaQItemNo10" value="1"></td>
				        </tr>
				        
				        <tr>
				        	<td colspan="4" id="scoreB">B. 업무 능력 점수(30점 만점)</td>
				        	<td colspan="4"><input id="sumId" value="점수 합산 결과" readonly="readonly"></td>
				        	<td><input type="hidden" id="scoreBNum" value="0" name="sum_scr_b"></td>
				        </tr>
				        <tr>
				        	<td colspan="4" id="scoreAB">자기 평가 합계(A + B)</td>
				        	<td colspan="4"><input id="sumIdAB" value="점수 합산 결과" readonly="readonly"></td>
				        	<td><input type="hidden" id="scoreABNum" value="0" name="sum_scr_ab"></td>
				        </tr>
				        
				        
				        <tr>
				            <td colspan="4"></td>
				            <td>평가 구분</td>
				            <td>상<br>(3점)</td>
				            <td>중<br>(2점)</td>
				            <td>하<br>(1점)</td>
				        </tr>
				        <tr>
				            <td rowspan="18">기술적 성취</td>
				            <td rowspan="8">퍼블리싱</td>
				            <td rowspan="2" class="tdLeft">1. HTML/CSS</td>
				            <td rowspan="2" class="tdLeft">디자인대로 퍼블리싱 할 수 있는 기본기</td>
				            <td>자기평가</td>
					            <td><input type="radio" name="twoQItemNo1" value="3"></td>
					            <td><input type="radio" name="twoQItemNo1" value="2"></td>
					            <td><input type="radio" name="twoQItemNo1" value="1"></td>
				        </tr>
				        <tr>
				            <td>2차 평가자</td>
					            <td><input type="radio" name="twoChaQItemNo1" value="3"></td>
					            <td><input type="radio" name="twoChaQItemNo1" value="2"></td>
					            <td><input type="radio" name="twoChaQItemNo1" value="1"></td>
				        </tr>
				        
				        
				        <tr>
				        	<td rowspan="2" class="tdLeft">2. 확장성</td>
				            <td rowspan="2" class="tdLeft">제 3자가 읽기 쉽고 수정하기 용이하게 코딩할 수 있는 능력,<br>콘텐츠 가변 가능성을 고려한 코딩 능력</td>
				            <td>자기평가</td>
				            	<td><input type="radio" name="twoQItemNo2" value="3"></td>
					            <td><input type="radio" name="twoQItemNo2" value="2"></td>
					            <td><input type="radio" name="twoQItemNo2" value="1"></td>
				        </tr>
				        <tr>
				            <td>2차 평가자</td>
			            	<td><input type="radio" name="twoChaQItemNo2" value="3"></td>
				            <td><input type="radio" name="twoChaQItemNo2" value="2"></td>
				            <td><input type="radio" name="twoChaQItemNo2" value="1"></td>
				        </tr>
				        
				        
				        <tr>
				        	<td rowspan="2" class="tdLeft">3. 웹표준</td>
				            <td rowspan="2" class="tdLeft">웹표준에 대한 지식</td>
				            <td>자기평가</td>
				            	<td><input type="radio" name="twoQItemNo3" value="3"></td>
					            <td><input type="radio" name="twoQItemNo3" value="2"></td>
					            <td><input type="radio" name="twoQItemNo3" value="1"></td>
				        </tr>
				        <tr>
				            <td>3차 평가자</td>
			            	<td><input type="radio" name="twoChaQItemNo3" value="3"></td>
				            <td><input type="radio" name="twoChaQItemNo3" value="2"></td>
				            <td><input type="radio" name="twoChaQItemNo3" value="1"></td>
				        </tr>
				        
				        
				        <tr>
				        	<td rowspan="2" class="tdLeft">4. 반응형 퍼블리싱</td>
				            <td rowspan="2" class="tdLeft">정해진 규격 안에서 형태가 망가지지 않도록 코딩할 수 있는 능력</td>
				            <td>자기평가</td>
				            	<td><input type="radio" name="twoQItemNo4" value="3"></td>
					            <td><input type="radio" name="twoQItemNo4" value="2"></td>
					            <td><input type="radio" name="twoQItemNo4" value="1"></td>
				        </tr>
				        <tr>
				            <td>3차 평가자</td>
			            	<td><input type="radio" name="twoChaQItemNo4" value="3"></td>
				            <td><input type="radio" name="twoChaQItemNo4" value="2"></td>
				            <td><input type="radio" name="twoChaQItemNo4" value="1"></td>
				        </tr>
				        
				        
				        <tr>
				        	<td rowspan="6">프론트엔드</td>
				        	<td rowspan="2" class="tdLeft">1. JQUERY</td>
				        	<td rowspan="2" class="tdLeft">jquery를 사용하여 최소한의 프론트엔드 개발 할 수 있는 능력</td>
				        	<td>자기평가</td>
				        		<td><input type="radio" name="twoQItemNo5" value="3"></td>
					            <td><input type="radio" name="twoQItemNo5" value="2"></td>
					            <td><input type="radio" name="twoQItemNo5" value="1"></td>
				        </tr>
				        <tr>
				            <td>4차 평가자</td>
			            	<td><input type="radio" name="twoChaQItemNo5" value="3"></td>
				            <td><input type="radio" name="twoChaQItemNo5" value="2"></td>
				            <td><input type="radio" name="twoChaQItemNo5" value="1"></td>
				        </tr>
				        
				        
				        <tr>
				        	<td rowspan="2" class="tdLeft">2. JAVA SCRIPT</td>
				        	<td rowspan="2" class="tdLeft">자바스크립트 지식. 라이브러리 도움 없이 프론트 개발 가능 한지. 
				        					<br>비동기,동기에 대한 차이 이해, Promise 함수에 대한 이해와 활용 가능성</td>
				        	<td>자기평가</td>
				        		<td><input type="radio" name="twoQItemNo6" value="3"></td>
					            <td><input type="radio" name="twoQItemNo6" value="2"></td>
					            <td><input type="radio" name="twoQItemNo6" value="1"></td>
				        </tr>
				        <tr>
				            <td>4차 평가자</td>
			            	<td><input type="radio" name="twoChaQItemNo6" value="3"></td>
				            <td><input type="radio" name="twoChaQItemNo6" value="2"></td>
				            <td><input type="radio" name="twoChaQItemNo6" value="1"></td>
				        </tr>
				        
				        
				        <tr>
				        	<td rowspan="2" class="tdLeft">3. API 활용</td>
				        	<td rowspan="2" class="tdLeft">ajax,fetch 등을 사용하여 API  호출하여 리턴값을 자유자재 활용 가능 여부</td>
				        	<td>자기평가</td>
				        		<td><input type="radio" name="twoQItemNo7" value="3"></td>
					            <td><input type="radio" name="twoQItemNo7" value="2"></td>
					            <td><input type="radio" name="twoQItemNo7" value="1"></td>
				        </tr>
				        <tr>
				            <td>5차 평가자</td>
			            	<td><input type="radio" name="twoChaQItemNo7" value="3"></td>
				            <td><input type="radio" name="twoChaQItemNo7" value="2"></td>
				            <td><input type="radio" name="twoChaQItemNo7" value="1"></td>
				        </tr>
				        
				        
				        
				        <tr>
				        	<td rowspan="4">백엔드</td>
				        	<td rowspan="2" class="tdLeft">1. PHP,JAVA,C#,
				        					<br>node.js,python 등</td>
				        	<td rowspan="2" class="tdLeft">본인이 실무에 사용하는 언어로 기본적인 DB 연결, 
				        					<br>호출이 가능한지, API를 생성하여 프론트로 값을 넘겨줄 수 있는지.</td>
				        	<td>자기평가</td>
				        		<td><input type="radio" name="twoQItemNo8" value="3"></td>
					            <td><input type="radio" name="twoQItemNo8" value="2"></td>
					            <td><input type="radio" name="twoQItemNo8" value="1"></td>
				        </tr>
				        <tr>
				            <td>5차 평가자</td>
			            	<td><input type="radio" name="twoChaQItemNo8" value="3"></td>
				            <td><input type="radio" name="twoChaQItemNo8" value="2"></td>
				            <td><input type="radio" name="twoChaQItemNo8" value="1"></td>
				        </tr>
				        
				        
				        <tr>
				        	<td rowspan="2" class="tdLeft">2. DB</td>
				        	<td rowspan="2" class="tdLeft">직접 쿼리문 작성 가능, JOIN문, 서브쿼리 자유자재로 활용 가능한지, 
				        					<br>테이블 직접 설계 가능한지.</td>
				        	<td>자기평가</td>
				        		<td><input type="radio" name="twoQItemNo9" value="3"></td>
					            <td><input type="radio" name="twoQItemNo9" value="2"></td>
					            <td><input type="radio" name="twoQItemNo9" value="1"></td>
				        </tr>
				        <tr>
				            <td>6차 평가자</td>
			            	<td><input type="radio" name="twoChaQItemNo9" value="3"></td>
				            <td><input type="radio" name="twoChaQItemNo9" value="2"></td>
				            <td><input type="radio" name="twoChaQItemNo9" value="1"></td>
				        </tr>
				</table>
				
				
			</div>
			
			
			<div id="opinion">
			<div class="infoBox">
				<label>평가자 의견</label>
				<br>
				<label id="infoBoxSub">S:100% 이상 성과/능력   A:90~99% 성과/능력   B:80~89% 성과/능력
						<br>C:70~79% 성과/능력   D:69% 이하 성과/능력</label>
			</div>
			
			<div id="inputDetail">
				<table border="1">
					<tr>
						<td id="opinionTd1">1차 평가자
							<br> ( <input type="text" placeholder="평가자" name="evltr_nm1"> ) 
						</td>
						<td id="opinionTd2">
							<textarea class="textareaOpinion" name="evl_cn1"></textarea>
						</td>
						<td id="opinionTd3">등급
							<br> <select name="evl_rslt_cn1">
									<option value="0" selected="selected">등급 선택</option>
									<option value="S">S</option>
									<option value="A">A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
								</select>
						</td>
					</tr>
					
					
					<tr>
						<td>대표이사</td>
						<td><textarea class="textareaOpinion" name="evl_cn_ceo"></textarea></td>
						<td>등급
							<br> <select name="evl_rslt_cn_ceo">
									<option value="0" selected="selected">등급 선택</option>
									<option value="S">S</option>
									<option value="A">A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
								</select>
						</td>
					</tr>
				</table>
			</div>
		</div>
			
			
		</div>
		
		
		
		<div class="submitButtCenter">
			<button type="submit" id="submitButt">평가서 제출</button>
			<!-- <button type="submit" id="submitButt">평가서 제출</button> -->
		</div>
		
	</form>
</body>
</html>