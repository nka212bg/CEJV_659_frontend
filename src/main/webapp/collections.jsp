<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
    <!--header -------------->
    <jsp:include page='./includes/header.jsp'>
        <jsp:param name="title" value="Vinyl Shelf | Collections"/>
    </jsp:include>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body class="page bg-image">

        <!--header menu -------------->
        <jsp:include page="./includes/header_menu.jsp" />
        <!--collections_sub_header_menu -------------->
        <jsp:include page='./includes/collections_sub_header_menu.jsp'>
            <jsp:param name="bread_crumbs" value="collections"/>
        </jsp:include>


        <div class="mid-div hidden" id="empty_page" >
            <a href="${pageContext.request.contextPath}/add_collection.jsp" class="a"> 
                <i class="icon center-div" style="font-size: 10em"></i>
                <p>You have no collections yet</p>
            </a>
        </div>



        <div id="collections" style="width: 100%; padding-top: 40px">
            <div class="center-div box-shadow collection">

            </div>  
        </div>    






        <!--footer -------------->
        <div style="position: fixed; bottom: 0; right: 0"><jsp:include page="./includes/footer.jsp" /></div>
    </body>
</html>
