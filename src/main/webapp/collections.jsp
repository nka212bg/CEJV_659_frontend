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


        <div id="collections" style="width: 100%; padding-top: 40px">

            <div class="center-div box-shadow space-between collection" style="margin-bottom: 30px !important">
                <img class="cover_item" src="https://cdn.shopify.com/s/files/1/0155/8763/products/RDF074_Front_WEB_WIDE.jpg"/>
                <div class="padding-30 content_item">
                    <div class="space-between">
                        <h2 class="first_upper">My first vinyl collection</h2>
                        <div style="margin-top: -51px; margin-right: -15px; background: lightgray; padding: 12px 0px 4px 0px; border-radius: 5px;">
                            <a href="#"><i class="icon a padding-10"></i></a>
                        </div>
                    </div>
                    <p class="first_upper bubble">rock</p>
                    <p style="text-align: justify">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using</p>
                </div>
            </div>  


            <div class="center-div box-shadow space-between collection" style="margin-bottom: 30px !important">
                <img class="cover_item" src="https://cdn.shopify.com/s/files/1/0946/3300/products/BACK-Vinyl_Record_PSD_MockUp-SQUARE_2048x.png?v=1528476468"/>
                <div class="padding-30 content_item">
                    <div class="space-between">
                        <h2 class="first_upper">My first vinyl collection</h2>
                        <div style="margin-top: -51px; margin-right: -15px; background: lightgray; padding: 12px 0px 4px 0px; border-radius: 5px;">
                            <a href="#"><i class="icon a padding-10"></i></a>
                        </div>
                    </div>
                    <p class="first_upper bubble">classic</p>
                    <p style="text-align: justify">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
                </div>
            </div> 


            <div class="center-div box-shadow space-between collection" style="margin-bottom: 30px !important">
                <img class="cover_item" src="https://www.billboard.com/files/styles/article_main_image/public/media/vinyl-record-collection-player-2015-billboard-650.jpg"/>
                <div class="padding-30 content_item">
                    <div class="space-between">
                        <h2 class="first_upper">My first vinyl collection</h2>
                        <div style="margin-top: -51px; margin-right: -15px; background: lightgray; padding: 12px 0px 4px 0px; border-radius: 5px;">
                            <i class="icon a padding-10"></i>
                        </div>
                    </div>
                    <p class="first_upper bubble">pop</p>
                    <p style="text-align: justify">Dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
                </div>
            </div> 




        </div>    






        <!--footer -------------->
        <jsp:include page="./includes/footer.jsp" />
    </body>
</html>
