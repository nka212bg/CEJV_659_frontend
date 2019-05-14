<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
    <!--header -------------->
    <jsp:include page='./includes/header.jsp'>
        <jsp:param name="title" value="Vinyl Shelf | Edit collection"/>
    </jsp:include>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>

        <!--header menu -------------->
        <jsp:include page="./includes/header_menu.jsp" />
        <!--collections_sub_header_menu -------------->
        <jsp:include page='./includes/collections_sub_header_menu.jsp'>
            <jsp:param name="bread_crumbs" value="collections &nbsp;&nbsp;<span style='color : orangered'>»</span>&nbsp;&nbsp; edit collection"/>
        </jsp:include>


    <body class="page bg-image">
        <div class="padding-30">
            <div class="padding-30" style="width: 350px;">
                <h1 class="text-blue capitalize" style="line-height: 0;">edit collection</h1>
                <br/>
                <form id="login" method="POST" action="Login?login">
                    <input type="text" class="input box-shadow" name="collection_email" placeholder=" Collection Name" />
                    <br>
                    <input type="text" class="input box-shadow" name="genre" placeholder=" Genre" />
                    <br>
                    <input type="text" class="input box-shadow" name="collection_cover" placeholder="  Cover (URL)" />
                    <br>
                    <textarea class="input box-shadow" style="min-height: 100px" placeholder=" Note..."></textarea>
              
                    <div class="space-between">
                        <a></a>
                        <button class="button margin-v-20 box-shadow" name="edit_collection" style="width: 150px">Edit</button>
                    </div>

                </form>
            </div>
        </div>




        <!--footer -------------->
        <div style="position: fixed; bottom: 0; right: 0"><jsp:include page="./includes/footer.jsp" /></div>
    </body>
</html>
