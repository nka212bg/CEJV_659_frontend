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
            <a href="${pageContext.request.contextPath}/add_vinyl.jsp" class="a"> 
                <i class="icon center-div" style="font-size: 10em"></i>
                <p>You have no vinyls in this collection</p>
            </a>
        </div>




        <div class="padding-30 display-flex" style="border-radius: 5px">

            <div  style="width: 300px; min-width: 300px; height: auto; background: white; position: relative" class="border_radius box-shadow">
                <img class="cover_collection" src="https://www.backpackerguide.nz/wp-content/uploads/2017/06/Hole-in-the-Rock-Bay-of-Islands_optimized.jpg"/>

                <div style="position: absolute; background: #262b2f; padding: 12px 0px 4px 0px; border-radius: 5px; margin: 10px; z-index: 1; display: inline-block">
                    <a href="#"><i class="icon a padding-10"></i></a>
                </div>
                <div class="padding-30" style="margin-top: 300px;">
                    <h2 class="first_upper">my first vinyl collection</h2>


                    <p class="first_upper">rock</p>
                    <p style="text-align: justify">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker</p>

                </div>
            </div>  



            <div style="flex-flow: column wrap; margin-left: 30px;">

                <div class="box-shadow space-between collection" >
                    <img class="cover_item" src="http://celebrities-entertainment.com/wp-content/uploads/2018/02/ACDC.jpg"/>
                    <div class="padding-30 content_item">
                        <div class="space-between">
                            <h2 class="uppercase">AC/DC</h2>
                            <div style="margin-top: -51px; margin-right: -15px; background: lightgray; padding: 12px 0px 4px 0px; border-radius: 5px;">
                                <a href="#"><i class="icon a padding-10"></i></a>
                            </div>
                        </div>
                        <p class="first_upper bubble">highway to hell</p>
                        <p style="text-align: justify">Highway to Hell is the sixth studio album by Australian hard rock band AC/DC, released on 27 July 1979. </p>
                        <p>Condition: <i class="icon text-orange"></i></p>
                    </div>
                </div>  
                <div class="box-shadow space-between collection" >
                    <img class="cover_item" src="https://yt3.ggpht.com/a/AGF-l79WSPLn3UGcb73xJdchzQtGcrkZJ7Rlw-s3wQ=s900-mo-c-c0xffffffff-rj-k-no"/>
                    <div class="padding-30 content_item">
                        <div class="space-between">
                            <h2 class="uppercase">ace of base</h2>
                            <div style="margin-top: -51px; margin-right: -15px; background: lightgray; padding: 12px 0px 4px 0px; border-radius: 5px;">
                                <a href="#"><i class="icon a padding-10"></i></a>
                            </div>
                        </div>
                        <p class="first_upper bubble">Happy Nation</p>
                        <p style="text-align: justify">Ace of Base was a Swedish pop group, originally consisting of Ulf Ekberg and three siblings: Jonas Berggren, Linn Berggren and Jenny Berggren.</p>
                        <p>Condition: <i class="icon text-orange"></i></p>
                    </div>
                </div> 
                <div class="box-shadow space-between collection" >
                    <img class="cover_item" src="https://addons-media.operacdn.com/media/CACHE/images/themes/15/58415/1.0-rev1/images/7a92eb7b-b3e8-4dd8-bcdb-e2ce9bef2146/dc5cdd852cb8dfc06133ee0ac800646b.jpg"/>
                    <div class="padding-30 content_item">
                        <div class="space-between">
                            <h2 class="uppercase">manowar</h2>
                            <div style="margin-top: -51px; margin-right: -15px; background: lightgray; padding: 12px 0px 4px 0px; border-radius: 5px;">
                                <a href="#"><i class="icon a padding-10"></i></a>
                            </div>
                        </div>
                        <p class="first_upper bubble">Warriors of the World</p>
                        <p style="text-align: justify">Manowar is an American heavy metal band from Auburn, New York. Formed in 1980, the group is known for lyrics based on fantasy and mythology. The band is also known for a loud and bombastic sound.</p>
                        <p>Condition: <i class="icon text-orange"></i></p>
                    </div>
                </div> 


            </div>

        </div>



        <!--footer -------------->
        <div style="position: fixed; bottom: 0; right: 0"><jsp:include page="./includes/footer.jsp" /></div>
    </body>
</html>
