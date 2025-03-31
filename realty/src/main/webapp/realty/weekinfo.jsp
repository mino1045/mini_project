<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="cr" uri="http://java.sun.com/jsp/jstl/core" %>
<!--weekinfo  -->
 <!--금주 분양 매물 정보 시작-->
  <section>
    <div class="weekdays">
      <p>금주분양 매물정보<br><em>이번주 신규 매물정보!</em></p>
      <div class="week_estates">
        <ul>
        <cr:forEach var="property" items="${property_dto}"> 
          <li><a href="week_tails.do?pidx=${property.pidx}">
            <span>${property.pstatus}</span>
           
            <div>${property.pname}</div>
            <aside>${property.paddress}</aside>
            <span>${property.ptype} | ${property.psalsetype}</span><br>
            <label>${property.pmoveindate} | ${property.pmoveindate}</label>
            <div><img src="./room/${property.pmig}" width="350px"></div>
            </a>
          </li>
          </cr:forEach>
        </ul>
      </div>
    </div>
  </section>
  <!--금주 분양 매물 정보 끝-->
  <!--weekinfo 끝-->