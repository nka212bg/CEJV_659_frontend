<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
    <!--header -------------->
    <jsp:include page='./includes/header.jsp'>
        <jsp:param name="title" value="Vinyl Shelf | Add Vinyl"/>
    </jsp:include>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body class="page bg-image">

        <!--header menu -------------->
        <jsp:include page="./includes/header_menu.jsp" />
        <!--collections_sub_header_menu -------------->
        <jsp:include page='./includes/vinyl_sub_header_menu.jsp'>
            <jsp:param name="bread_crumbs" value="collections &nbsp;&nbsp;<span style='color : orangered'>»</span>&nbsp;&nbsp; vinyls &nbsp;&nbsp;<span style='color : orangered'>»</span>&nbsp;&nbsp; add new vinyl"/>
        </jsp:include>




        <div class="padding-30">
            <div class="padding-30" style="width: 350px;">
                <div class="space-between">
                    <div>
                        <h1 class="text-blue capitalize" style="line-height: 30px;">add vinyl</h1>
                        <span class="subtitle_text capitalize" text="'collection: ' + urlParam().name"></span>
                    </div>
                    <div>

                        <img class="user-logo box-shadow" src="" id="vinyl_logo" onerror="this.src='./resources/img/logo.jpg'" style="width: 150px; height: 150px;"/>
                    </div>
                </div>

                <br/>

                <form id="add_vinyl" method="POST" onsubmit="this.action = 'http://localhost:8080/CEJV__659_backend/api/vinyls/add_vinyl/' + urlParam().id">     

                    <!--                    <form id="add_vinyl" onsubmit="event.preventDefault(), formManager(this).setData('http://localhost:8080/CEJV__659_backend/api/vinyls/add_vinyl/').then(() => {
                                                window.history.back();
                                            })">   -->


                    <br>
                    <input type="text" class="input box-shadow" name="vinyl_artist_name" placeholder=" Artist/Group Name" />
                    <br>
                    <input type="text" class="input box-shadow" name="vinyl_album_name" placeholder=" Album" />
                    <br>
                    <input type="text" class="input box-shadow" name="vinyl_album_cover" placeholder="  Cover (URL / any image format)" />
                    <br>
                    <input type="number" min="1500" max="2500" value="2000" class="input box-shadow" name="vinyl_year" placeholder="  Album Year" />
                    <br>
                    <textarea  name="vinyl_note" class="input box-shadow" style="min-height: 100px" placeholder=" Note..."></textarea>

                    <div class="space-between">
                        <div>
                            <span class="text-light-blue" >Condition</span><br>
                            <input style="margin: 5px 0 0 0;padding: 0" type="radio" name="vinyl_condition" value="1"/>
                            <input style="margin: 0;padding: 0" type="radio" name="vinyl_condition" value="2"/>
                            <input style="margin: 0;padding: 0" type="radio" name="vinyl_condition" value="3"/>
                            <input style="margin: 0;padding: 0" type="radio" name="vinyl_condition" value="4"/>
                            <input style="margin: 0;padding: 0" type="radio" name="vinyl_condition" value="5"/>
                            <input style="margin: 0;padding: 0" type="radio" name="vinyl_condition" value="6"/>
                        </div>
                        <button class="button margin-v-20 box-shadow" style="width: 150px">Add</button>
                    </div>

                </form>
            </div>
        </div>




        <!--footer -------------->
        <jsp:include page="./includes/footer.jsp" />
        <script>
            var form = document.forms["add_vinyl"];
            form.vinyl_album_cover.onblur = () => {
                document.querySelector("#vinyl_logo").src = form.vinyl_album_cover.value;
            }
        </script>

    </body>
</html>
