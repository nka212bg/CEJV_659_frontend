<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
    <!--header -------------->
    <jsp:include page='./includes/header.jsp'>
        <jsp:param name="title" value="Vinyl Shelf | Edit Vinyl"/>
    </jsp:include>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
  <body class="page bg-image">

        <!--header menu -------------->
        <jsp:include page="./includes/header_menu.jsp" />
        <!--collections_sub_header_menu -------------->
        <jsp:include page='./includes/vinyl_sub_header_menu.jsp'>
            <jsp:param name="bread_crumbs" value="collections &nbsp;&nbsp;<span style='color : orangered'>»</span>&nbsp;&nbsp; collection name  &nbsp;&nbsp;<span style='color : orangered'>»</span>&nbsp;&nbsp; edit vinyl"/>
        </jsp:include>


  
        <div class="padding-30">
            <div class="padding-30" style="width: 350px;">
                <h1 class="text-blue capitalize" style="line-height: 0;">edit vinyl</h1>
                <br/>
                <form id="login" method="POST" action="Login?login">
                    <input type="text" class="input box-shadow" name="vinyl_email" placeholder=" Artist/Group Name" />
                    <br>
                    <input type="text" class="input box-shadow" name="genre" placeholder=" Album" />
                    <br>
                    <input type="text" class="input box-shadow" name="vinyl_cover" placeholder="  Cover (URL)" />
                    <br>
                    <input type="text" class="input box-shadow" name="album_year" placeholder="  Album Year" />
                    <br>
                    <textarea class="input box-shadow" style="min-height: 100px" placeholder=" Note..."></textarea>

                    <div class="space-between">
                        <div>
                            <span class="text-light-blue" >Condition</span><br>
                            <input style="margin: 5px 0 0 0;padding: 0" type="radio" name="condition" value="1"/>
                            <input style="margin: 0;padding: 0" type="radio" name="condition" value="2"/>
                            <input style="margin: 0;padding: 0" type="radio" name="condition" value="3"/>
                            <input style="margin: 0;padding: 0" type="radio" name="condition" value="4"/>
                            <input style="margin: 0;padding: 0" type="radio" name="condition" value="5"/>
                            <input style="margin: 0;padding: 0" type="radio" name="condition" value="6"/>
                        </div>
                        <button class="button margin-v-20 box-shadow" name="edit_vinyl" style="width: 150px">Edit</button>
                    </div>

                </form>
            </div>
        </div>




        <!--footer -------------->
        <div style="position: fixed; bottom: 0; right: 0"><jsp:include page="./includes/footer.jsp" /></div>
    </body>
</html>
