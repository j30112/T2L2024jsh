<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<%@ include file="/WEB-INF/views/header.jsp" %>
<link rel="stylesheet" href="../css/template.css">

<body>
	
	<form action="formSubmit">
		<div class="info">
			<h1>평가서</h1>
			<label>평가 기간</label>
			<label>${quaterInfoNow } - ${quaterInfoNext }</label>
			
			<div class="userInfo">
				<label>직위</label>
				<select name="iserPositionValue" id="userInfo">
					<option value="0" selected="selected">직위를 선택해주세요</option>
					<option value="부장">부장</option>
					<option value="차장">차장</option>
					<option value="과장">과장</option>
					<option value="대리">대리</option>
					<option value="사원">사원</option>
					<option value="일학습병행제">일학습병행제</option>
				</select>
				
				<label>성명</label>
				<input type="text" placeholder="성명을 입력해주세요" id="userName">
			</div>
		</div>
		
		<div class="seongGwa">
			<div id="infoBox">
				<div class="seongGwaInfo">
					<label>${quaterInfoNow } - ${quaterInfoNext } 업무성과 작성</label>
					<label>프로젝트 참여, 솔루션 개발, 영업을 통한 매출개발, 이익 개선 등 성과 기술</label>
				</div>
				
				<button id="insertButt">입력란 추가</button>
			</div>
			
			<div class="seongGwaInput">
				<div class="seongGwaCTGR">
					<select>
						<option value="0" selected="selected">성과 종류를 선택해주세요</option>
						<option value="프로젝트 참여">프로젝트 참여</option>
						<option value="솔루션 개발">솔루션 개발</option>
						<option value="영업을 통한 매출개발">영업을 통한 매출개발</option>
						<option value="이익 개선">이익 개선</option>
						<option value="기타">기타</option>
					</select>
					
					<div class="seongGwaPer">
						<input type="text" placeholder="0~100 사이의 값을 입력헤주세요"> %
					</div>
				</div>
				
				<div id="inputDetail">
					<textarea rows="" cols=""></textarea>
				</div>
			</div>
		</div>
		
		
		<div id="wishBox">
			<div class="infoBox">
				<label>기타 희망 사항 및 요청사항 입력</label>
			</div>
			
			<div id="inputDetail">
				<textarea rows="" cols=""></textarea>
			</div>
		</div>
		
		
		<div id="assessment">
			<div class="infoBox">
				<label>업무 능력 자기 평가</label>
			</div>
			
			<div id="inputDetail">
			
			
				<table border="1" style="width: 100%; border-collapse: collapse;">
				    <thead>
				        <tr>
				            <td colspan="4"></td>
				            <td>평가 구분</td>
				            <td>상(3점)</td>
				            <td>중(2점)</td>
				            <td>하(1점)</td>
				        </tr>
				    </thead>
				    <tbody>
				        <tr>
				            <td rowspan="20">업무능력평가</td>
				            <td rowspan="10">직무역할</td>
				            <td rowspan="2">1. 근태</td>
				            <td rowspan="2">지각 및 근무태도</td>
				            <td>자기평가</td>
					            <td><input type="radio" name="qItemNo1" value="3"></td>
					            <td><input type="radio" name="qItemNo1" value="2"></td>
					            <td><input type="radio" name="qItemNo1" value="1"></td>
				        </tr>
				        <tr>
				            <td>1차 평가자</td>
					            <td><input type="radio" name="1chaQItemNo1" value="3"></td>
					            <td><input type="radio" name="1chaQItemNo1" value="2"></td>
					            <td><input type="radio" name="1chaQItemNo1" value="1"></td>
				        </tr>
				        <tr>
				        	<td rowspan="2">2. 규정이해도</td>
				            <td rowspan="2">회사의 규정 및 방침을 준수하고 수용하는 자세</td>
				            <td>자기평가</td>
				            	<td><input type="radio" name="qItemNo2" value="3"></td>
					            <td><input type="radio" name="qItemNo2" value="2"></td>
					            <td><input type="radio" name="qItemNo2" value="1"></td>
				        </tr>
				        <tr>
				            <td>1차 평가자</td>
			            	<td><input type="radio" name="1chaQItemNo2" value="3"></td>
				            <td><input type="radio" name="1chaQItemNo2" value="2"></td>
				            <td><input type="radio" name="1chaQItemNo2" value="1"></td>
				        </tr>
				        
				        
				        <tr>
				        	<td rowspan="2">3. 성실도</td>
				            <td rowspan="2">업무수행에 대한 열정과 자발적으로 임하는 자세</td>
				            <td>자기평가</td>
				            	<td><input type="radio" name="qItemNo3" value="3"></td>
					            <td><input type="radio" name="qItemNo3" value="2"></td>
					            <td><input type="radio" name="qItemNo3" value="1"></td>
				        </tr>
				        <tr>
				            	<td>1차 평가자</td>
				            	<td><input type="radio" name="1chaQItemNo3" value="3"></td>
					            <td><input type="radio" name="1chaQItemNo3" value="2"></td>
					            <td><input type="radio" name="1chaQItemNo3" value="1"></td>
				        </tr>
				        
				        
				        <tr>
				        	<td rowspan="2">4. 역할 수행</td>
				            <td rowspan="2">직급, 경력, 나이에 맞는 역할 및 임무수행</td>
				            <td>자기평가</td>
				            	<td><input type="radio" name="qItemNo4" value="3"></td>
					            <td><input type="radio" name="qItemNo4" value="2"></td>
					            <td><input type="radio" name="qItemNo4" value="1"></td>
				        </tr>
				        <tr>
				            	<td>1차 평가자</td>
				            	<td><input type="radio" name="1chaQItemNo4" value="3"></td>
					            <td><input type="radio" name="1chaQItemNo4" value="2"></td>
					            <td><input type="radio" name="1chaQItemNo4" value="1"></td>
				        </tr>
				        
				        
				        <tr>
				        	<td rowspan="2">5. 리더십</td>
				            <td rowspan="2">동료와 부하직원을 이끌 수 있는 통솔능력</td>
				            <td>자기평가</td>
				            	<td><input type="radio" name="qItemNo5" value="3"></td>
					            <td><input type="radio" name="qItemNo5" value="2"></td>
					            <td><input type="radio" name="qItemNo5" value="1"></td>
				        </tr>
				        <tr>
				            	<td>1차 평가자</td>
				            	<td><input type="radio" name="1chaQItemNo5" value="3"></td>
					            <td><input type="radio" name="1chaQItemNo5" value="2"></td>
					            <td><input type="radio" name="1chaQItemNo5" value="1"></td>
				        </tr>
				        
				        
				        
				        <tr>
				        	<td rowspan="10">업무 능력</td>
				        	<td rowspan="2">6.업무 지식</td>
				        	<td rowspan="2">자기업무에 대한 정확한 업무숙지 및 수행능력</td>
				        	<td>자기평가</td>
					        	<td><input type="radio" name="1chaQItemNo6" value="3"></td>
					            <td><input type="radio" name="1chaQItemNo6" value="2"></td>
					            <td><input type="radio" name="1chaQItemNo6" value="1"></td>
				        </tr>
				        <tr>
			            	<td>1차 평가자</td>
			            	<td><input type="radio" name="1chaQItemNo6" value="3"></td>
				            <td><input type="radio" name="1chaQItemNo6" value="2"></td>
				            <td><input type="radio" name="1chaQItemNo6" value="1"></td>
				        </tr>
				        
				        
				        <tr>
				        	<td rowspan="2">7.업무 수행도</td>
				        	<td rowspan="2">맡은 업무에 대해서 빠르고 정확히 처리하는 능력</td>
				        	<td>자기평가</td>
				        	<td><input type="radio" name="1chaQItemNo7" value="3"></td>
				            <td><input type="radio" name="1chaQItemNo7" value="2"></td>
				            <td><input type="radio" name="1chaQItemNo7" value="1"></td>
				        </tr>
				        <tr>
			            	<td>1차 평가자</td>
			            	<td><input type="radio" name="1chaQItemNo7" value="3"></td>
				            <td><input type="radio" name="1chaQItemNo7" value="2"></td>
				            <td><input type="radio" name="1chaQItemNo7" value="1"></td>
				        </tr>
				        
				        
				        <tr>
				        	<td rowspan="2">8.추진력</td>
				        	<td rowspan="2">주어진 업무 및 목표에 대해서 끝까지 밀고나가는 힘</td>
				        	<td>자기평가</td>
				        	<td><input type="radio" name="1chaQItemNo8" value="3"></td>
				            <td><input type="radio" name="1chaQItemNo8" value="2"></td>
				            <td><input type="radio" name="1chaQItemNo8" value="1"></td>
				        </tr>
				        <tr>
			            	<td>1차 평가자</td>
			            	<td><input type="radio" name="1chaQItemNo8" value="3"></td>
				            <td><input type="radio" name="1chaQItemNo8" value="2"></td>
				            <td><input type="radio" name="1chaQItemNo8" value="1"></td>
				        </tr>
				        
				        
				        <tr>
				        	<td rowspan="2">9.기획 보고력</td>
				        	<td rowspan="2">주어진 일을 기획하거나 보고하는 능력</td>
				        	<td>자기평가</td>
				        	<td><input type="radio" name="1chaQItemNo9" value="3"></td>
				            <td><input type="radio" name="1chaQItemNo9" value="2"></td>
				            <td><input type="radio" name="1chaQItemNo9" value="1"></td>
				        </tr>
				        <tr>
			            	<td>1차 평가자</td>
			            	<td><input type="radio" name="1chaQItemNo9" value="3"></td>
				            <td><input type="radio" name="1chaQItemNo9" value="2"></td>
				            <td><input type="radio" name="1chaQItemNo9" value="1"></td>
				        </tr>
				        
				        
				        <tr>
				        	<td rowspan="2">10.창의력</td>
				        	<td rowspan="2">새롭고 능률적인 아이디어로 업무를 개선하는 능력</td>
				        	<td>자기평가</td>
				        	<td><input type="radio" name="1chaQItemNo10" value="3"></td>
				            <td><input type="radio" name="1chaQItemNo10" value="2"></td>
				            <td><input type="radio" name="1chaQItemNo10" value="1"></td>
				        </tr>
				        <tr>
			            	<td>1차 평가자</td>
			            	<td><input type="radio" name="1chaQItemNo10" value="3"></td>
				            <td><input type="radio" name="1chaQItemNo10" value="2"></td>
				            <td><input type="radio" name="1chaQItemNo10" value="1"></td>
				        </tr>
				        
				        <tr>
				        	<td colspan="4">B. 업무 능력 점수(30점 만점)</td>
				        	<td colspan="4"><label>합산점수 출력</label></td>
				        </tr>
				        <tr>
				        	<td colspan="4">자기 평가 합계(A + B)</td>
				        	<td colspan="4"><label>합산점수 출력</label></td>
				        </tr>
				    </tbody>
				</table>
				
				
				<table border="1" style="width: 100%; border-collapse: collapse;">
				    <thead>
				        <tr>
				            <td colspan="4"></td>
				            <td>평가 구분</td>
				            <td>상(3점)</td>
				            <td>중(2점)</td>
				            <td>하(1점)</td>
				        </tr>
				    </thead>
				    <tbody>
				        <tr>
				            <td rowspan="18">업무능력평가</td>
				            <td rowspan="8">퍼블리싱</td>
				            <td rowspan="2">1. HTML/CSS</td>
				            <td rowspan="2">디자인대로 퍼블리싱 할 수 있는 기본기</td>
				            <td>자기평가</td>
					            <td><input type="radio" name="2qItemNo1" value="3"></td>
					            <td><input type="radio" name="2qItemNo1" value="2"></td>
					            <td><input type="radio" name="2qItemNo1" value="1"></td>
				        </tr>
				        <tr>
				            <td>2차 평가자</td>
					            <td><input type="radio" name="2chaQItemNo1" value="3"></td>
					            <td><input type="radio" name="2chaQItemNo1" value="2"></td>
					            <td><input type="radio" name="2chaQItemNo1" value="1"></td>
				        </tr>
				        
				        
				        <tr>
				        	<td rowspan="2">2. 확장성</td>
				            <td rowspan="2">제 3자가 읽기 쉽고 수정하기 용이하게 코딩할 수 있는 능력,<br>콘텐츠 가변 가능성을 고려한 코딩 능력</td>
				            <td>자기평가</td>
				            	<td><input type="radio" name="2qItemNo2" value="3"></td>
					            <td><input type="radio" name="2qItemNo2" value="2"></td>
					            <td><input type="radio" name="2qItemNo2" value="1"></td>
				        </tr>
				        <tr>
				            <td>2차 평가자</td>
			            	<td><input type="radio" name="2chaQItemNo2" value="3"></td>
				            <td><input type="radio" name="2chaQItemNo2" value="2"></td>
				            <td><input type="radio" name="2chaQItemNo2" value="1"></td>
				        </tr>
				        
				        
				        <tr>
				        	<td rowspan="2">3. 웹표준</td>
				            <td rowspan="2">웹표준에 대한 지식</td>
				            <td>자기평가</td>
				            	<td><input type="radio" name="2qItemNo3" value="3"></td>
					            <td><input type="radio" name="2qItemNo3" value="2"></td>
					            <td><input type="radio" name="2qItemNo3" value="1"></td>
				        </tr>
				        <tr>
				            <td>2차 평가자</td>
			            	<td><input type="radio" name="2chaQItemNo3" value="3"></td>
				            <td><input type="radio" name="2chaQItemNo3" value="2"></td>
				            <td><input type="radio" name="2chaQItemNo3" value="1"></td>
				        </tr>
				        
				        
				        <tr>
				        	<td rowspan="2">4. 반응형 퍼블리싱</td>
				            <td rowspan="2">정해진 규격 안에서 형태가 망가지지 않도록 코딩할 수 있는 능력</td>
				            <td>자기평가</td>
				            	<td><input type="radio" name="2qItemNo4" value="3"></td>
					            <td><input type="radio" name="2qItemNo4" value="2"></td>
					            <td><input type="radio" name="2qItemNo4" value="1"></td>
				        </tr>
				        <tr>
				            <td>2차 평가자</td>
			            	<td><input type="radio" name="2chaQItemNo4" value="3"></td>
				            <td><input type="radio" name="2chaQItemNo4" value="2"></td>
				            <td><input type="radio" name="2chaQItemNo4" value="1"></td>
				        </tr>
				        
				        
				        <tr>
				        	<td rowspan="6">프론트엔드</td>
				        	<td rowspan="2">1. JQUERY</td>
				        	<td rowspan="2">jquery를 사용하여 최소한의 프론트엔드 개발 할 수 있는 능력</td>
				        	<td>자기평가</td>
				        		<td><input type="radio" name="2qItemNo5" value="3"></td>
					            <td><input type="radio" name="2qItemNo5" value="2"></td>
					            <td><input type="radio" name="2qItemNo5" value="1"></td>
				        </tr>
				        <tr>
				            <td>2차 평가자</td>
			            	<td><input type="radio" name="2chaQItemNo5" value="3"></td>
				            <td><input type="radio" name="2chaQItemNo5" value="2"></td>
				            <td><input type="radio" name="2chaQItemNo5" value="1"></td>
				        </tr>
				        
				        
				        <tr>
				        	<td rowspan="2">2. JAVA SCRIPT</td>
				        	<td rowspan="2">자바스크립트 지식. 라이브러리 도움 없이 프론트 개발 가능 한지. 
				        					<br>비동기,동기에 대한 차이 이해, 
				        					<br>Promise 함수에 대한 이해와 활용 가능성</td>
				        	<td>자기평가</td>
				        		<td><input type="radio" name="2qItemNo6" value="3"></td>
					            <td><input type="radio" name="2qItemNo6" value="2"></td>
					            <td><input type="radio" name="2qItemNo6" value="1"></td>
				        </tr>
				        <tr>
				            <td>2차 평가자</td>
			            	<td><input type="radio" name="2chaQItemNo6" value="3"></td>
				            <td><input type="radio" name="2chaQItemNo6" value="2"></td>
				            <td><input type="radio" name="2chaQItemNo6" value="1"></td>
				        </tr>
				        
				        
				        <tr>
				        	<td rowspan="2">3. API 활용</td>
				        	<td rowspan="2">ajax,fetch 등을 사용하여 API  호출하여 
				        					<br>리턴값을 자유자재로 활용 가능 여부</td>
				        	<td>자기평가</td>
				        		<td><input type="radio" name="2qItemNo7" value="3"></td>
					            <td><input type="radio" name="2qItemNo7" value="2"></td>
					            <td><input type="radio" name="2qItemNo7" value="1"></td>
				        </tr>
				        <tr>
				            <td>2차 평가자</td>
			            	<td><input type="radio" name="2chaQItemNo7" value="3"></td>
				            <td><input type="radio" name="2chaQItemNo7" value="2"></td>
				            <td><input type="radio" name="2chaQItemNo7" value="1"></td>
				        </tr>
				        
				        
				        
				        <tr>
				        	<td rowspan="4">백엔드</td>
				        	<td rowspan="2">1. PHP,JAVA,C#,
				        					<br>node.js,python 등</td>
				        	<td rowspan="2">본인이 실무에 사용하는 언어로 기본적인 DB 연결, 
				        					<br>호출이 가능한지, API를 생성하여 프론트로 값을 넘겨줄 수 있는지.</td>
				        	<td>자기평가</td>
				        		<td><input type="radio" name="2qItemNo8" value="3"></td>
					            <td><input type="radio" name="2qItemNo8" value="2"></td>
					            <td><input type="radio" name="2qItemNo8" value="1"></td>
				        </tr>
				        <tr>
				            <td>2차 평가자</td>
			            	<td><input type="radio" name="2chaQItemNo8" value="3"></td>
				            <td><input type="radio" name="2chaQItemNo8" value="2"></td>
				            <td><input type="radio" name="2chaQItemNo8" value="1"></td>
				        </tr>
				        
				        
				        <tr>
				        	<td rowspan="2">2. DB</td>
				        	<td rowspan="2">직접 쿼리문 작성 가능, JOIN문, 
				        					<br>서브쿼리 자유자재로 활용 가능한지, 
				        					<br>테이블 직접 설계 가능한지.</td>
				        	<td>자기평가</td>
				        		<td><input type="radio" name="2qItemNo9" value="3"></td>
					            <td><input type="radio" name="2qItemNo9" value="2"></td>
					            <td><input type="radio" name="2qItemNo9" value="1"></td>
				        </tr>
				        <tr>
				            <td>2차 평가자</td>
			            	<td><input type="radio" name="2chaQItemNo9" value="3"></td>
				            <td><input type="radio" name="2chaQItemNo9" value="2"></td>
				            <td><input type="radio" name="2chaQItemNo9" value="1"></td>
				        </tr>
				    </tbody>
				</table>
			</div>
			
			
			<div id="opinion">
			<div class="infoBox">
				<label>평가자 의견</label>
				<label>S:100% 이상 성과/능력   A:90~99% 성과/능력   B:80~89% 성과/능력
						<br>C:70~79% 성과/능력   D:69% 이하 성과/능력</label>
			</div>
			
			<div id="inputDetail">
				<table border="1" style="width: 100%; border-collapse: collapse;">
					<tr>
						<td>1차
							<br> ( <input type="text" placeholder="평가자"> ) 
						</td>
						<td><textarea></textarea></td>
						<td>등급
							<br> <select>
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
						<td><textarea></textarea></td>
						<td>등급
							<br> <select>
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
		
		
		
		<button type="submit">평가서 제출</button>
	</form>
</body>
</html>