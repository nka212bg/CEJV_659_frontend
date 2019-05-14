<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
    <!--header -------------->
    <jsp:include page='./includes/header.jsp'>
        <jsp:param name="title" value="Vinyl Shelf | Vinyls"/>
    </jsp:include>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body class="page bg-image">

        <!--header menu -------------->
        <jsp:include page="./includes/header_menu.jsp" />
        <!--collections_sub_header_menu -------------->
        <jsp:include page='./includes/vinyl_sub_header_menu.jsp'>
            <jsp:param name="bread_crumbs" value="collections &nbsp;&nbsp;<span style='color : orangered'>»</span>&nbsp;&nbsp; collection name  &nbsp;&nbsp;<span style='color : orangered'>»</span>&nbsp;&nbsp; vinyls"/>
        </jsp:include>



        <div class="mid-div" id="empty_page">
            <a href="${pageContext.request.contextPath}/add_vinyl.jsp" class="a"> 
                <i class="icon center-div" style="font-size: 10em"></i>
                <p>You have no vinyls in this collection</p>
            </a>
        </div>



        <!--footer -------------->
        <div style="position: fixed; bottom: 0; right: 0"><jsp:include page="./includes/footer.jsp" /></div>
    </body>
</html>
