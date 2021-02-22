<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String strContextPath = request.getContextPath();%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<% String language = request.getSession().getAttribute("language").toString();%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="<%=language%>"/>
<fmt:setBundle basename="resources"/>

<!DOCTYPE html>
<html lang="en">

<head>


    <meta name="viewport" content="width=device-width, initial-scale=1">


    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">


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
                            <h2><fmt:message key="my_orders_jsp.orders"/></h2>
                        </div>
                    </div>


                    <div class="row mt-3"></div>
                    <hr>


                    <div class="row">
                        <div class="col-12">

                            <c:forEach items="${orders}" var="order">
                                <div class="media">
                                    <img class="d-flex mr-3" data-src="holder.js/200x200?theme=sky"
                                         alt="Generic placeholder image">
                                    <div class="media-body">

                                        <h3 class="mt-0">
                                        <jsp:include page="includedPage/name_of_room.jsp">
                                            <jsp:param name="count_of_clients" value="${order.room.countOfClient}"/>
                                        </jsp:include>
                                        </h3>


                                        <div class="container">
                                            <div class="row">

                                                <div class="col-5">
                                                </div>


                                                <div class="col-7 ">
                                                    <div class="card">
                                                        <div class="card-body">
                                                            <strong><fmt:message key="my_orders_jsp.price"/> : ${order.room.price}.</strong><br>
                                                            <strong><fmt:message key="my_orders_jsp.check_in_date"/> : ${order.startDate}.</strong><br>
                                                            <strong><fmt:message key="my_orders_jsp.check_out_date"/> : ${order.endDate}.</strong><br>

                                                            <c:choose>
                                                                <c:when test="${order.status== true}">
                                                                    <strong><fmt:message key="my_orders_jsp.status"/> : <fmt:message key="my_orders_jsp.paid"/>.</strong><br>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <strong><fmt:message key="my_orders_jsp.status"/> : <fmt:message key="my_orders_jsp.not_paid"/>.</strong><br>
                                                                    <c:if test="${role eq 'CLIENT'}">
                                                                    <a class="btn btn-secondary ml-1 mt-2"
                                                                       href="<%=strContextPath%>/orders?payForTheOrder=${order.id}">
                                                                        <fmt:message key="my_orders_jsp.pay"/>
                                                                    </a>
                                                                    </c:if>
                                                                </c:otherwise>
                                                            </c:choose>

                                                            <c:if test="${role eq 'MANAGER'}">
                                                                <strong><fmt:message key="my_orders_jsp.client"/> :
                                                                        ${order.user.name} ${order.user.surname}.
                                                                </strong>
                                                                <br>
                                                            </c:if>

                                                            <a class="btn btn-secondary ml-1 mt-2"
                                                               href="<%=strContextPath%>/orders?deleteOrder=${order.id}">
                                                                <fmt:message key="my_orders_jsp.delete_order"/>
                                                            </a>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="row mt-3"></div>

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


</body>

</html>