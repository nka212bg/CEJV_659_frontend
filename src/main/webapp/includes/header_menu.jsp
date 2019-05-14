<%@page pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!--Header MENU-->

<!--set session user_id temp -------------->
<c:set var="user_id" value="1" scope="session"  />

<c:choose>
    <c:when test="${not empty sessionScope.user_id}">
        <div class="space-between vertica-align-flex padding-5" style="margin-bottom: 50px; background: rgba(0,0,0,0.5)">
            <div class="space-between vertica-align-flex" style="">
                <img id="menu_logo_image" src="${pageContext.request.contextPath}/users/${sessionScope.user_id}/logo.jpg" class="user-logo"  
                     onerror="this.src='${pageContext.request.contextPath}/resources/img/logo.jpg'" />
                <a href="${pageContext.request.contextPath}/collections.jsp" class="margin-left home_menu a homeLink" >
                    <i class="icon"></i> <span class="capitalize bold" >collections</span>
                </a>
            </div>
        </div> 
    </c:when>
    <c:otherwise>
        <script> location.replace("${pageContext.request.contextPath}/login.jsp") </script>
    </c:otherwise>
</c:choose>







