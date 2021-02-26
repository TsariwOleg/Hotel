<% String strContextPath = request.getContextPath();%>
<% String idRoom = request.getParameter("id");%>

<%@ include file="myAccount/directive/taglib.jspf" %>



<%@ page import="hotel.enums.ClassOfTheRoom" %>
<%@ page import="hotel.enums.Role" %>
<%@ page import="hotel.util.PopularFacilitiesToEntity" %>
<%@ page import="java.util.List" %>

<% List<PopularFacilitiesToEntity.RowOfPopularFacilitiesToEntity> rowOfPopularFacilitiesToEntityList =
        hotel.util.PopularFacilitiesToEntity.getListOfAmenitiesOfRoom();%>



<!DOCTYPE html>
<html>

<head>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="<%=strContextPath%>/view/style/stars.css">
    <link rel="stylesheet" href="<%=strContextPath%>/view/style/modalWindow.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">


    <style>
        body {
            height: 10000px;
        }
    </style>
</head>

<body>
<form action="<%=strContextPath%>/signIn" method="post">
    <jsp:include page="myAccount/includedPage/navbar.jsp"/>


</form>

<div class="container">
    <div class="row mt-5 pt-5">
        <div class="col-1"></div>
        <div class="col-10">
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">

                <div class="carousel-inner" role="listbox">

                    <div class="carousel-item active">
                        <img class="d-block w-100"   src="data:image/jpg;base64,${room.strMainPhoto}"   alt="900x400" data-holder-rendered="true" style="width: 900px; height: 400px;">
                    </div>

                    <c:forEach items="${room.strPhotos}" var="roomPhoto">
                        <div class="carousel-item">
                            <img class="d-block w-100" src="data:image/jpg;base64,${roomPhoto}" alt="900x400" data-holder-rendered="true" style="width: 900px; height: 400px;">
                        </div>
                    </c:forEach>
                </div>

                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>

                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>

        </div>
        <div class="col-1"></div>
    </div>

    <div class="row  mt-5">

        <div class="col-4 ml-5 pl-4">


            <jsp:include page="myAccount/includedPage/name_of_room.jsp">
                <jsp:param name="count_of_clients" value="${room.countOfClient}"/>
            </jsp:include>


            <p class="ml-2 mt-2">
                <c:choose>
                    <c:when test="${sessionScope.role ne Role.MANAGER.name()}">
                        <fmt:message key="rooms_jsp.class_of_the_room"/> -
                        <fmt:message key="class_of_the_room.${room.classOfTheRoom.name().toLowerCase()}"/>
                    </c:when>
                    <c:otherwise>
                        <a class="btn btn-link" data-toggle="collapse" href="#collapseEditClass" aria-expanded="false"
                           aria-controls="collapseExample">
                            <fmt:message key="rooms_jsp.class_of_the_room"/>
                            -
                            <fmt:message key="class_of_the_room.${room.classOfTheRoom.name().toLowerCase()}"/>
                        </a>
                    </c:otherwise>
                </c:choose>
            </p>

            <form method="post" onsubmit='redirect();return false;'>
                <div class="collapse" id="collapseEditClass">
                    <div class="card card-body border-0">
                        <div class="container">

                            <div class="row">
                                <div class="col-12">
                                    <select name="edit_class_of_room" class="custom-select" required>
                                        <option value="" selected disabled hidden><fmt:message key="room_jsp.choose_class_of_the_room"/></option>
                                        <option value="${ClassOfTheRoom.ECONOMY.name()}"><fmt:message key="class_of_the_room.economy"/></option>
                                        <option value="${ClassOfTheRoom.STANDARD.name()}"><fmt:message key="class_of_the_room.standard"/></option>
                                        <option value="${ClassOfTheRoom.SUPERIOR.name()}"><fmt:message key="class_of_the_room.superior"/></option>
                                        <option value="${ClassOfTheRoom.PREMIUM.name()}"><fmt:message key="class_of_the_room.premium"/></option>
                                    </select>
                                </div>
                            </div>

                            <div class="row mt-2">
                                <div class="col-7"></div>
                                <div class="col-5">
                                    <input type="submit" name="edit" class="btn btn-primary"
                                           value=" <fmt:message key="edit"/>">
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </form>





            <hr>
            <p class="ml-2">
                <c:choose>
                    <c:when test="${sessionScope.role ne Role.MANAGER.name()}">
                        <fmt:message key="room_jsp.price"/> - ${room.price}
                    </c:when>
                    <c:otherwise>
                        <a class="btn btn-link" data-toggle="collapse" href="#collapseEditPrice"
                           aria-expanded="false"
                           aria-controls="collapseExample">
                            <fmt:message key="room_jsp.price"/>- ${room.price}
                        </a>
                    </c:otherwise>
                </c:choose>
            </p>


            <form method="post" onsubmit='redirect();return false;'>
                <div class="collapse" id="collapseEditPrice">
                    <div class="card card-body border-0">
                        <div class="container">
                            <div class="row">
                                <div class="col-12">
                                    <label for="priceRangeNumber">
                                        <div class="form-group">
                                            <input type="number" class="form-control" id="priceRangeNumber"
                                                   placeholder="Example input"
                                                   name="price" min="1">
                                        </div>
                                    </label>
                                    <input type="range" class="custom-range" id="priceRange" min="1" max="1000" step="2">       </div>
                            </div>

                            <div class="row mt-2">
                                <div class="col-7"></div>
                                <div class="col-5">
                                    <input type="submit" name="edit" class="btn btn-primary"
                                           value=" <fmt:message key="edit"/>">
                                </div>
                            </div>

                        </div>

                    </div>
                </div>
            </form>


            <hr>
            <p class="ml-2">
                <c:choose>
                    <c:when test="${sessionScope.role ne Role.MANAGER.name()}">
                        <fmt:message key="room_jsp.room_number"/> - ${room.roomNumber}
                    </c:when>
                    <c:otherwise>
                        <a class="btn btn-link" data-toggle="collapse" href="#collapseEditRoomNumber"
                           aria-expanded="false"
                           aria-controls="collapseExample">
                            <fmt:message key="room_jsp.room_number"/>- ${room.roomNumber}
                        </a>
                    </c:otherwise>
                </c:choose>
            </p>


            <form method="post" onsubmit='redirect();return false;'>
                <div class="collapse" id="collapseEditRoomNumber">
                    <div class="card card-body border-0">
                        <div class="container">
                            <div class="row">
                                <div class="col-12">
                                    <input name="room_number" class="form-control mr-sm-2 mt-2" type="number">
                                </div>
                            </div>

                            <div class="row mt-2">
                                <div class="col-7"></div>
                                <div class="col-5">
                                    <input type="submit" name="edit" class="btn btn-primary"
                                           value=" <fmt:message key="edit"/>">
                                </div>
                            </div>

                        </div>

                    </div>
                </div>
            </form>


            <hr>
            <p class="ml-2">
                <c:choose>
                    <c:when test="${sessionScope.role ne Role.MANAGER.name()}">
                        <fmt:message key="room_jsp.count_of_clients"/> -${room.countOfClient}
                    </c:when>
                    <c:otherwise>
                        <a class="btn btn-link" data-toggle="collapse" href="#collapseEditCountOfClients"
                           aria-expanded="false"
                           aria-controls="collapseExample" id="count_of_clientss">
                            <fmt:message key="room_jsp.count_of_clients"/>- ${room.countOfClient}
                        </a>
                    </c:otherwise>
                </c:choose>

                <label for="count_of_clientss">
                    <c:forEach begin="1" end="${room.countOfClient}" varStatus="loop">
                        <img src="resources/rooms_icon/user.png">
                    </c:forEach>
                </label>
            </p>

            <form method="post" onsubmit='redirect();return false;'>
                <div class="collapse" id="collapseEditCountOfClients">
                    <div class="card card-body border-0">
                        <div class="container">
                            <div class="row">
                                <div class="col-12">
                                    <select name="count_of_client" class="custom-select">
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                    </select>
                                </div>
                            </div>

                            <div class="row mt-2">
                                <div class="col-7"></div>
                                <div class="col-5">
                                    <button class="btn btn-primary" name="edit" type="submit">
                                        <fmt:message key="edit"/>
                                    </button>
                                </div>
                            </div>

                        </div>

                    </div>
                </div>
            </form>
            <hr>

            <p class="ml-2">
                <c:choose>
                    <c:when test="${sessionScope.role ne Role.MANAGER.name()}">
                        <strong><fmt:message key="room_jsp.description"/></strong>
                    </c:when>
                    <c:otherwise>
                        <a class="btn btn-link" data-toggle="collapse" href="#collapseEditDescription"
                           aria-expanded="false"
                           aria-controls="collapseExample">
                            <fmt:message key="room_jsp.description"/>
                        </a>
                    </c:otherwise>
                </c:choose>
            </p>
            <p>${room.description}</p>


            <form method="post" onsubmit='redirect();return false;'>
                <div class="collapse" id="collapseEditDescription">
                    <div class="card card-body border-0">
                        <div class="container">
                            <div class="row">
                                <div class="col-12">
                                <textarea name="description" class="form-control" rows="3"
                                          style=" resize: none;"   minlength="200" maxlength="500"></textarea>

                                </div>
                            </div>

                            <div class="row mt-2">
                                <div class="col-7"></div>
                                <div class="col-5">
                                    <button class="btn btn-primary" name="edit" type="submit">
                                        <fmt:message key="edit"/>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <hr>

            <p class="ml-2">
                <c:choose>
                    <c:when test="${sessionScope.role ne Role.MANAGER.name()}">
                        <strong><fmt:message key="room_jsp.additional_services"/></strong>

                    </c:when>
                    <c:otherwise>
                        <a class="btn btn-link" data-toggle="collapse" href="#collapseEditAdditionalService"
                           aria-expanded="false"
                           aria-controls="collapseExample">
                            <fmt:message key="room_jsp.additional_services"/>
                        </a>
                    </c:otherwise>
                </c:choose>
            </p>

            <p> ${room.additionalServices}</p>

            <form method="post" onsubmit='redirect();return false;'>
                <div class="collapse" id="collapseEditAdditionalService">
                    <div class="card card-body border-0">
                        <div class="container">
                            <div class="row">
                                <div class="col-12">
                                <textarea name="additional_services" class="form-control" rows="3"    minlength="100" maxlength="300"
                                          style=" resize: none;"></textarea>
                                </div>
                            </div>

                            <div class="row mt-2">
                                <div class="col-7"></div>
                                <div class="col-5">
                                    <button class="btn btn-primary" data-target=".bd-example-modal-lg" name="edit"
                                            type="submit">
                                        <fmt:message key="edit"/>
                                    </button>
                                </div>
                            </div>

                        </div>

                    </div>
                </div>
            </form>

        </div>

        <div class="col-7 ">
            <div class="container">

                <c:if test="${sessionScope.role eq Role.CLIENT.name()}">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title"><fmt:message key="room_jsp.book_this_room"/></h4>

                                <c:choose>
                                    <c:when test="${sessionScope.role eq Role.CLIENT.name()}">
                                        <a href="<%=strContextPath%>/order?id=<%=idRoom%>" class="btn btn-primary">
                                            <fmt:message key="room_jsp.book"/>
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="<%=strContextPath%>/signIn" class="btn btn-primary">
                                            <fmt:message key="room_jsp.book"/></a>
                                    </c:otherwise>
                                </c:choose>

                            </div>
                        </div>
                    </div>
                </div>
                </c:if>

                <div class="row  mt-1">
                    <div class="col-12">
                        <div class="card">

                            <div class="card-body">
                                <h4 class="card-title"><fmt:message key="room_jsp.most_popular_facilities"/></h4>

                                <ul>
                                    <li>${room.areaOfRoom} <img src="resources/rooms_icon/plan.png"></li>
                                    <c:forEach items="${best_facilities}" var="best_facility">
                                        <li><fmt:message key="amenities.${best_facility.resourceName}"/>

                                      <img src="${best_facility.path}"></li>
                                    </c:forEach>
                                </ul>


                                <c:if test="${sessionScope.role eq Role.MANAGER.name()}">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-7"></div>
                                            <div class="col-5">
                                                <button type="button" class="btn btn-primary" data-toggle="modal"
                                                        data-target="#myModal">
                                                    <fmt:message key="edit"/>
                                                </button>
                                            </div>

                                        </div>
                                    </div>
                                </c:if>

                            </div>
                        </div>
                    </div>
                </div>

                <div class="row mt-1">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title"><fmt:message key="room_jsp.most_popular_facilities"/></h4>

                                <c:set var="comfortable" value=" ${20*room.totalPoint.comfortable}"/>
                                <div class="row">
                                    <div class="col-3 "><fmt:message key="room_jsp.comfortable"/></div>
                                    <div class="col-5 mt-2 mr-0">

                                        <div class="progress">
                                            <div class="progress-bar" role="progressbar" style="width: ${comfortable}%"
                                                 aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        ${room.totalPoint.comfortable}
                                    </div>
                                </div>


                                <c:set var="fortunes" value=" ${20*room.totalPoint.fortunes}"/>
                                <div class="row mt-2">
                                    <div class="col-3 pr-1"><fmt:message key="room_jsp.fortunes"/></div>
                                    <div class="col-5 mt-2">
                                        <div class="progress">
                                            <div class="progress-bar" role="progressbar" style="width: ${fortunes}%"
                                                 aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        ${room.totalPoint.fortunes}
                                    </div>
                                </div>

                                <c:set var="soundproof" value=" ${20*room.totalPoint.soundproof}"/>
                                <div class="row mt-2">
                                    <div class="col-3 pr-1"><fmt:message key="room_jsp.soundproof"/></div>
                                    <div class="col-5 mt-2">
                                        <div class="progress">

                                            <div class="progress-bar" role="progressbar" style="width: ${soundproof}%"
                                                 aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        ${room.totalPoint.soundproof}
                                    </div>
                                </div>


                                <c:set var="service" value=" ${20*room.totalPoint.service}"/>
                                <div class="row mt-2">
                                    <div class="col-3 pr-1"><fmt:message key="room_jsp.service"/></div>
                                    <div class="col-5 mt-2">
                                        <div class="progress">
                                            <div class="progress-bar" role="progressbar" style="width: ${service}%"
                                                 aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        ${room.totalPoint.service}
                                    </div>
                                </div>


                                <p class="mt-1">
                                    <a class="btn btn-primary mt-2" data-toggle="collapse" href="#collapseExample"
                                       aria-expanded="false" aria-controls="collapseExample">
                                        <fmt:message key="room_jsp.show_all_reviews"/>
                                    </a>

                                </p>

                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </div>


    </div>

    <div class="row mt-2">
        <div class="col-12">

            <div class="collapse" id="collapseExample">
                <div class="card card-body">

                    <div class="row">
                        <div class="col-9"></div>
                        <div class="col-2">


                            <c:if test="${sessionScope.role eq Role.CLIENT.name()}">
                                <button class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-lg">
                                    <fmt:message key="room_jsp.write_review"/>
                                </button>
                            </c:if>

                        </div>
                    </div>


                    <c:forEach items="${reviews}" var="review">
                        <div class="row mt-2">


                            <div class="col-5">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-12">
                                            <h3><img src="<%=strContextPath%>/resources/rooms_icon/user.png">
                                                    ${review.user.name} ${review.user.surname}</h3>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-12">
                                            <p class="text-muted">
                                                    ${review.date}
                                            </p>
                                        </div>
                                    </div>

                                    <c:if test="${review.categoryReviews.comfortable!=0}">
                                        <div class="row">
                                            <div class="col-12">

                                                <div class="container">
                                                    <div class="row">

                                                        <div class="col-5">
                                                            <fmt:message key="room_jsp.comfortable"/> :
                                                        </div>

                                                        <div class="col-7">
                                                            <c:forEach begin="1"
                                                                       end="${review.categoryReviews.comfortable}"
                                                                       varStatus="loop">
                                                                <img src="<%=strContextPath%>/resources/rooms_icon/star.png">
                                                            </c:forEach>
                                                        </div>

                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </c:if>

                                    <c:if test="${review.categoryReviews.fortunes!=0}">
                                        <div class="row">
                                            <div class="col-12">

                                                <div class="container">
                                                    <div class="row">

                                                        <div class="col-5">
                                                            <fmt:message key="room_jsp.fortunes"/> :
                                                        </div>

                                                        <div class="col-7">
                                                            <c:forEach begin="1"
                                                                       end="${review.categoryReviews.fortunes}"
                                                                       varStatus="loop">
                                                                <img src="<%=strContextPath%>/resources/rooms_icon/star.png">
                                                            </c:forEach>
                                                        </div>

                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </c:if>

                                    <c:if test="${review.categoryReviews.soundproof!=0}">
                                        <div class="row">
                                            <div class="col-12">

                                                <div class="container">
                                                    <div class="row">

                                                        <div class="col-5">
                                                            <fmt:message key="room_jsp.soundproof"/> :
                                                        </div>

                                                        <div class="col-7">
                                                            <c:forEach begin="1"
                                                                       end="${review.categoryReviews.soundproof}"
                                                                       varStatus="loop">
                                                                <img src="<%=strContextPath%>/resources/rooms_icon/star.png">
                                                            </c:forEach>
                                                        </div>

                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </c:if>


                                    <c:if test="${review.categoryReviews.service!=0}">
                                        <div class="row">
                                            <div class="col-12">

                                                <div class="container">
                                                    <div class="row">

                                                        <div class="col-5">
                                                            <fmt:message key="room_jsp.service"/> :
                                                        </div>

                                                        <div class="col-7">
                                                            <c:forEach begin="1" end="${review.categoryReviews.service}"
                                                                       varStatus="loop">
                                                                <img src="<%=strContextPath%>/resources/rooms_icon/star.png">
                                                            </c:forEach>
                                                        </div>

                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </c:if>


                                </div>
                            </div>

                            <div class="col-7">
                                <div class="card">
                                    <div class="card-body">
                                            ${review.review}

                                    </div>
                                </div>
                            </div>


                        </div>
                        <hr>
                    </c:forEach>


                </div>
            </div>


        </div>
    </div>


</div>
<form method="post" onsubmit='redirect();return false;'>
    <div class="modal fade" id="myModal">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Modal Heading</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <div class="container">
                        <div class="row mt-4">

                            <div class="col-12">
                                <fmt:message key="add_new_room_jsp.best_amenities"/>
                                <div class="container mt-2">

                                    <c:forEach items="<%=rowOfPopularFacilitiesToEntityList%>" var="amenity_of_room">


                                        <div class="row">
                                            <div class="col-4">
                                                <div class="custom-control custom-checkbox">
                                                    <input name="case" type="checkbox" class="custom-control-input"
                                                           id="${amenity_of_room.firstCol.id}"
                                                           value="${amenity_of_room.firstCol.enumName}">
                                                    <label class="custom-control-label"
                                                           for="${amenity_of_room.firstCol.id}">
                                                        <fmt:message key="amenities.${amenity_of_room.firstCol.resourceName}"/>

                                                        <img
                                                                src="<%=strContextPath%>/${amenity_of_room.firstCol.path}"></label>
                                                </div>
                                            </div>

                                            <c:if test="${not empty amenity_of_room.secondCol}">
                                                <div class="col-4">
                                                    <div class="custom-control custom-checkbox">
                                                        <input name="case" type="checkbox" class="custom-control-input"
                                                               id="${amenity_of_room.secondCol.id}"
                                                               value="${amenity_of_room.secondCol.enumName}">
                                                        <label class="custom-control-label"
                                                               for="${amenity_of_room.secondCol.id}">
                                                            <fmt:message key="amenities.${amenity_of_room.secondCol.resourceName}"/>

                                                            <img
                                                                    src="<%=strContextPath%>/${amenity_of_room.secondCol.path}"></label>
                                                    </div>
                                                </div>
                                            </c:if>


                                            <c:if test="${not empty amenity_of_room.thirdCol}">
                                                <div class="col-4">
                                                    <div class="custom-control custom-checkbox">
                                                        <input name="case" type="checkbox" class="custom-control-input"
                                                               id="${amenity_of_room.thirdCol.id}"
                                                               value="${amenity_of_room.thirdCol.enumName}">
                                                        <label class="custom-control-label"
                                                               for="${amenity_of_room.thirdCol.id}">
                                                            <fmt:message key="amenities.${amenity_of_room.thirdCol.resourceName}"/>

                                                            <img
                                                                    src="<%=strContextPath%>/${amenity_of_room.thirdCol.path}"></label>
                                                    </div>
                                                </div>
                                            </c:if>

                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary" name="edit">
                        <fmt:message key="edit"/>
                    </button>
                </div>

            </div>
        </div>
    </div>
</form>

<form method="post" onsubmit='redirect();return false;'>
    <jsp:include page="myAccount/includedPage/modal_window_review.jsp"/>
</form>

<script src="https://kit.fontawesome.com/d155946f1a.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/holder/2.9.7/holder.min.js"
        integrity="sha512-O6R6IBONpEcZVYJAmSC+20vdsM07uFuGjFf0n/Zthm8sOFW+lAq/OK1WOL8vk93GBDxtMIy6ocbj6lduyeLuqQ=="
        crossorigin="anonymous"></script>

<script src="<%=strContextPath%>/view/js/filter.js"></script>



</body>

</html>