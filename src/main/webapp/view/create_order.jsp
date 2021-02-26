<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String strContextPath = request.getContextPath();%>
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

<body style="height: 2000px;">

<form action="<%=strContextPath%>/signIn" method="post">
    <jsp:include page="myAccount/includedPage/navbar.jsp"/>
</form>

<form onsubmit='redirect();return false;' method="post">

    <div class="container">
        <div class="row mt-5 pt-5">
            <div class="col-4">

                <div class="card">

                    <div class="card-body">
                        <h4 class="card-title"><fmt:message key="create_orders_jsp.you_chose"/></h4>
                        <p class="card-text">
                            <br>


                        <p>
                            <strong> <fmt:message key="rooms_jsp.count_of_clients"/> ${room.countOfClient}</strong>
                            <c:forEach begin="1" end="${room.countOfClient}"
                                       varStatus="loop">
                                <img src="<%=strContextPath%>/resources/rooms_icon/user.png">
                            </c:forEach>
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


                        <p class="card-text">
                            ${room.description}
                        </p>
                    </div>
                </div>
            </div>


            <div class="col-8">


                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">

                                <div class="carousel-inner" role="listbox">

                                    <div class="carousel-item active">
                                        <img class="d-block w-100" src="data:image/jpg;base64,${room.strMainPhoto}"
                                             alt="900x400"
                                             data-holder-rendered="true" style="width: 900px; height: 400px;">
                                    </div>

                                    <c:forEach items="${room.strPhotos}" var="roomPhoto">
                                        <div class="carousel-item">
                                            <img class="d-block w-100" src="data:image/jpg;base64,${roomPhoto}"
                                                 alt="900x400"
                                                 data-holder-rendered="true" style="width: 900px; height: 400px;">
                                        </div>
                                    </c:forEach>
                                </div>

                                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button"
                                   data-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Previous</span>
                                </a>

                                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button"
                                   data-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="row mt-4">

                        <div class="col-12  " style="background-color: #b8daff;"><br>
                            <h3><fmt:message key="create_orders_jsp.input_data"/></h3>

                            <div class="container mt-5">


                                <div class="row">

                                    <form autocomplete="off">
                                        <div class="flex-row d-flex ">
                                            <div class="col-12 ">
                                                <div class="input-group input-daterange">
                                                    <div class="container">
                                                        <div class="row">
                                                            <div class="col-6">
                                                                <fmt:message key="rooms_jsp.check_in_date"/>

                                                            </div>
                                                            <div class="col-6">
                                                                <fmt:message key="rooms_jsp.check_out_date"/>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <input type="text" id="start" autocomplete="off"
                                                           class="form-control text-left mr-2" name="start_date" required>
                                                    <span class="fa fa-calendar" id="fa-1"></span>


                                                    <input type="text" id="end" autocomplete="off"
                                                           class="form-control text-left ml-2" name="end_date" required>
                                                    <span class="fa fa-calendar" id="fa-2"></span>


                                                </div>
                                            </div>
                                        </div>
                                    </form>

                                </div>


                                <div class="row mt-3">
                                    <div class="col-12">
                                        <fmt:message key="room_jsp.description"/>
                                    </div>
                                </div>
                                <div class="row mt-1">
                                    <div class="col-11">
                        <textarea name="note" class="form-control" rows="3" style=" resize: none;"
                                  maxlength="300"></textarea>
                                    </div>


                                </div>


                                <div class="row mt-3 mb-3">
                                    <div class="col-3">
                                        <button type="submit" class="btn btn-primary" name="create_order">
                                            <fmt:message key="create_orders_jsp.create_order"/>
                                        </button>
                                    </div>
                                </div>

                            </div>


                        </div>
                    </div>


                </div>
            </div>
        </div>



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

<script src="<%=strContextPath%>/view/js/calendar.js"></script>
</body>

</html>