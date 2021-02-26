
<%@ page language="java" contentType="text/html;charset=UTF-8" %>

<%@ include file="directive/taglib.jspf" %>

<% String strContextPath = request.getContextPath();%>
<%@ page import="hotel.enums.RequestStatus" %>
<%@ page import="hotel.enums.ClassOfTheRoom" %>
<%@ page import="hotel.enums.Role" %>




<!DOCTYPE html>
<html lang="en">

<head>


    <meta name="viewport" content="width=device-width, initial-scale=1">


    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">


    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css">

    <link href="/path/to/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=strContextPath%>/view/style/calendar.css">

    <link href="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/css/bootstrap4-toggle.min.css"
          rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/js/bootstrap4-toggle.min.js"></script>
</head>

<body>
<form action="<%=strContextPath%>/signIn" method="post">
    <jsp:include page="includedPage/navbar.jsp"/>

</form>


<form onsubmit='redirect();return false;' method="post">

    <div class="container">
        <div class="row mt-5 pt-5">


            <jsp:include page="includedPage/left_menu.jsp"/>


            <div class="col-9 border" style="border-color: #212529;">
                <div class="container">
                    <div class="row">
                        <div class="col-7 mt-2">
                            <h2><fmt:message key="room_request_jsp.request"/></h2>
                        </div>
                        <div class="col-2"></div>
                        <div class="col-3 mt-2">

                            <!-- Button to Open the Modal -->
                            <c:if test="${sessionScope.role eq Role.CLIENT.name()}">
                                <button type="button" class="btn btn-primary mt-2" data-toggle="modal"
                                        data-target="#create_request">
                                    <fmt:message key="room_request_jsp.create_request"/>
                                </button>
                            </c:if>

                            <!-- The Modal -->
                            <div class="modal fade" id="create_request">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">

                                        <!-- Modal Header -->
                                        <div class="modal-header">
                                            <h4 class="modal-title">
                                                <fmt:message key="room_request_jsp.create_request"/>
                                            </h4>
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>

                                        </div>

                                        <!-- Modal body -->
                                        <div class="modal-body">
                                            <div class="container">


                                                <div class="row">
                                                    <div class="col-12">

                                                        <div class="input-group">
                                                            <div class="input-group-prepend">
                                                                <div class="input-group-text">
                                                                    <input name="class_checkbox" type="checkbox"
                                                                           data-target="#collapseClass"
                                                                           data-toggle="collapse" data-onstyle="primary"
                                                                           data-offstyle="secondary">

                                                                </div>
                                                            </div>
                                                            <h5 class="ml-2">
                                                                <fmt:message
                                                                        key="room_request_jsp.select_class_of_the_room"/>
                                                            </h5>
                                                        </div>


                                                        <div class="panel-group mt-2">
                                                            <div class="panel panel-default">

                                                                <div id="collapseClass" class="panel-collapse collapse">
                                                                    <div class="panel-body">

                                                                        <select name="class_of_the_room"
                                                                                class="custom-select">
                                                                            <option value="" selected disabled hidden><fmt:message key="room_jsp.choose_class_of_the_room"/></option>
                                                                            <option value="${ClassOfTheRoom.ECONOMY.name()}"><fmt:message key="class_of_the_room.economy"/></option>
                                                                            <option value="${ClassOfTheRoom.STANDARD.name()}"><fmt:message key="class_of_the_room.standard"/></option>
                                                                            <option value="${ClassOfTheRoom.SUPERIOR.name()}"><fmt:message key="class_of_the_room.superior"/></option>
                                                                            <option value="${ClassOfTheRoom.PREMIUM.name()}"><fmt:message key="class_of_the_room.premium"/></option>
                                                                        </select>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>


                                                <div class="row mt-2">
                                                    <div class="col-12">

                                                        <div class="input-group">
                                                            <div class="input-group-prepend">
                                                                <div class="input-group-text">
                                                                    <input name="price_checkbox" type="checkbox"
                                                                           data-target="#collapseOne"
                                                                           data-toggle="collapse" data-onstyle="primary"
                                                                           data-offstyle="secondary">

                                                                </div>
                                                            </div>
                                                            <h5 class="ml-2">
                                                                <fmt:message key="room_request_jsp.select_price"/>
                                                            </h5>
                                                        </div>


                                                        <div class="panel-group mt-2">
                                                            <div class="panel panel-default">

                                                                <div id="collapseOne" class="panel-collapse collapse">
                                                                    <div class="panel-body">
                                                                        <label for="priceRangeNumber">
                                                                            <div class="form-group">
                                                                                <input type="number"
                                                                                       class="form-control"
                                                                                       id="priceRangeNumber"
                                                                                       name="price">
                                                                            </div>
                                                                        </label>
                                                                        <br>
                                                                        <input type="range" class="custom-range"
                                                                               id="priceRange" min="2" max="1000000"
                                                                               step="1">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>


                                                <div class="row mt-2">
                                                    <div class="col-12">

                                                        <div class="input-group">
                                                            <div class="input-group-prepend">
                                                                <div class="input-group-text">
                                                                    <input name="date_checkbox" type="checkbox"
                                                                           data-target="#collapseDate"
                                                                           data-toggle="collapse" data-onstyle="primary"
                                                                           data-offstyle="secondary">

                                                                </div>
                                                            </div>
                                                            <h5 class="ml-2">
                                                                <fmt:message key="room_request_jsp.select_date"/>
                                                            </h5>
                                                        </div>


                                                        <div class="panel-group mt-2" id="accordion">
                                                            <div class="panel panel-default">
                                                                <div id="collapseDate" class="panel-collapse collapse">
                                                                    <form autocomplete="off">
                                                                        <div class="flex-row d-flex ">

                                                                            <div class="input-group input-daterange">

                                                                                <div class="col-6">
                                                                                    <fmt:message
                                                                                            key="my_orders_jsp.check_in_date"/>

                                                                                    <input type="text"
                                                                                           autocomplete="off" id="start"
                                                                                           class="form-control text-left mr-2"
                                                                                           name="start_date">
                                                                                    <span class="fa fa-calendar"
                                                                                          id="fa-1"></span>

                                                                                </div>
                                                                                <div class="col-6">
                                                                                    <fmt:message
                                                                                            key="my_orders_jsp.check_out_date"/>
                                                                                    <input type="text"
                                                                                           autocomplete="off" id="end"
                                                                                           class="form-control text-left ml-2"
                                                                                           name="end_date">
                                                                                    <span class="fa fa-calendar"
                                                                                          id="fa-2"></span>

                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </form>
                                                                </div>

                                                            </div>
                                                        </div>


                                                    </div>
                                                </div>


                                                <div class="row mt-2">
                                                    <div class="col-12">

                                                        <div class="input-group">
                                                            <div class="input-group-prepend">
                                                                <div class="input-group-text">
                                                                    <input name="clients_checkbox" type="checkbox"
                                                                           data-target="#collapseClients"
                                                                           data-toggle="collapse" data-onstyle="primary"
                                                                           data-offstyle="secondary">

                                                                </div>
                                                            </div>
                                                            <h5 class="ml-2">Select count of client</h5>
                                                        </div>


                                                        <div class="panel-group mt-2">
                                                            <div class="panel panel-default">

                                                                <div id="collapseClients"
                                                                     class="panel-collapse collapse">

                                                                    <div class="flex-row d-flex ">
                                                                        <div class="container">
                                                                            <div class="row">
                                                                                <jsp:include
                                                                                        page="includedPage/select_count_of_clients.jsp">
                                                                                    <jsp:param name="column_size"
                                                                                               value="10"/>
                                                                                </jsp:include>
                                                                            </div>


                                                                        </div>


                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row mt-2">
                                                    <div class="col-12">

                                                        <div class="input-group">
                                                            <div class="input-group-prepend">
                                                                <div class="input-group-text">
                                                                    <input name="note_checkbox" type="checkbox"
                                                                           data-target="#collapseNote"
                                                                           data-toggle="collapse" data-onstyle="primary"
                                                                           data-offstyle="secondary">

                                                                </div>
                                                            </div>
                                                            <h5 class="ml-2">
                                                                <fmt:message key="room_request_jsp.set_note"/>
                                                            </h5>
                                                        </div>


                                                        <div class="panel-group mt-2" >
                                                            <div class="panel panel-default">

                                                                <div id="collapseNote" class="panel-collapse collapse">
                                                                    <div class="flex-row d-flex ">

                                                                        <div class="input-group input-daterange">

                                                                            <dov class="col-2"></dov>
                                                                            <div class="col-8">
                                                                                <textarea name="note"
                                                                                          class="form-control" rows="4"
                                                                                          style=" resize: none;" maxlength="300"></textarea>
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

                                        <!-- Modal footer -->
                                        <div class="modal-footer">
                                            <input type="submit" class="btn btn-primary"
                                                   value=" <fmt:message key="save"/>"
                                                   name="create_request">
                                        </div>

                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>


                    <div class="row mt-3">

                    </div>


                    <hr>


                    <div class="row">
                        <div class="col-12">

                            <c:forEach items="${requests}" var="request">
                                <div class="media">
                                    <div class="media-body">


                                        <div class="container">
                                            <div class="row">


                                                <div class="col-6 ">
                                                    <div class="card">
                                                        <div class="card-body">

                                                            <strong> <a class="btn btn-link" data-toggle="collapse"
                                                                        href="#collapseClass_${request.id}"
                                                                        aria-expanded="false"
                                                                        aria-controls="collapseExample">
                                                                <fmt:message key="add_new_room_jsp.class_of_the_room"/>
                                                            </a> :
                                                                <c:choose>
                                                                    <c:when test="${request.classOfTheRoom.name() eq null}">
                                                                        <fmt:message key="empty"/>.
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <fmt:message key="class_of_the_room.${request.classOfTheRoom.name().toLowerCase()}"/>.
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </strong><br>

                                                            <c:if test="${request.requestStatus.name() eq RequestStatus.IN_PROCESS.name() && sessionScope.role
                                                            eq  Role.CLIENT.name()}">
                                                                <form onsubmit='redirect();return false;' method="post">
                                                                    <div class="collapse "
                                                                         id="collapseClass_${request.id}">
                                                                        <div class="card card-body border-0">
                                                                            <div class="container">
                                                                                <div class="row">
                                                                                    <div class="col-12">
                                                                                        <select name="class_of_the_room"
                                                                                                class="custom-select">
                                                                                            <option value="" selected
                                                                                                    disabled hidden>
                                                                                                Виберіть клас
                                                                                                апартаментів
                                                                                            </option>
                                                                                            <option value="${ClassOfTheRoom.ECONOMY.name()}"><fmt:message key="class_of_the_room.economy"/></option>
                                                                                            <option value="${ClassOfTheRoom.STANDARD.name()}"><fmt:message key="class_of_the_room.standard"/></option>
                                                                                            <option value="${ClassOfTheRoom.SUPERIOR.name()}"><fmt:message key="class_of_the_room.superior"/></option>
                                                                                            <option value="${ClassOfTheRoom.PREMIUM.name()}"><fmt:message key="class_of_the_room.premium"/></option>
                                                                                        </select>

                                                                                    </div>

                                                                                </div>
                                                                                <div class="row mt-2">
                                                                                    <div class="col-8">

                                                                                    </div>

                                                                                    <div class="col-4 ">
                                                                                        <button type="submit"
                                                                                                name="edit_class"
                                                                                                class="btn btn-outline-dark"
                                                                                                value="${request.id}">
                                                                                            <fmt:message key="edit"/>
                                                                                        </button>

                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <br>

                                                                        </div>
                                                                    </div>
                                                                </form>
                                                            </c:if>


                                                            <strong> <a class="btn btn-link" data-toggle="collapse"
                                                                        href="#collapsePrice_${request.id}"
                                                                        aria-expanded="false"
                                                                        aria-controls="collapseExample">
                                                                <fmt:message key="add_new_room_jsp.price"/>
                                                            </a> :
                                                                <c:choose>
                                                                    <c:when test="${request.price == 0}">
                                                                        <fmt:message key="empty"/>.
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        ${request.price}.
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </strong><br>

                                                            <c:if test="${request.requestStatus.name() eq RequestStatus.IN_PROCESS.name() && sessionScope.role eq Role.CLIENT.name()}">
                                                                <form onsubmit='redirect();return false;' method="post">
                                                                    <div class="collapse "
                                                                         id="collapsePrice_${request.id}">
                                                                        <div class="card card-body border-0">
                                                                            <div class="container">
                                                                                <div class="row">
                                                                                    <div class="col-12">
                                                                                        <div class="panel-body">
                                                                                            <label for="priceRangeNumber">
                                                                                                <div class="form-group">
                                                                                                    <input type="number"
                                                                                                           class="form-control"
                                                                                                           id="priceRangeNumberEdit"
                                                                                                           placeholder="Example input"
                                                                                                           name="price" min="0" max="1000">
                                                                                                </div>
                                                                                            </label>
                                                                                            <br>
                                                                                            <input type="range"
                                                                                                   class="custom-range"
                                                                                                   id="priceRangeEdit"
                                                                                                   min="2" max="1000"
                                                                                                   step="1">
                                                                                        </div>
                                                                                    </div>

                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-8">

                                                                                    </div>

                                                                                    <div class="col-4">
                                                                                        <button type="submit"
                                                                                                name="edit_price"
                                                                                                class="btn btn-outline-dark"
                                                                                                value="${request.id}">
                                                                                            <fmt:message key="edit"/>
                                                                                        </button>

                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <br>

                                                                        </div>
                                                                    </div>
                                                                </form>
                                                            </c:if>


                                                            <strong> <a class="btn btn-link" data-toggle="collapse"
                                                                        href="#collapseCountOfClient_${request.id}"
                                                                        aria-expanded="false"
                                                                        aria-controls="collapseExample">
                                                                <fmt:message key="add_new_room_jsp.count_of_clients"/>
                                                            </a> :
                                                                <c:choose>
                                                                    <c:when test="${request.countOfClient == 0}">
                                                                        <fmt:message key="empty"/>.
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        ${request.countOfClient}.
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </strong><br>

                                                            <c:if test="${request.requestStatus.name() eq RequestStatus.IN_PROCESS.name()  && sessionScope.role eq Role.CLIENT.name()}">
                                                                <form onsubmit='redirect();return false;' method="post">
                                                                    <div class="collapse "
                                                                         id="collapseCountOfClient_${request.id}">
                                                                        <div class="card card-body border-0">
                                                                            <div class="container">
                                                                                <div class="row">
                                                                                    <div class="col-12">
                                                                                        <div class="flex-row d-flex ">
                                                                                            <div class="container">
                                                                                                <div class="row">
                                                                                                    <jsp:include
                                                                                                            page="includedPage/select_count_of_clients.jsp">
                                                                                                        <jsp:param
                                                                                                                name="column_size"
                                                                                                                value="12"/>
                                                                                                    </jsp:include>
                                                                                                </div>


                                                                                            </div>


                                                                                        </div>


                                                                                    </div>

                                                                                </div>


                                                                                <div class="row">
                                                                                    <div class="col-8">
                                                                                    </div>
                                                                                    <div class="col-4">
                                                                                        <button type="submit"
                                                                                                name="edit_count_of_clients"
                                                                                                class="btn btn-outline-dark"
                                                                                                value="${request.id}">
                                                                                            <fmt:message key="edit"/>
                                                                                        </button>

                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <br>

                                                                        </div>
                                                                    </div>
                                                                </form>
                                                            </c:if>

                                                            <c:choose>
                                                                <c:when test="${request.startDate eq null}">
                                                                    <strong><a class="btn btn-link"
                                                                               data-toggle="collapse"
                                                                               href="#collapseDateEdit_${request.id}"
                                                                               aria-expanded="false"
                                                                               aria-controls="collapseExample">
                                                                        <fmt:message key="rooms_jsp.check_in_date"/>
                                                                    </a> : <fmt:message key="empty"/>.</strong><br>

                                                                    <strong><a class="btn btn-link"
                                                                               data-toggle="collapse"
                                                                               href="#collapseDateEdit_${request.id}"
                                                                               aria-expanded="false"
                                                                               aria-controls="collapseExample">
                                                                        <fmt:message key="rooms_jsp.check_out_date"/>
                                                                    </a> : <fmt:message key="empty"/>.</strong><br>

                                                                </c:when>
                                                                <c:otherwise>
                                                                    <strong><a class="btn btn-link"
                                                                               data-toggle="collapse"
                                                                               href="#collapseDateEdit_${request.id}"
                                                                               aria-expanded="false"
                                                                               aria-controls="collapseExample">
                                                                        <fmt:message key="rooms_jsp.check_in_date"/>
                                                                    </a> : ${request.startDate}.</strong><br>

                                                                    <strong><a class="btn btn-link"
                                                                               data-toggle="collapse"
                                                                               href="#collapseDateEdit_${request.id}"
                                                                               aria-expanded="false"
                                                                               aria-controls="collapseExample">
                                                                        <fmt:message key="rooms_jsp.check_out_date"/>
                                                                    </a> : ${request.endDate}.</strong><br>

                                                                </c:otherwise>
                                                            </c:choose>


                                                            <c:if test="${request.requestStatus.name() eq RequestStatus.IN_PROCESS.name()  && sessionScope.role eq Role.CLIENT.name()}">
                                                                <div class="collapse "
                                                                     id="collapseDateEdit_${request.id}">
                                                                    <div class="card card-body border-0">
                                                                        <div class="flex-row d-flex ">

                                                                            <div class="input-group input-daterange">
                                                                                <div class="container">
                                                                                    <div class="row">
                                                                                        <div class="col-12">
                                                                                            <fmt:message
                                                                                                    key="rooms_jsp.check_in_date"/>

                                                                                            <input type="text"
                                                                                                   autocomplete="off"
                                                                                                   id="start"
                                                                                                   class="form-control text-left"
                                                                                                   name="start_edited_date"
                                                                                                   pattern="\d{2}-\d{2}-\d{4}"
                                                                                                   title="Wrong input pattern">
                                                                                            <span class="fa fa-calendar"
                                                                                                  id="fa-1"></span>

                                                                                        </div>

                                                                                    </div>

                                                                                    <div class="row">
                                                                                        <div class="col-12">
                                                                                            <fmt:message
                                                                                                    key="rooms_jsp.check_out_date"/>
                                                                                            <input type="text"
                                                                                                   autocomplete="off"
                                                                                                   id="end"
                                                                                                   class="form-control text-left "
                                                                                                   name="end_edited_date"
                                                                                                   placeholder="Another input"
                                                                                            pattern="\d{2}-\d{2}-\d{4}"
                                                                                            title="Wrong input pattern">
                                                                                            <span class="fa fa-calendar"
                                                                                                  id="fa-2"></span>
                                                                                        </div>
                                                                                    </div>


                                                                                </div>


                                                                            </div>
                                                                        </div>

                                                                        <br>

                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-8">
                                                                        </div>
                                                                        <div class="col-4">
                                                                            <button type="submit" name="edit_date"
                                                                                    class="btn btn-outline-dark"
                                                                                    value="${request.id}">
                                                                                <fmt:message key="edit"/>
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </c:if>

                                                            <c:if test="${sessionScope.role eq Role.MANAGER.name()}">
                                                                <strong>
                                                                    <a class="btn btn-link">
                                                                        <fmt:message key="room_request_jsp.full_name"/>
                                                                    </a>
                                                                        ${request.name}: ${request.surname}
                                                                </strong>
                                                                <br>
                                                            </c:if>

                                                            <strong> <a class="btn btn-link"><fmt:message key="my_orders_jsp.status"/></a> :

                                                                <c:if test="${request.requestStatus.name() eq RequestStatus.IN_PROCESS.name()}">
                                                                    <span class="badge badge-warning">
                                                                        <fmt:message key="room_request_jsp.in_process"/>
                                                                    </span>
                                                                </c:if>

                                                                <c:if test="${request.requestStatus.name() eq RequestStatus.READY.name()}">
                                                                    <span class="badge badge-success">
                                                                        <fmt:message key="room_request_jsp.ready"/>
                                                                    </span>
                                                                </c:if>

                                                                <c:if test="${request.requestStatus.name() eq RequestStatus.REFUSE.name()}">
                                                                    <span class="badge badge-danger">
                                                                        <fmt:message key="room_request_jsp.refuse"/>
                                                                    </span>
                                                                </c:if>


                                                            </strong><br>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-6">
                                                    <div class="container">
                                                        <div class="row">


                                                            <c:choose>
                                                                <c:when test="${sessionScope.role eq Role.MANAGER.name() && request.requestStatus.name() eq RequestStatus.IN_PROCESS.name()}">
                                                                    <div class="col-3">
                                                                        <a href="<%=strContextPath%>/rooms?page=0&selectRoomFor=${request.id}"
                                                                           class="btn btn-secondary ml-1">
                                                                            <fmt:message key="room_request_jsp.select"/>
                                                                        </a>
                                                                    </div>

                                                                    <div class="col-5">
                                                                        <div class="dropdown">
                                                                            <button class="btn btn-secondary dropdown-toggle"
                                                                                    type="button" id="dropdownMenu1"
                                                                                    data-toggle="dropdown"
                                                                                    aria-haspopup="true"
                                                                                    aria-expanded="false">
                                                                                <fmt:message key="room_request_jsp.change_status"/>
                                                                            </button>
                                                                            <div class="dropdown-menu"
                                                                                 aria-labelledby="dropdownMenu1">
                                                                                <button type="submit"
                                                                                        name="refuse_request"
                                                                                        class="btn btn-secondary dropdown-item ml-1"
                                                                                        value="${request.id}">
                                                                                    <fmt:message key="room_request_jsp.refuse"/>
                                                                                </button>

                                                                                <button type="submit"
                                                                                        name="ready_request"
                                                                                        class="btn btn-secondary dropdown-item ml-1"
                                                                                        value="${request.id}">
                                                                                    <fmt:message key="room_request_jsp.ready"/>
                                                                                </button>

                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </c:when>
                                                                <c:otherwise>

                                                                    <c:if test="${sessionScope.role eq Role.CLIENT.name()}">
                                                                        <div class="col-3">
                                                                            <button type="submit" name="delete_request"
                                                                                    class="btn btn-secondary ml-1"
                                                                                    value="${request.id}">
                                                                                <fmt:message key="delete"/>
                                                                            </button>
                                                                        </div>
                                                                    </c:if>


                                                                </c:otherwise>
                                                            </c:choose>


                                                            <div class="col-3 ml-3">
                                                                <button class="btn btn-secondary" type="button"
                                                                        data-toggle="collapse"
                                                                        data-target="#collapseOffers_${request.id}"
                                                                        aria-expanded="false"
                                                                        aria-controls="collapseExample">
                                                                    <fmt:message key="room_request_jsp.show_offers"/>
                                                                </button>
                                                            </div>


                                                        </div>
                                                        <hr>
                                                        <div class="row">

                                                            <c:choose>
                                                                <c:when test="${request.note eq null}">
                                                                    <div class="col-10 mt-3 ml-3 ">
                                                                        <h3 class="text-secondary">
                                                                            <fmt:message key="room_request_jsp.there_isnt_any_requests"/>
                                                                        </h3>
                                                                    </div>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <div class="col-12">
                                                                            ${request.note}
                                                                    </div>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </div>

                                                        <c:if test="${request.requestStatus.name() eq RequestStatus.IN_PROCESS.name()
                                                         && sessionScope.role eq Role.CLIENT.name()}">
                                                            <form onsubmit='redirect();return false;' method="post">
                                                                <div class="collapse " id="collapseNote_${request.id}">
                                                                    <div class="card card-body border-0">
                                                                        <div class="row">
                                                                            <div class="col-1"></div>
                                                                            <div class="col-10">
                                                                            <textarea name="note" class="form-control"
                                                                                      rows="4"
                                                                                      maxlength="300"
                                                                                      style=" resize: none;"></textarea>
                                                                            </div>
                                                                        </div>

                                                                        <div class="row mt-1">
                                                                            <div class="col-8">
                                                                            </div>
                                                                            <div class="col-4">
                                                                                <button type="submit" name="edit_note"
                                                                                        class="btn btn-outline-dark"
                                                                                        value="${request.id}">
                                                                                    <fmt:message key="edit"/>
                                                                                </button>

                                                                            </div>
                                                                        </div>
                                                                        <br>

                                                                    </div>
                                                                </div>
                                                            </form>
                                                        </c:if>


                                                        <c:if test="${sessionScope.role eq Role.CLIENT.name()}">
                                                        <div class="row">
                                                            <div class="col-8"></div>
                                                            <div class="col-4">
                                                                <a class="btn btn-link" data-toggle="collapse"
                                                                   href="#collapseNote_${request.id}"
                                                                   aria-expanded="false"
                                                                   aria-controls="collapseExample">
                                                                    <fmt:message key="edit"/>
                                                                </a>

                                                            </div>

                                                        </div>
                                                        </c:if>

                                                    </div>
                                                </div>


                                            </div>


                                            <div class="row mt-3">
                                                <div class="col-12">
                                                    <div class="collapse" id="collapseOffers_${request.id}">
                                                        <div class="card card-body">
                                                            <div class="container">
                                                                <div class="row ">
                                                                    <div class="col-12">


                                                                        <table class="table table-hover">
                                                                            <thead>
                                                                            <tr>
                                                                                <th>#</th>
                                                                                <th>First Name</th>
                                                                                <th>Last Name</th>
                                                                            </tr>
                                                                            </thead>
                                                                            <tbody>
                                                                            <c:forEach items="${request.roomList}"
                                                                                       var="room">
                                                                                <tr onclick="location.href='<%=strContextPath%>/room?id=${room.id}'">
                                                                                    <th>${room.classOfTheRoom.name()}</th>
                                                                                    <td>${room.price}</td>
                                                                                    <td>${room.countOfClient}
                                                                                        <c:forEach begin="1"
                                                                                                   end="${room.countOfClient}"
                                                                                                   varStatus="loop">
                                                                                            <img src="<%=strContextPath%>/resources/rooms_icon/user.png">
                                                                                        </c:forEach></td>
                                                                                </tr>
                                                                            </c:forEach>
                                                                            </tbody>
                                                                        </table>


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

<script src="<%=strContextPath%>/view/js/filter.js"></script>
<script src="<%=strContextPath%>/view/js/calendar.js"></script>

<script>
    var checkbox = document.getElementById("radio");

    function validator() {
        if (checkbox.checked == false) {
            document.getElementById('start').disabled = true;
        } else {
            document.getElementById('start').disabled = false;
        }
    }

    checkbox.addEventListener('click', validator);
</script>
</body>

</html>