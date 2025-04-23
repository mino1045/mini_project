<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="cr" uri="http://java.sun.com/jsp/jstl/core" %>
<!--mdchoice -->
  <!--추천 분양 정보-->
  <section>
    <div class="recommend">
      <p>추천분양정보<br><em>실시간 추천 분양정보를 한곳에!</em></p>
      <div class="md_estates">
        <ul>
           <cr:forEach items="${mdchoice}" var="md">
          <a href="${md.mc_url}"><li>
            <div><img src="./md_room/${md.file_url}"></div>
            <span>${md.mc_title}</span>
            <div>${md.mc_text}</div>
          </li></a>
           </cr:forEach>
        </ul>

      
      </div>
    </div>
  </section>
  <!--추천 분양 정보 끝-->
 <!--mdchoice 끝  -->