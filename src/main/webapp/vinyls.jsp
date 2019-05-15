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




        <div class="space-between">
            <div style="position: relative; width: 200px; height: 100%; background: white">

            </div>



            <div id="collections" style="width: 100%; padding-top: 40px">

                <div class="center-div box-shadow space-between collection" style="margin-bottom: 30px !important">
                    <img class="cover_item" src="http://celebrities-entertainment.com/wp-content/uploads/2018/02/ACDC.jpg"/>
                    <div class="padding-30 content_item">
                        <div class="space-between">
                            <h2 class="uppercase">AC/DC</h2>
                            <div style="margin-top: -60px; margin-right: -26px;">
                                <a href="#"><i class="icon a padding-10"></i></a>
                            </div>
                        </div>
                        <p class="first_upper bubble">highway to hell</p>
                        <p style="text-align: justify">Highway to Hell is the sixth studio album by Australian hard rock band AC/DC, released on 27 July 1979. It was the band's fifth studio album released internationally and the sixth to be released in Australia. It was the last album featuring lead singer Bon Scott, who died early the following year on 19 February 1980</p>
                        <p>Condition: <i class="icon text-orange"></i></p>
                    </div>
                </div>  

            </div>  


        </div>



        <!--footer -------------->
        <div style="position: fixed; bottom: 0; right: 0"><jsp:include page="./includes/footer.jsp" /></div>
    </body>
</html>
