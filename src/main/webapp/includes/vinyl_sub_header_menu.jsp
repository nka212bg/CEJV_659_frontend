<%@page pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!--sub-Header MENU-->

        <div class="space-between vertica-align-flex padding-5" style="background: rgba(58,83,106,0.5)">
            <div class="space-between vertica-align-flex" style="width: 100%">
                <span class="capitalize bold text-white" >${param.bread_crumbs}</span>

                <a href="${pageContext.request.contextPath}/add_vinyl.jsp" class="margin-left home_menu a homeLink" >
                    <span class="capitalize bold" >add new vinyl</span>&nbsp;&nbsp;&nbsp;<i class="icon bg-blue" style="padding: 2px"></i>
                </a>
            </div>
        </div> 







