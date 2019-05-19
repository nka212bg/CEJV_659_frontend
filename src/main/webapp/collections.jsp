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


        <div class="text-white padding-10">
            <br>
            <span class="text-white">Temporary navigation</span> &nbsp;&nbsp;»&nbsp;&nbsp;
            <a href="${pageContext.request.contextPath}/login.jsp" class="a capitalize">login</a>&nbsp;&nbsp;
            <a href="${pageContext.request.contextPath}/register.jsp" class="a capitalize">register</a>&nbsp;&nbsp;
            <a href="${pageContext.request.contextPath}/add_vinyl.jsp" class="a capitalize">add vinyl</a>&nbsp;&nbsp;
            <a href="${pageContext.request.contextPath}/add_collection.jsp" class="a capitalize">add collection</a>&nbsp;&nbsp;
            <a href="${pageContext.request.contextPath}/collections.jsp" class="a capitalize">collections</a>&nbsp;&nbsp;
            <a href="${pageContext.request.contextPath}/edit_collection.jsp" class="a capitalize">edit collection</a>&nbsp;&nbsp;
            <a href="${pageContext.request.contextPath}/edit_user.jsp" class="a capitalize">edit user</a>&nbsp;&nbsp;
            <a href="${pageContext.request.contextPath}/edit_vinyl.jsp" class="a capitalize">edit vinyl</a>&nbsp;&nbsp;
            <a href="${pageContext.request.contextPath}/vinyls.jsp" class="a capitalize">vinyls</a>&nbsp;&nbsp;

        </div>


        <div id="collections" style="width: 100%; padding-top: 40px" for="'http://localhost:8080/CEJV__659_backend/api/collections/get_all_collections/' + sessionManager().getSessionId()">


            <div class="center-div box-shadow space-between collection" style="margin-bottom: 30px !important">
                <img class="cover_item" src="{{ collection_cover }}"/> 
                <div class="padding-30 content_item">
                    <div class="space-between">
                        <h2 class="first_upper">{{ collection_name }}</h2>
                        <div style="margin-top: -51px; margin-right: -15px;  padding: 12px 0px 4px 0px; ">
                            <a href="./edit_collection.jsp?id={{ collection_id }}"><i class="icon a padding-10" style="background: lightgray;border-radius: 5px;" title="edit"></i></a>
                            <a href="./vinyls.jsp?id={{ collection_id }}"><i class="icon a padding-10" style="background: lightgray;border-radius: 5px;" title="go to"></i></a>
                        </div>
                    </div>
                    <p class="first_upper bubble">{{ collection_genre }}</p>
                    <p style="text-align: justify">{{ collection_note }}</p>
                </div>
            </div>  



        </div>    






        <!--footer -------------->
        <jsp:include page="./includes/footer.jsp" />
    </body>
</html>
