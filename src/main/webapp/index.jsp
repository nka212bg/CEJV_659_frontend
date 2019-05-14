<%@page import="util.Props"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
    <!--header -------------->
    <jsp:include page='./includes/header.jsp'>
        <jsp:param name="title" value="ServiceDocker | Home"/>
    </jsp:include>

    <body>
        <!--header menu -------------->
        <jsp:include page="./includes/header_menu.jsp" />

        <!--mid menu -------------->
        <!--<div class="bg-light-blue" style="width: 100%; height: 350px;"></div><br/>-->
        <div class="center-div padding-30" style="width: 100%">


            <div class="vertica-align-flex text-light-blue">

                <div>
                    <a href="?industry_pool" class="a capitalize" style="width: 150px; margin-right: 30px" i18n="company_pool"></a>
                    <a href="?service_pool" class="a capitalize" style="width: 150px; margin-right: 30px" i18n="service_pool"></a>

                </div>
                <div><i title="Search" onclick="search()" class="icon a"></i>
                    <input onclick="search()" type="text" id="serch_bar" class="search-bar a" i18n="search_by_content" autocomplete="off"/>
                </div>

            </div>
            <br/>

            <!--${props.getGeolocation(pageContext.request)[0]}-->
            <!--${props.getGeolocation(pageContext.request)[1]}-->
            <!--${props.getGeolocation(pageContext.request)[2]}-->

            <div class="cards-container" data-masonry='{ "columnWidth": 80, "itemSelector": ".card-base" }'>

                <c:choose>
                    <c:when test='${pageContext.request.parameterMap.containsKey("service_pool")}'>
                        <!--Service card -------------->
                        <c:forEach var="entry" items="${get_home.getAllServices()}" >
                            <!--card -------------->
                            <div class="card-base">
                                <!--background image -------------->
                                <img onerror="this.src='${pageContext.request.contextPath}/service_portal_data/users/profileImage.jpg'" 
                                     src="${pageContext.request.contextPath}/service_portal_data/users/${entry.client_user_id}/profileImage.jpg" class="card-bg-img"/>
                                <div class="padding-15">
                                    <!--logo image -------------->
                                    <img onerror="this.src='${pageContext.request.contextPath}/service_portal_data/users/logo.jpg'" 
                                         src="${pageContext.request.contextPath}/service_portal_data/users/${entry.client_user_id}/logo.jpg" class="card-logo" />
                                    <p class="uppercase" text="${entry.service_title}">${entry.service_title}</p>
                                    <p class="text-grey">${entry.date_request}</p>
                                    <p class="text-justify text-grey search-handle" text="${entry.service_description}">${entry.service_description}</p><br />
                                    <div class="services flex-wrap">${entry.services}</div>
                                    <div style="height: 0px" class="bg-very-lightgray margin-v-20"></div>

                                    <br/><br/>
                                    <div style="margin-bottom: 8px;font-size: 0.9em">
                                        <a href="https://www.google.com/maps/place/${entry.address}" title="Open in Google Maps" target="_blank"><span>
                                                <i class="a icon text-blue"></i></span>
                                            <span class="text_auto_05_black">${entry.address}</span></a>
                                    </div>
                                    <br/>
                                    <div class="space-between">
                                        <a href="propose.jsp?service_id=${entry.service_id}" class="button padding-5 box-shadow">Send a proposal</a>
                                        <!--<a title="Add to favorites" class="a icon"></a>-->
                                    </div>
                                </div>
                            </div><!--end card -------------->
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <!--Industry card -------------->
                        <c:forEach var="entry" items="${get_home.getAllIndustries()}" >
                            <!--card -------------->
                            <div class="card-base" >
                                <img class="card-bg-img" src="${pageContext.request.contextPath}/service_portal_data/users/${entry.user_id}/industries/${entry.industry_id}/industry_cover.jpg"  onerror="this.src='${pageContext.request.contextPath}/service_portal_data/users/profileImage.jpg'"/>
                                <div class="padding-15">
                                    <img onerror="this.style.display='none'" src="${pageContext.request.contextPath}/service_portal_data/users/${entry.user_id}/logo.jpg" class="card-logo" />
                                    <p class="uppercase" text="${entry.industry_title}">${entry.industry_title}</p>
                                    <p class="text-justify search-handle" text="${entry.description}">${entry.description}</p><br />
                                    <div class="services flex-wrap">${entry.services}</div>
                                    <div style="height: 0px" class="bg-very-lightgray margin-v-20"></div>
                                    <div class="space-between">
                                        <span>Provider rating</span>
                                        <!--<span>Rank</span>-->
                                        <span><i class="a icon text-blue" title="Revues"></i></span>                     
                                    </div>
                                    <div class="space-between">
                                        <span><i class="icon text-orange rating" style="font-size: 90%;" title="${entry.rating} ">${entry.rating}</i></span>
                                        <!--<span class="text-grey">${entry.rank}</span>-->
                                        <span>${entry.feedbacks}</span>
                                    </div><br /><br />
                                    <div style="margin-bottom: 8px;font-size: 0.9em">
                                        <div style="margin-bottom: 8px;">
                                            <a href="https://www.google.com/maps/place/${entry.address}" title="Open in Google Maps" target="_blank"><span>
                                                    <i class="a icon text-blue"></i></span>
                                                <span class="text_auto_05_black">${entry.address}</span></a>
                                        </div>
                                        <div style="margin-bottom: 8px;"><i class="icon text-blue"> </i><span class="text_auto_05_black">${entry.phone}</span></div>
                                        <div style="margin-bottom: 8px;">
                                            <a onclick="transformUrl(this)" href="//${entry.industry_website}" target="_blank">
                                                <i class="icon text-blue"> </i><span class="text_auto_05_black">${entry.industry_website}</span> 
                                            </a>
                                        </div><br/>
                                    </div>
                                    <div class="space-between">
                                        <a href="" class="button padding-5 box-shadow">View company profile</a>
                                        <!--<a title="Add to favorites" class="a icon"></a>-->
                                    </div>
                                </div>
                            </div><!--end card -------------->
                        </c:forEach>
                    </c:otherwise>
                </c:choose>



            </div>
        </div>


        <!--footer -------------->
        <jsp:include page="./includes/footer.jsp" />

        <!--home cards sort and filters -------------->
        <script>

            'use strict';


            var searchBar = document.getElementById("serch_bar");
            searchBar.onblur = () => {
                searchBar.placeholder = set_locale().getI18n().search_by_content;
            };
            function search() {
                searchBar.focus();
                searchBar.placeholder = "";
                searchBar.onkeyup = () => {
                    var searchBarValue = searchBar.value.toLowerCase().trim();
                    if (searchBarValue !== "") {
                        document.querySelectorAll(".card-base").forEach((e) => {
                            var title = e.querySelector(".uppercase").getAttribute("text").toLowerCase();
                            var description = e.querySelector(".search-handle").getAttribute("text");
                            var service_item = e.querySelectorAll(".service_item");

                            var titleWordStart = title.indexOf(searchBarValue);
                            if (titleWordStart !== -1) {
                                var wordLength = searchBarValue.length;
                                var front = title.substring(0, titleWordStart);
                                var back = title.substring(titleWordStart + wordLength, title.lenght);
                                var readyString = front + '<b class="text_funky">' + searchBarValue + '</b>' + back;
                                e.querySelector(".uppercase").innerHTML = readyString;
                            }
                            var descriptionWordStart = description.indexOf(searchBarValue);
                            if (descriptionWordStart !== -1) {
                                var wordLength = searchBarValue.length;
                                var front = description.substring(0, descriptionWordStart);
                                var back = description.substring(descriptionWordStart + wordLength, description.lenght);
                                var readyString = front + '<b class="text_funky">' + searchBarValue + '</b>' + back;
                                e.querySelector(".search-handle").innerHTML = readyString;
                            }
                            service_item.forEach((q) => {
                                var text = q.getAttribute("text").toLowerCase();

                                //*TODO ------------*/
                                if (!text.includes(searchBarValue) && !title.includes(searchBarValue) && !description.toLowerCase().includes(searchBarValue)) {
                                    e.style.display = "none";
                                }

                                if (title.includes(searchBarValue) || description.toLowerCase().includes(searchBarValue) || text.includes(searchBarValue)) {
                                    e.style.display = "block";

                                    var serviceWordStart = text.indexOf(searchBarValue);
                                    if (serviceWordStart !== -1) {
//                                      console.log(text + " --- " + title + " --- " + description + " --- " + searchBarValue);
                                        var wordLength = searchBarValue.length;
                                        var front = text.substring(0, serviceWordStart);
                                        var back = text.substring(serviceWordStart + wordLength, text.lenght);
                                        var readyString = front + '<b class="text_funky">' + searchBarValue + '</b>' + back;
                                        q.innerHTML = readyString;
                                    }

                                }

                            });

                        });
                        cardsLoader();
                    }
                }
            }



        </script>

    </body>
</html>













