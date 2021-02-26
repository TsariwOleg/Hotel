<% String strContextPath = request.getContextPath();%>
<% String strQuery = request.getQueryString().replaceAll("page=\\d+", "");%>
<%@ page import="hotel.enums.ClassOfTheRoom" %>
<%@ page import="hotel.enums.Role" %>

<%@ page language="java" contentType="text/html;charset=UTF-8" %>

<%@ include file="myAccount/directive/taglib.jspf" %>

<!DOCTYPE html>
<html>

<head>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="<%=strContextPath%>/view/style/modalWindow.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <link rel="stylesheet" href="<%=strContextPath%>/view/style/calendar.css">

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css">


</head>

<body>
<form action="<%=strContextPath%>/signIn" method="post">
    <jsp:include page="myAccount/includedPage/navbar.jsp"/>
</form>


<form onsubmit='redirect();return false;' method="post">

    <div class="container">


        <div class="row mt-5 pt-5">
            <div class="col-10"></div>
            <div class="col-2">
                <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu1"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <fmt:message key="rooms_jsp.sorting"/>

                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenu1">
                        <button class="dropdown-item" type="submit" name="sort_by_price_descending">
                            <fmt:message key="rooms_jsp.sorting.by_price"/> <img
                                src="<%=strContextPath%>/resources/rooms_icon/caret-down.png">

                        </button>

                        <button class="dropdown-item" type="submit" name="sort_by_price_ascending">
                            <fmt:message key="rooms_jsp.sorting.by_price"/> <img
                                src="<%=strContextPath%>/resources/rooms_icon/sort-up.png">
                        </button>

                        <button class="dropdown-item" type="submit" name="sort_by_count_of_clients_descending">
                            <fmt:message key="rooms_jsp.sorting.by_count_of_clients"/> <img
                                src="<%=strContextPath%>/resources/rooms_icon/caret-down.png">
                        </button>

                        <button class="dropdown-item" type="submit" name="sort_by_count_of_clients_ascending">
                            <fmt:message key="rooms_jsp.sorting.by_count_of_clients"/> <img
                                src="<%=strContextPath%>/resources/rooms_icon/sort-up.png">
                        </button>


                        <button class="dropdown-item" type="submit" name="sort_by_class_descending">
                            <fmt:message key="rooms_jsp.sorting.by_class"/> <img
                                src="<%=strContextPath%>/resources/rooms_icon/caret-down.png">
                        </button>

                        <button class="dropdown-item" type="submit" name="sort_by_class_ascending">
                            <fmt:message key="rooms_jsp.sorting.by_class"/> <img
                                src="<%=strContextPath%>/resources/rooms_icon/sort-up.png">
                        </button>


                    </div>
                </div>

            </div>
        </div>
        <div class="row ">
            <div class="col-12">


                <hr>
            </div>
        </div>

        <div class="row ">

            <div class="col-3  p-2">
                <c:set var="error" value='<%=request.getParameter("error")%>'/>
                <c:if test="${'DateError' eq error}">
                    <div class="alert alert-danger" role="alert">
                        <strong><fmt:message key="rooms_jsp.error.check_in_date_error"/></strong>
                        <br>
                        <fmt:message key="sign_up_jsp.please_repeat"/>
                    </div>
                </c:if>

                <c:if test="${'FormatDateError' eq error}">
                    <div class="alert alert-danger" role="alert">
                        <strong><fmt:message key="rooms_jsp.error.date_format_error"/></strong>
                        <br>
                        <fmt:message key="sign_up_jsp.please_repeat"/>
                    </div>
                </c:if>


                <p>
                    <a class="btn btn-link collapsed" data-toggle="collapse" href="#collapseClassOfTheRoom"
                       aria-expanded="false" aria-controls="collapseExample">
                        <fmt:message key="rooms_jsp.class_of_the_room"/>
                    </a>
                </p>

                <div class="collapse mb-2 " id="collapseClassOfTheRoom">
                    <div class="card card-body border-0">
                        <select name="class_of_room" class="custom-select">
                            <option value="" selected disabled hidden>Виберіть клас апартаментів</option>
                            <option value="${ClassOfTheRoom.ECONOMY.name()}">${ClassOfTheRoom.ECONOMY.name().toLowerCase()}</option>
                            <option value="${ClassOfTheRoom.STANDARD.name()}">${ClassOfTheRoom.STANDARD.name().toLowerCase()}</option>
                            <option value="${ClassOfTheRoom.SUPERIOR.name()}">${ClassOfTheRoom.SUPERIOR.name().toLowerCase()}</option>
                            <option value="${ClassOfTheRoom.PREMIUM.name()}">${ClassOfTheRoom.PREMIUM.name().toLowerCase()}</option>
                        </select>
                    </div>

                </div>
                <hr>


                <p>
                    <a class="btn btn-link collapsed" data-toggle="collapse" href="#collapse1" aria-expanded="false"
                       aria-controls="collapseExample">
                        <fmt:message key="rooms_jsp.price"/>
                    </a>
                </p>

                <div class="collapse mb-2 " id="collapse1" style="">
                    <div class="card card-body border-0">
                        <label for="priceRangeNumber">
                            <div class="form-group">
                                <input type="number" class="form-control" id="priceRangeNumber"
                                       placeholder="Example input"
                                       name="price" min="1">
                            </div>
                        </label>
                        <input type="range" class="custom-range" id="priceRange" min="1" max="1000" step="2">
                    </div>

                </div>
                <hr>


                <p>
                    <a class="btn btn-link collapsed" data-toggle="collapse" href="#collapse2" aria-expanded="false"
                       aria-controls="collapseExample">
                        <fmt:message key="rooms_jsp.count_of_clients"/>
                    </a>
                </p>

                <div class="collapse mb-2" id="collapse2" style="">
                    <div class="card card-body border-0">
                        <fmt:message key="rooms_jsp.count_of_clients"/>

                        <div class="custom-control custom-checkbox">
                            <input value="1" name="count_of_clients" type="checkbox" class="custom-control-input"
                                   id="customCheck1">
                            <label class="custom-control-label" for="customCheck1">1
                                <img src="<%=strContextPath%>/resources/rooms_icon/user.png">
                            </label>
                        </div>

                        <div class="custom-control custom-checkbox">
                            <input value="2" name="count_of_clients" type="checkbox" class="custom-control-input"
                                   id="customCheck2">
                            <label class="custom-control-label" for="customCheck2">2
                                <img src="<%=strContextPath%>/resources/rooms_icon/user.png">
                                <img src="<%=strContextPath%>/resources/rooms_icon/user.png">
                            </label>
                        </div>

                        <div class="custom-control custom-checkbox">
                            <input value="3" name="count_of_clients" type="checkbox" class="custom-control-input"
                                   id="customCheck3">
                            <label class="custom-control-label" for="customCheck3">3
                                <img src="<%=strContextPath%>/resources/rooms_icon/user.png">
                                <img src="<%=strContextPath%>/resources/rooms_icon/user.png">
                                <img src="<%=strContextPath%>/resources/rooms_icon/user.png">
                            </label>
                        </div>

                        <div class="custom-control custom-checkbox">
                            <input value="4" name="count_of_clients" type="checkbox" class="custom-control-input"
                                   id="customCheck4">
                            <label class="custom-control-label" for="customCheck4">4
                                <img src="<%=strContextPath%>/resources/rooms_icon/user.png">
                                <img src="<%=strContextPath%>/resources/rooms_icon/user.png">
                                <img src="<%=strContextPath%>/resources/rooms_icon/user.png">
                                <img src="<%=strContextPath%>/resources/rooms_icon/user.png">
                            </label>
                        </div>

                        <div class="custom-control custom-checkbox">
                            <input value="5" name="count_of_clients" type="checkbox" class="custom-control-input"
                                   id="customCheck5">
                            <label class="custom-control-label" for="customCheck5">5
                                <img src="<%=strContextPath%>/resources/rooms_icon/user.png">
                                <img src="<%=strContextPath%>/resources/rooms_icon/user.png">
                                <img src="<%=strContextPath%>/resources/rooms_icon/user.png">
                                <img src="<%=strContextPath%>/resources/rooms_icon/user.png">
                                <img src="<%=strContextPath%>/resources/rooms_icon/user.png">
                            </label>
                        </div>


                    </div>
                </div>
                <hr>

                <p>
                    <a class="btn btn-link collapsed" data-toggle="collapse" href="#collapse3" aria-expanded="false"
                       aria-controls="collapseExample">
                        <fmt:message key="rooms_jsp.calendar"/>

                    </a>
                </p>
                <div class="collapse mb-2" id="collapse3" style="">
                    <div class="card card-body">

                        <form autocomplete="off">
                            <div class="flex-row d-flex ">
                                <div class="col-12 ">
                                    <div class="input-group input-daterange">
                                        <div class="container">

                                            <div class="row">
                                                <div class="col-12">
                                                    <fmt:message key="rooms_jsp.check_in_date"/>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-12">
                                                    <input type="text" id="start" class="form-control text-left"
                                                           name="start_date" autocomplete="off"
                                                           pattern="\d{2}-\d{2}-\d{4}"
                                                           title="Wrong input pattern">
                                                    <span class="fa fa-calendar" id="fa-1"></span>
                                                </div>
                                            </div>


                                            <div class="row">
                                                <div class="col-12">
                                                    <fmt:message key="rooms_jsp.check_out_date"/>

                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-12">
                                                    <input type="text" id="end" class="form-control text-left"
                                                           name="end_date" autocomplete="off"
                                                           pattern="\d{2}-\d{2}-\d{4}"
                                                           title="Wrong input pattern">
                                                    <span class="fa fa-calendar" id="fa-2"></span>
                                                </div>
                                            </div>

                                        </div>


                                    </div>
                                </div>
                            </div>
                        </form>


                    </div>
                </div>
                <hr>


                <p>
                    <input type="submit" class="btn btn-primary" value="<fmt:message key="rooms_jsp.filter"/>"
                           name="filter_submit">
                </p>
            </div>


            <div class="col-9 pl-4">

                <c:forEach items="${rooms}" var="room">

                    <div class="media">

                        <div class="container">
                            <div class="row">

                                <div class="col-7">
                                    <div class="container">

                                        <div class="row">
                                            <div class="col-6">
                                                <c:if test="${empty room.strMainPhoto }">
                                                <img class="d-flex mr-3" data-src="holder.js/200x200?theme=sky"
                                                     alt="Generic placeholder image" >
                                                </c:if>

                                                <c:if test="${not empty room.strMainPhoto }">
                                                <img class="d-flex mr-3"
                                                     alt="Generic placeholder image"
                                                     src="data:image/jpg;base64,${room.strMainPhoto}"
                                                     width="200" height="200">
                                                </c:if>
                                            </div>

                                            <div class="col-6">
                                                <div class="container">
                                                    <jsp:include page="myAccount/includedPage/name_of_room.jsp">
                                                        <jsp:param name="count_of_clients"
                                                                   value="${room.countOfClient}"/>
                                                    </jsp:include>

                                                    <div class="row mt-4 ml-2">
                                                        <div class="col-12"></div>
                                                            ${room.countOfClient}
                                                        <c:forEach begin="1" end="${room.countOfClient}"
                                                                   varStatus="loop">
                                                            <img src="<%=strContextPath%>/resources/rooms_icon/user.png">
                                                        </c:forEach>

                                                    </div>

                                                    <div class="row mt-5 ">
                                                        <div class="col-8">
                                                            <p>
                                                                <a class="btn btn-link"
                                                                   data-parent="#collapse-group"
                                                                   data-toggle="collapse"
                                                                   href="#reviewCollapse${room.id}"
                                                                   aria-expanded="false"
                                                                   aria-controls="collapseExample">


                                                                    <jsp:include page="myAccount/includedPage/room-rating.jsp">
                                                                        <jsp:param name="total_ratting" value="${room.avgPoint}"/>
                                                                    </jsp:include>
                                                                    <i class="bi bi-chevron-down"></i>


                                                                </a>

                                                            </p>
                                                        </div>
                                                    </div>


                                                </div>
                                            </div>


                                        </div>

                                        <div class="row">
                                            <div class="col-12">
                                                <div class="collapse" id="reviewCollapse${room.id}">
                                                    <div class="card card-body mt-2 ">
                                                        <div class="container">

                                                            <c:set var="comfortable" value=" ${20*room.totalPoint.comfortable}"/>
                                                            <div class="row">
                                                                <div class="col-5 ">
                                                                    <fmt:message
                                                                        key="room_jsp.comfortable"/></div>
                                                                <div class="col-5 mt-2">

                                                                    <div class="progress">
                                                                        <div class="progress-bar" role="progressbar"
                                                                             style="width: ${comfortable}%"
                                                                             aria-valuenow="25" aria-valuemin="0"
                                                                             aria-valuemax="100"></div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-2">
                                                                        ${room.totalPoint.comfortable}
                                                                </div>
                                                            </div>


                                                            <c:set var="fortunes"
                                                                   value=" ${20*room.totalPoint.fortunes}"/>
                                                            <div class="row mt-2">
                                                                <div class="col-5 pr-1"><fmt:message
                                                                        key="room_jsp.fortunes"/></div>
                                                                <div class="col-5 mt-2">
                                                                    <div class="progress">
                                                                        <div class="progress-bar" role="progressbar"
                                                                             style="width: ${fortunes}%"
                                                                             aria-valuenow="50" aria-valuemin="0"
                                                                             aria-valuemax="100"></div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-2">
                                                                        ${room.totalPoint.fortunes}
                                                                </div>
                                                            </div>

                                                            <c:set var="soundproof"
                                                                   value=" ${20*room.totalPoint.soundproof}"/>
                                                            <div class="row mt-2">
                                                                <div class="col-5 pr-1"><fmt:message
                                                                        key="room_jsp.soundproof"/></div>
                                                                <div class="col-5 mt-2">
                                                                    <div class="progress">

                                                                        <div class="progress-bar" role="progressbar"
                                                                             style="width: ${soundproof}%"
                                                                             aria-valuenow="50" aria-valuemin="0"
                                                                             aria-valuemax="100"></div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-2">
                                                                        ${room.totalPoint.soundproof}
                                                                </div>
                                                            </div>


                                                            <c:set var="service"
                                                                   value=" ${20*room.totalPoint.service}"/>
                                                            <div class="row mt-2">
                                                                <div class="col-5 pr-1"><fmt:message
                                                                        key="room_jsp.service"/></div>
                                                                <div class="col-5 mt-2">
                                                                    <div class="progress">
                                                                        <div class="progress-bar" role="progressbar"
                                                                             style="width: ${service}%"
                                                                             aria-valuenow="50" aria-valuemin="0"
                                                                             aria-valuemax="100"></div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-2">
                                                                        ${room.totalPoint.service}
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                    </div>
                                </div>

                                <div class="col-5">
                                    <div class="media-body">


                                        <div class="container">
                                            <div class="row">


                                                <div class="col-12 ">
                                                    <div class="card">
                                                        <div class="card-body">
                                                            <p class="card-text">
                                                                    ${room.description}
                                                            </p>
                                                            <p><strong>
                                                                <fmt:message key="rooms_jsp.class_of_the_room"/>
                                                                : <fmt:message
                                                                    key="class_of_the_room.${room.classOfTheRoom.name().toLowerCase()}"/>.</strong>
                                                            </p>
                                                            <p><strong><fmt:message key="rooms_jsp.price"/>
                                                                : ${room.price}.</strong></p>
                                                            <p><strong><fmt:message key="rooms_jsp.area_of_the_room"/>
                                                                : ${room.areaOfRoom}.</strong></p>




                                                            <c:set value='<%=request.getParameter("selectRoomFor")%>' var="idClient"/>

                                                            <c:if test="${not empty idClient and sessionScope.role eq Role.MANAGER.name()}">
                                                                <form method="post"
                                                                      action="<%=strContextPath%>/roomRequest?selectRoomFor=${id_client}">
                                                                    <button type="submit" class="btn btn-primary "
                                                                            name="select"
                                                                            value="${room.id}">
                                                                        Create request
                                                                    </button>
                                                                </form>
                                                            </c:if>

                                                            <a href="${pageContext.request.contextPath}/room?id=${room.id}"
                                                               class="btn btn-primary mt-2"><fmt:message
                                                                    key="rooms_jsp.watch"/></a>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <hr>
                </c:forEach>


            </div>

        </div>

        <c:if test="${rooms.size()!=0}">
            <div class="row">
                <div class="col-6"></div>
                <div class="col-3">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">
                            <li class="page-item">
                                <a class="page-link" href="<%=strContextPath%>/rooms?page=0<%=strQuery%>"
                                   aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                    <span class="sr-only">Previous</span>
                                </a>
                            </li>


                            <c:if test="${page>2 && page!=room_list_size }">
                                <c:forEach begin="${page-2}" end="${page+1}" varStatus="loop" var="page">

                                    <li class="page-item"><a class="page-link"
                                                             href="<%=strContextPath%>/rooms?page=${page}<%=strQuery%>">${page+1}</a>
                                    </li>
                                </c:forEach>
                            </c:if>


                            <c:if test="${page==0 || page==1 || page==2}">

                                <c:choose>
                                    <c:when test="${room_list_size>=4}">
                                        <c:set var="page" value="${3}"/>
                                    </c:when>
                                    <c:otherwise>

                                        <c:set var="page" value="${room_list_size}"/>
                                    </c:otherwise>
                                </c:choose>


                                <c:forEach begin="0" end="${page}" varStatus="loop" var="page">
                                    <li class="page-item"><a class="page-link"
                                                             href="<%=strContextPath%>/rooms?page=${page}<%=strQuery%>">${page+1}</a>
                                    </li>
                                </c:forEach>
                            </c:if>


                            <c:if test="${page==room_list_size && room_list_size!=0 && page!=0 && page!=1 && page!=2}">

                                <c:forEach begin="${room_list_size-3}" end="${room_list_size}" varStatus="loop"
                                           var="page">
                                    <li class="page-item">
                                        <a class="page-link" href="<%=strContextPath%>/rooms?page=${page}<%=strQuery%>">
                                                ${page+1}
                                        </a>
                                    </li>
                                </c:forEach>
                            </c:if>


                            <li class="page-item">
                                <a class="page-link"
                                   href="<%=strContextPath%>/rooms?page=${room_list_size}<%=strQuery%>"
                                   aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </c:if>

    </div>
</form>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"></script>

<script src="<%=strContextPath%>/view/js/filter.js"></script>
<script src="<%=strContextPath%>/view/js/calendar.js"></script>
</body>

</html>