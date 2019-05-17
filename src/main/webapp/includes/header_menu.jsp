<%@page pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!--Header MENU-->

<!--set session user_id temp -------------->
<c:set var="user_id" value="1" scope="session"  />

<c:choose>
    <c:when test="${not empty sessionScope.user_id}">
        <div class="space-between vertica-align-flex padding-5" style="background: rgba(0,76,144,0.5)">
            <div class="space-between vertica-align-flex" style="">

                <a href="${pageContext.request.contextPath}/edit_user.jsp" style="cursor: pointer;"><img class="user-logo box-shadow" src="${pageContext.request.contextPath}/users/${sessionScope.user_id}/logo.jpg" onerror="this.src='${pageContext.request.contextPath}/resources/img/logo.jpg'" />
                </a> 

                <a href="${pageContext.request.contextPath}/collections.jsp" class="margin-left home_menu a homeLink" >
                    <i class="icon"></i> <span class="capitalize bold" >collections</span>
                </a>
            </div>
                <p class="text-white">  ${sessionScope.user_id}</p>
            <div style="padding-right: 10px; margin-bottom: -4px">
                <i class="icon a" title="contact us"></i>
                <i class="icon a margin-left" title="feedback"></i>
                <i class="icon a margin-left" title="FAQ"></i>
                <a href="http://localhost:8080/CEJV__659_backend/api/user/logout"><i class="icon a margin-left" title="Logout"></i></a>
            </div>
        </div> 

    </c:when>
    <c:otherwise>
        <script> location.replace("${pageContext.request.contextPath}/login.jsp")</script>
    </c:otherwise>
</c:choose>







