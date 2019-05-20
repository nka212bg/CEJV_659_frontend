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



        <div class="mid-div hidden" id="empty_page">
            <a href="./add_vinyl.jsp" class="a"> 
                <i class="icon center-div" style="font-size: 10em"></i>
                <p>You have no vinyls in this collection</p>
            </a>
        </div>




        <div class="padding-30 display-flex" style="border-radius: 5px">

            <div for="'http://localhost:8080/CEJV__659_backend/api/collections/get_collection/' + window.location.search.split('=')[1]" style="width: 300px; min-width: 300px; height: auto; background: white; position: relative" class="border_radius box-shadow">
                <img class="cover_collection" src="{{collection_cover}}"/>

                <div style="position: absolute; background: #262b2f; padding: 12px 0px 4px 0px; border-radius: 5px; margin: 10px; z-index: 1; display: inline-block">
                    <a onclick="this.href = './edit_collection.jsp?id=' + window.location.search.split('=')[1]" ><i class="icon a padding-10" title="edit collection"></i></a>
                </div>
                <div class="padding-30" style="margin-top: 300px;">
                    <h2 class="first_upper">{{collection_name}}</h2>


                    <p class="first_upper">{{collection_genre}}</p>
                    <p style="text-align: justify">{{collection_note}}</p>

                </div>
            </div>  



            <div for="'http://localhost:8080/CEJV__659_backend/api/vinyls/get_all_vinyls/' + window.location.search.split('=')[1]"  style="flex-flow: column wrap; margin-left: 30px;">

                <div class="box-shadow space-between collection" >
                    <img class="cover_item" src="{{vinyl_album_cover}}"/>
                    <div class="padding-30 content_item">
                        <div class="space-between">
                            <h2 class="uppercase">{{vinyl_artist_name}}</h2>
                            <div style="margin-top: -51px; margin-right: -15px; background: lightgray; padding: 12px 0px 4px 0px; border-radius: 5px;">
                                <a href="./edit_vinyl.jsp?id={{vinyl_id}}"><i class="icon a padding-10"></i></a>
                            </div>
                        </div>
                        <p class="first_upper bubble">{{vinyl_album_name}} / {{vinyl_year}}</p>
                        <p style="text-align: justify">{{vinyl_note}}</p>
                        <p>Condition: <i class="icon text-orange">{{vinyl_condition}}</i></p>
                    </div>
                </div>  


            </div>

        </div>

        <!--footer -------------->
        <jsp:include page="./includes/footer.jsp" />
    </body>
</html>
