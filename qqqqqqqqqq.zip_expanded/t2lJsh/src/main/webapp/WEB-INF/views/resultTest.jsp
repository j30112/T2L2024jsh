<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<%@ include file="/WEB-INF/views/header.jsp" %>
<link rel="stylesheet" href="../css/template.css">







<body>
	
	<form action="/formSubmit" name="frm">
		<div class="info">
			<label id="ttl">평가서</label>
			<p>
			<label class="subTtl">평가 기간</label>
			<label class="subTtl" id="subTtlDate">${insertBangi } - ${sumBangi }</label>
			
			<div class="userInfo">
				<label class="userInfoTxt">직위</label>
				
				<label class="resultLabelNm">${jbgd_nm }</label>
				
				
				<label class="userInfoTxt">성명</label>
				<label class="resultLabelNm">${wrt_nm }</label>
			</div>
		</div>
		
		<div class="seongGwa">
			<div class="infoBox">
				<div class="seongGwaInfo">
					<label>${insertBangi } - ${sumBangi } 업무성과 작성</label>
					<br>
					<label id="infoBoxSub">프로젝트 참여, 솔루션 개발, 영업을 통한 매출개발, 이익 개선 등 성과 기술</label>
				</div>
			</div>
			
			<input type="hidden" value="1" name="se_no[]">
			
			<c:forEach var="ctgr" items="${workPergormLIst}">
				<div class="seongGwaInput">
					<div class="seongGwaCTGR">
						<label class="ctgrTxt">카테고리</label>
						<label class="resultctgr">${ctgr.ctgry_no_select }</label>
						
						<label class="ctgrTxt">달성률</label>
							<label class="resultseongGwaPer">${ctgr.ajmt_rt_no_select }%</label>
						
					</div>
					<!-- <div class="inputDetail"> -->
					<%-- <div class="txtAreaResult" >
						${ctgr.prfmnc_cn_select }
					</div> --%>
					<textarea class="txtAreaResult" readonly="readonly">${ctgr.prfmnc_cn_select }</textarea>
				</div>
			</c:forEach>
			
		</div>
		<div class="scoreA">
			<label>A. 업무성과 환산점수(70점 만점)</label>
			<label>${sum_scr_a }점</label>
		</div>
		
		
		<div id="wishBox">
			<div class="infoBox">
				<label>기타 희망 사항 및 요청사항 입력</label>
			</div>
			
			<div id="inputDetail">
				<%-- <div class="txtAreaResult">
					${dmnd_mttr }
				</div> --%>
				<textarea name="dmnd_mtr" class="txtAreaResult" readonly="readonly">
					${dmnd_mttr }
				</textarea>
			</div>
		</div>
		
		
		<c:forEach var="as" items="${resultLIst }">
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
						            <td><input type="radio" class="sumRadio" name="qItemNo1" value="3" ${as.upmuJagiQitem_no1 == 3 ? 'checked' : ''}></td>
						            <td><input type="radio" class="sumRadio" name="qItemNo1" value="2" ${as.upmuJagiQitem_no1 == 2 ? 'checked' : ''}></td>
						            <td><input type="radio" class="sumRadio" name="qItemNo1" value="1" ${as.upmuJagiQitem_no1 == 1 ? 'checked' : ''}></td>
					        </tr>
					        <tr>
					            <td>1차 평가자</td>
						            <td><input type="radio" name="ilChaQItemNo1" value="3" ${as.upmulchaQitem_no1 == 3 ? 'checked' : ''}></td>
						            <td><input type="radio" name="ilChaQItemNo1" value="2" ${as.upmulchaQitem_no1 == 2 ? 'checked' : ''}></td>
						            <td><input type="radio" name="ilChaQItemNo1" value="1" ${as.upmulchaQitem_no1 == 1 ? 'checked' : ''}></td>
					        </tr>
					        <tr>
					        	<td rowspan="2" class="tdLeft">2. 규정이해도</td>
					            <td rowspan="2" class="tdLeft">회사의 규정 및 방침을 준수하고 수용하는 자세</td>
					            <td>자기평가</td>
					            	<td><input type="radio" class="sumRadio" name="qItemNo2" value="3" ${as.upmuJagiQitem_no2 == 3 ? 'checked' : ''}></td>
						            <td><input type="radio" class="sumRadio" name="qItemNo2" value="2" ${as.upmuJagiQitem_no2 == 2 ? 'checked' : ''}></td>
						            <td><input type="radio" class="sumRadio" name="qItemNo2" value="1" ${as.upmuJagiQitem_no2 == 1 ? 'checked' : ''}></td>
					        </tr>
					        <tr>
					            <td>1차 평가자</td>
				            	<td><input type="radio" name="ilChaQItemNo2" value="3" ${as.upmulchaQitem_no2 == 3 ? 'checked' : ''}></td>
					            <td><input type="radio" name="ilChaQItemNo2" value="2" ${as.upmulchaQitem_no2 == 2 ? 'checked' : ''}></td>
					            <td><input type="radio" name="ilChaQItemNo2" value="1" ${as.upmulchaQitem_no2 == 1 ? 'checked' : ''}></td>
					        </tr>
					        
					        
					        <tr>
					        	<td rowspan="2" class="tdLeft">3. 성실도</td>
					            <td rowspan="2" class="tdLeft">업무수행에 대한 열정과 자발적으로 임하는 자세</td>
					            <td>자기평가</td>
					            	<td><input type="radio" class="sumRadio" name="qItemNo3" value="3" ${as.upmuJagiQitem_no3 == 3 ? 'checked' : ''}></td>
						            <td><input type="radio" class="sumRadio" name="qItemNo3" value="2" ${as.upmuJagiQitem_no3 == 2 ? 'checked' : ''}></td>
						            <td><input type="radio" class="sumRadio" name="qItemNo3" value="1" ${as.upmuJagiQitem_no3 == 1 ? 'checked' : ''}></td>
					        </tr>
					        <tr>
					            	<td>1차 평가자</td>
					            	<td><input type="radio" name="ilChaQItemNo3" value="3" ${as.upmulchaQitem_no3 == 3 ? 'checked' : ''}></td>
						            <td><input type="radio" name="ilChaQItemNo3" value="2" ${as.upmulchaQitem_no3 == 2 ? 'checked' : ''}></td>
						            <td><input type="radio" name="ilChaQItemNo3" value="1" ${as.upmulchaQitem_no3 == 1 ? 'checked' : ''}></td>
					        </tr>
					        
					        
					        <tr>
					        	<td rowspan="2" class="tdLeft">4. 역할 수행</td>
					            <td rowspan="2" class="tdLeft">직급, 경력, 나이에 맞는 역할 및 임무수행</td>
					            <td>자기평가</td>
					            	<td><input type="radio" class="sumRadio" name="qItemNo4" value="3" ${as.upmuJagiQitem_no4 == 3 ? 'checked' : ''}></td>
						            <td><input type="radio" class="sumRadio" name="qItemNo4" value="2" ${as.upmuJagiQitem_no4 == 2 ? 'checked' : ''}></td>
						            <td><input type="radio" class="sumRadio" name="qItemNo4" value="1" ${as.upmuJagiQitem_no4 == 1 ? 'checked' : ''}></td>
					        </tr>
					        <tr>
					            	<td>1차 평가자</td>
					            	<td><input type="radio" name="ilChaQItemNo4" value="3" ${as.upmulchaQitem_no4 == 3 ? 'checked' : ''}></td>
						            <td><input type="radio" name="ilChaQItemNo4" value="2" ${as.upmulchaQitem_no4 == 2 ? 'checked' : ''}></td>
						            <td><input type="radio" name="ilChaQItemNo4" value="1" ${as.upmulchaQitem_no4 == 1 ? 'checked' : ''}></td>
					        </tr>
					        
					        
					        <tr>
					        	<td rowspan="2" class="tdLeft">5. 리더십</td>
					            <td rowspan="2" class="tdLeft">동료와 부하직원을 이끌 수 있는 통솔능력</td>
					            <td>자기평가</td>
					            	<td><input type="radio" class="sumRadio" name="qItemNo5" value="3" ${as.upmuJagiQitem_no5 == 3 ? 'checked' : ''}></td>
						            <td><input type="radio" class="sumRadio" name="qItemNo5" value="2" ${as.upmuJagiQitem_no5 == 2 ? 'checked' : ''}></td>
						            <td><input type="radio" class="sumRadio" name="qItemNo5" value="1" ${as.upmuJagiQitem_no5 == 1 ? 'checked' : ''}></td>
					        </tr>
					        <tr>
					            	<td>1차 평가자</td>
					            	<td><input type="radio" name="ilChaQItemNo5" value="3" ${as.upmulchaQitem_no5 == 3 ? 'checked' : ''}></td>
						            <td><input type="radio" name="ilChaQItemNo5" value="2" ${as.upmulchaQitem_no5 == 2 ? 'checked' : ''}></td>
						            <td><input type="radio" name="ilChaQItemNo5" value="1" ${as.upmulchaQitem_no5 == 1 ? 'checked' : ''}></td>
					        </tr>
					        
					        
					        
					        <tr>
					        	<td rowspan="10">업무 능력</td>
					        	<td rowspan="2" class="tdLeft">6. 업무 지식</td>
					        	<td rowspan="2" class="tdLeft">자기업무에 대한 정확한 업무숙지 및 수행능력</td>
					        	<td>자기평가</td>
						        	<td><input type="radio" class="sumRadio" name="qItemNo6" value="3" ${as.upmuJagiQitem_no6 == 3 ? 'checked' : ''}></td>
						            <td><input type="radio" class="sumRadio" name="qItemNo6" value="2" ${as.upmuJagiQitem_no6 == 2 ? 'checked' : ''}></td>
						            <td><input type="radio" class="sumRadio" name="qItemNo6" value="1" ${as.upmuJagiQitem_no6 == 1 ? 'checked' : ''}></td>
					        </tr>
					        <tr>
				            	<td>1차 평가자</td>
				            	<td><input type="radio" name="ilChaQItemNo6" value="3" ${as.upmulchaQitem_no6 == 3 ? 'checked' : ''}></td>
					            <td><input type="radio" name="ilChaQItemNo6" value="2" ${as.upmulchaQitem_no6 == 2 ? 'checked' : ''}></td>
					            <td><input type="radio" name="ilChaQItemNo6" value="1" ${as.upmulchaQitem_no6 == 1 ? 'checked' : ''}></td>
					        </tr>
					        
					        
					        <tr>
					        	<td rowspan="2" class="tdLeft">7. 업무 수행도</td>
					        	<td rowspan="2" class="tdLeft">맡은 업무에 대해서 빠르고 정확히 처리하는 능력</td>
					        	<td>자기평가</td>
					        	<td><input type="radio" class="sumRadio" name="qItemNo7" value="3" ${as.upmuJagiQitem_no7 == 3 ? 'checked' : ''}></td>
					            <td><input type="radio" class="sumRadio" name="qItemNo7" value="2" ${as.upmuJagiQitem_no7 == 2 ? 'checked' : ''}></td>
					            <td><input type="radio" class="sumRadio" name="qItemNo7" value="1" ${as.upmuJagiQitem_no7 == 1 ? 'checked' : ''}></td>
					        </tr>
					        <tr>
				            	<td>1차 평가자</td>
				            	<td><input type="radio" name="ilChaQItemNo7" value="3" ${as.upmulchaQitem_no7 == 3 ? 'checked' : ''}></td>
					            <td><input type="radio" name="ilChaQItemNo7" value="2" ${as.upmulchaQitem_no7 == 2 ? 'checked' : ''}></td>
					            <td><input type="radio" name="ilChaQItemNo7" value="1" ${as.upmulchaQitem_no7 == 1 ? 'checked' : ''}></td>
					        </tr>
					        
					        
					        <tr>
					        	<td rowspan="2" class="tdLeft">8. 추진력</td>
					        	<td rowspan="2" class="tdLeft">주어진 업무 및 목표에 대해서 끝까지 밀고나가는 힘</td>
					        	<td>자기평가</td>
					        	<td><input type="radio" class="sumRadio" name="qItemNo8" value="3" ${as.upmuJagiQitem_no8 == 3 ? 'checked' : ''}></td>
					            <td><input type="radio" class="sumRadio" name="qItemNo8" value="2" ${as.upmuJagiQitem_no8 == 2 ? 'checked' : ''}></td>
					            <td><input type="radio" class="sumRadio" name="qItemNo8" value="1" ${as.upmuJagiQitem_no8 == 1 ? 'checked' : ''}></td>
					        </tr>
					        <tr>
				            	<td>1차 평가자</td>
				            	<td><input type="radio" name="ilChaQItemNo8" value="3" ${as.upmulchaQitem_no8 == 3 ? 'checked' : ''}></td>
					            <td><input type="radio" name="ilChaQItemNo8" value="2" ${as.upmulchaQitem_no8 == 2 ? 'checked' : ''}></td>
					            <td><input type="radio" name="ilChaQItemNo8" value="1" ${as.upmulchaQitem_no8 == 1 ? 'checked' : ''}></td>
					        </tr>
					        
					        
					        <tr>
					        	<td rowspan="2" class="tdLeft">9. 기획 보고력</td>
					        	<td rowspan="2" class="tdLeft">주어진 일을 기획하거나 보고하는 능력</td>
					        	<td>자기평가</td>
					        	<td><input type="radio" class="sumRadio" name="qItemNo9" value="3" ${as.upmuJagiQitem_no9 == 3 ? 'checked' : ''}></td>
					            <td><input type="radio" class="sumRadio" name="qItemNo9" value="2" ${as.upmuJagiQitem_no9 == 2 ? 'checked' : ''}></td>
					            <td><input type="radio" class="sumRadio" name="qItemNo9" value="1" ${as.upmuJagiQitem_no9 == 1 ? 'checked' : ''}></td>
					        </tr>
					        <tr>
				            	<td>1차 평가자</td>
				            	<td><input type="radio" name="ilChaQItemNo9" value="3" ${as.upmulchaQitem_no9 == 3 ? 'checked' : ''}></td>
					            <td><input type="radio" name="ilChaQItemNo9" value="2" ${as.upmulchaQitem_no9 == 2 ? 'checked' : ''}></td>
					            <td><input type="radio" name="ilChaQItemNo9" value="1" ${as.upmulchaQitem_no9 == 1 ? 'checked' : ''}></td>
					        </tr>
					        
					        
					        <tr>
					        	<td rowspan="2" class="tdLeft">10. 창의력</td>
					        	<td rowspan="2" class="tdLeft">새롭고 능률적인 아이디어로 업무를 개선하는 능력</td>
					        	<td>자기평가</td>
					        	<td><input type="radio" class="sumRadio" name="qItemNo10" value="3" ${as.upmuJagiQitem_no10 == 3 ? 'checked' : ''}></td>
					            <td><input type="radio" class="sumRadio" name="qItemNo10" value="2" ${as.upmuJagiQitem_no10 == 2 ? 'checked' : ''}></td>
					            <td><input type="radio" class="sumRadio" name="qItemNo10" value="1" ${as.upmuJagiQitem_no10 == 1 ? 'checked' : ''}></td>
					        </tr>
					        <tr>
				            	<td>1차 평가자</td>
				            	<td><input type="radio" name="ilChaQItemNo10" value="3" ${as.upmulchaQitem_no10 == 3 ? 'checked' : ''}></td>
					            <td><input type="radio" name="ilChaQItemNo10" value="2" ${as.upmulchaQitem_no10 == 2 ? 'checked' : ''}></td>
					            <td><input type="radio" name="ilChaQItemNo10" value="1" ${as.upmulchaQitem_no10 == 1 ? 'checked' : ''}></td>
					        </tr>
					        
					        <tr>
					        	<td colspan="4" id="scoreB">B. 업무 능력 점수(30점 만점)</td>
					        	<td colspan="4">
					        	<div>
						        		<label>
						        			${as.sum_scr_b }점
						        		</label>
						        	</div>
					        	</td>
					        </tr>
					        <tr>
					        	<td colspan="4" id="scoreAB">자기 평가 합계(A + B)</td>
					        	<td colspan="4">
					        		<div>
						        		<label>
						        			${as.sum_scr_ab }점
						        		</label>
						        	</div>
					        	</td>
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
						            <td><input type="radio" name="twoQItemNo1" value="3" ${as.gisulJagiQitem_no1 == 3 ? 'checked' : ''}></td>
						            <td><input type="radio" name="twoQItemNo1" value="2" ${as.gisulJagiQitem_no1 == 2 ? 'checked' : ''}></td>
						            <td><input type="radio" name="twoQItemNo1" value="1" ${as.gisulJagiQitem_no1 == 1 ? 'checked' : ''}></td>
					        </tr>
					        <tr>
					            <td>2차 평가자</td>
						            <td><input type="radio" name="twoChaQItemNo1" value="3" ${as.gisulPyeonggaQitem_no1 == 3 ? 'checked' : ''}></td>
						            <td><input type="radio" name="twoChaQItemNo1" value="2" ${as.gisulPyeonggaQitem_no1 == 2 ? 'checked' : ''}></td>
						            <td><input type="radio" name="twoChaQItemNo1" value="1" ${as.gisulPyeonggaQitem_no1 == 1 ? 'checked' : ''}></td>
					        </tr>
					        
					        
					        <tr>
					        	<td rowspan="2" class="tdLeft">2. 확장성</td>
					            <td rowspan="2" class="tdLeft">제 3자가 읽기 쉽고 수정하기 용이하게 코딩할 수 있는 능력,<br>콘텐츠 가변 가능성을 고려한 코딩 능력</td>
					            <td>자기평가</td>
					            	<td><input type="radio" name="twoQItemNo2" value="3" ${as.gisulJagiQitem_no2 == 3 ? 'checked' : ''}></td>
						            <td><input type="radio" name="twoQItemNo2" value="2" ${as.gisulJagiQitem_no2 == 2 ? 'checked' : ''}></td>
						            <td><input type="radio" name="twoQItemNo2" value="1" ${as.gisulJagiQitem_no2 == 1 ? 'checked' : ''}></td>
					        </tr>
					        <tr>
					            <td>2차 평가자</td>
				            	<td><input type="radio" name="twoChaQItemNo2" value="3" ${as.gisulPyeonggaQitem_no2 == 3 ? 'checked' : ''}></td>
					            <td><input type="radio" name="twoChaQItemNo2" value="2" ${as.gisulPyeonggaQitem_no2 == 2 ? 'checked' : ''}></td>
					            <td><input type="radio" name="twoChaQItemNo2" value="1" ${as.gisulPyeonggaQitem_no2 == 1 ? 'checked' : ''}></td>
					        </tr>
					        
					        
					        <tr>
					        	<td rowspan="2" class="tdLeft">3. 웹표준</td>
					            <td rowspan="2" class="tdLeft">웹표준에 대한 지식</td>
					            <td>자기평가</td>
					            	<td><input type="radio" name="twoQItemNo3" value="3" ${as.gisulJagiQitem_no3 == 3 ? 'checked' : ''}></td>
						            <td><input type="radio" name="twoQItemNo3" value="2" ${as.gisulJagiQitem_no3 == 2 ? 'checked' : ''}></td>
						            <td><input type="radio" name="twoQItemNo3" value="1" ${as.gisulJagiQitem_no3 == 1 ? 'checked' : ''}></td>
					        </tr>
					        <tr>
					            <td>3차 평가자</td>
				            	<td><input type="radio" name="twoChaQItemNo3" value="3" ${as.gisulPyeonggaQitem_no3 == 3 ? 'checked' : ''}></td>
					            <td><input type="radio" name="twoChaQItemNo3" value="2" ${as.gisulPyeonggaQitem_no3 == 2 ? 'checked' : ''}></td>
					            <td><input type="radio" name="twoChaQItemNo3" value="1" ${as.gisulPyeonggaQitem_no3 == 1 ? 'checked' : ''}></td>
					        </tr>
					        
					        
					        <tr>
					        	<td rowspan="2" class="tdLeft">4. 반응형 퍼블리싱</td>
					            <td rowspan="2" class="tdLeft">정해진 규격 안에서 형태가 망가지지 않도록 코딩할 수 있는 능력</td>
					            <td>자기평가</td>
					            	<td><input type="radio" name="twoQItemNo4" value="3" ${as.gisulJagiQitem_no4 == 3 ? 'checked' : ''}></td>
						            <td><input type="radio" name="twoQItemNo4" value="2" ${as.gisulJagiQitem_no4 == 2 ? 'checked' : ''}></td>
						            <td><input type="radio" name="twoQItemNo4" value="1" ${as.gisulJagiQitem_no4 == 1 ? 'checked' : ''}></td>
					        </tr>
					        <tr>
					            <td>3차 평가자</td>
				            	<td><input type="radio" name="twoChaQItemNo4" value="3" ${as.gisulPyeonggaQitem_no4 == 3 ? 'checked' : ''}></td>
					            <td><input type="radio" name="twoChaQItemNo4" value="2" ${as.gisulPyeonggaQitem_no4 == 2 ? 'checked' : ''}></td>
					            <td><input type="radio" name="twoChaQItemNo4" value="1" ${as.gisulPyeonggaQitem_no4 == 1 ? 'checked' : ''}></td>
					        </tr>
					        
					        
					        <tr>
					        	<td rowspan="6">프론트엔드</td>
					        	<td rowspan="2" class="tdLeft">1. JQUERY</td>
					        	<td rowspan="2" class="tdLeft">jquery를 사용하여 최소한의 프론트엔드 개발 할 수 있는 능력</td>
					        	<td>자기평가</td>
					        		<td><input type="radio" name="twoQItemNo5" value="3" ${as.gisulJagiQitem_no5 == 3 ? 'checked' : ''}></td>
						            <td><input type="radio" name="twoQItemNo5" value="2" ${as.gisulJagiQitem_no5 == 2 ? 'checked' : ''}></td>
						            <td><input type="radio" name="twoQItemNo5" value="1" ${as.gisulJagiQitem_no5 == 1 ? 'checked' : ''}></td>
					        </tr>
					        <tr>
					            <td>4차 평가자</td>
				            	<td><input type="radio" name="twoChaQItemNo5" value="3" ${as.gisulPyeonggaQitem_no5 == 3 ? 'checked' : ''}></td>
					            <td><input type="radio" name="twoChaQItemNo5" value="2" ${as.gisulPyeonggaQitem_no5 == 2 ? 'checked' : ''}></td>
					            <td><input type="radio" name="twoChaQItemNo5" value="1" ${as.gisulPyeonggaQitem_no5 == 1 ? 'checked' : ''}></td>
					        </tr>
					        
					        
					        <tr>
					        	<td rowspan="2" class="tdLeft">2. JAVA SCRIPT</td>
					        	<td rowspan="2" class="tdLeft">자바스크립트 지식. 라이브러리 도움 없이 프론트 개발 가능 한지. 
					        					<br>비동기,동기에 대한 차이 이해, Promise 함수에 대한 이해와 활용 가능성</td>
					        	<td>자기평가</td>
					        		<td><input type="radio" name="twoQItemNo6" value="3" ${as.gisulJagiQitem_no6 == 3 ? 'checked' : ''}></td>
						            <td><input type="radio" name="twoQItemNo6" value="2" ${as.gisulJagiQitem_no6 == 2 ? 'checked' : ''}></td>
						            <td><input type="radio" name="twoQItemNo6" value="1" ${as.gisulJagiQitem_no6 == 1 ? 'checked' : ''}></td>
					        </tr>
					        <tr>
					            <td>4차 평가자</td>
				            	<td><input type="radio" name="twoChaQItemNo6" value="3" ${as.gisulPyeonggaQitem_no6 == 3 ? 'checked' : ''}></td>
					            <td><input type="radio" name="twoChaQItemNo6" value="2" ${as.gisulPyeonggaQitem_no6 == 2 ? 'checked' : ''}></td>
					            <td><input type="radio" name="twoChaQItemNo6" value="1" ${as.gisulPyeonggaQitem_no6 == 1 ? 'checked' : ''}></td>
					        </tr>
					        
					        
					        <tr>
					        	<td rowspan="2" class="tdLeft">3. API 활용</td>
					        	<td rowspan="2" class="tdLeft">ajax,fetch 등을 사용하여 API  호출하여 리턴값을 자유자재 활용 가능 여부</td>
					        	<td>자기평가</td>
					        		<td><input type="radio" name="twoQItemNo7" value="3" ${as.gisulJagiQitem_no7 == 3 ? 'checked' : ''}></td>
						            <td><input type="radio" name="twoQItemNo7" value="2" ${as.gisulJagiQitem_no7 == 2 ? 'checked' : ''}></td>
						            <td><input type="radio" name="twoQItemNo7" value="1" ${as.gisulJagiQitem_no7 == 1 ? 'checked' : ''}></td>
					        </tr>
					        <tr>
					            <td>5차 평가자</td>
				            	<td><input type="radio" name="twoChaQItemNo7" value="3" ${as.gisulPyeonggaQitem_no7 == 3 ? 'checked' : ''}></td>
					            <td><input type="radio" name="twoChaQItemNo7" value="2" ${as.gisulPyeonggaQitem_no7 == 2 ? 'checked' : ''}></td>
					            <td><input type="radio" name="twoChaQItemNo7" value="1" ${as.gisulPyeonggaQitem_no7 == 1 ? 'checked' : ''}></td>
					        </tr>
					        
					        
					        
					        <tr>
					        	<td rowspan="4">백엔드</td>
					        	<td rowspan="2" class="tdLeft">1. PHP,JAVA,C#,
					        					<br>node.js,python 등</td>
					        	<td rowspan="2" class="tdLeft">본인이 실무에 사용하는 언어로 기본적인 DB 연결, 
					        					<br>호출이 가능한지, API를 생성하여 프론트로 값을 넘겨줄 수 있는지.</td>
					        	<td>자기평가</td>
					        		<td><input type="radio" name="twoQItemNo8" value="3" ${as.gisulJagiQitem_no8 == 3 ? 'checked' : ''}></td>
						            <td><input type="radio" name="twoQItemNo8" value="2" ${as.gisulJagiQitem_no8 == 2 ? 'checked' : ''}></td>
						            <td><input type="radio" name="twoQItemNo8" value="1" ${as.gisulJagiQitem_no8 == 1 ? 'checked' : ''}></td>
					        </tr>
					        <tr>
					            <td>5차 평가자</td>
				            	<td><input type="radio" name="twoChaQItemNo8" value="3" ${as.gisulPyeonggaQitem_no8 == 3 ? 'checked' : ''}></td>
					            <td><input type="radio" name="twoChaQItemNo8" value="2" ${as.gisulPyeonggaQitem_no8 == 2 ? 'checked' : ''}></td>
					            <td><input type="radio" name="twoChaQItemNo8" value="1" ${as.gisulPyeonggaQitem_no8 == 1 ? 'checked' : ''}></td>
					        </tr>
					        
					        
					        <tr>
					        	<td rowspan="2" class="tdLeft">2. DB</td>
					        	<td rowspan="2" class="tdLeft">직접 쿼리문 작성 가능, JOIN문, 서브쿼리 자유자재로 활용 가능한지, 
					        					<br>테이블 직접 설계 가능한지.</td>
					        	<td>자기평가</td>
					        		<td><input type="radio" name="twoQItemNo9" value="3" ${as.gisulJagiQitem_no9 == 3 ? 'checked' : ''}></td>
						            <td><input type="radio" name="twoQItemNo9" value="2" ${as.gisulJagiQitem_no9 == 2 ? 'checked' : ''}></td>
						            <td><input type="radio" name="twoQItemNo9" value="1" ${as.gisulJagiQitem_no9 == 1 ? 'checked' : ''}></td>
					        </tr>
					        <tr>
					            <td>6차 평가자</td>
				            	<td><input type="radio" name="twoChaQItemNo9" value="3" ${as.gisulPyeonggaQitem_no9 == 3 ? 'checked' : ''}></td>
					            <td><input type="radio" name="twoChaQItemNo9" value="2" ${as.gisulPyeonggaQitem_no9 == 2 ? 'checked' : ''}></td>
					            <td><input type="radio" name="twoChaQItemNo9" value="1" ${as.gisulPyeonggaQitem_no9 == 1 ? 'checked' : ''}></td>
					        </tr>
					</table>
					
					
				</div>
		</c:forEach>
			
			
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
							<br> ( <label>${evltr_nm1 }</label> ) 
						</td>
						<td id="opinionTd2">
							<%-- <div class="textareaOpinionResult">
								${evl_cn1 }
							</div> --%>
							<textarea class="textareaOpinionResult" name="evl_cn1" readonly="readonly">
								${evl_cn1 }
							</textarea>
						</td>
						<td id="opinionTd3">등급
							<br> 
								<label>${evl_rslt_cn1 }</label>
						</td>
					</tr>
					
					
					<tr>
						<td>대표이사</td>
						<td>
						
						<textarea class="textareaOpinionResult" readonly="readonly">${evl_cn_ceo }</textarea>
							<%-- <div class="textareaOpinionResult">
								${evl_cn_ceo }
							</div> --%>
							<!-- <textarea class="textareaOpinionResult" name="evl_cn_ceo" readonly="readonly">
								
							</textarea> -->
						</td>
						<td>등급
							<br> 
							<label>${evl_rslt_cn_ceo }</label>
						</td>
					</tr>
				</table>
			</div>
		</div>
			
			
		</div>
	</form>
</body>
</html>