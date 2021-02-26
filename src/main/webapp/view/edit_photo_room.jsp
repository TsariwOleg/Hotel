<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String strContextPath = request.getContextPath();%>
<%@ page import="hotel.enums.ClassOfTheRoom" %>
<%@ page import="hotel.enums.Role" %>

<%@ page import="hotel.util.PopularFacilitiesToEntity" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<% List<PopularFacilitiesToEntity.RowOfPopularFacilitiesToEntity> rowOfPopularFacilitiesToEntityList =
        hotel.util.PopularFacilitiesToEntity.getListOfAmenitiesOfRoom();%>

<fmt:setLocale value="${language}"/>
<fmt:setBundle basename="resources"/>

<!DOCTYPE html>
<html lang="en">

<head>


    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

    <link rel="stylesheet" href="<%=strContextPath%>/view/style/modalWindow.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">


</head>


<form action="<%=strContextPath%>/signIn" method="post">
    <jsp:include page="myAccount/includedPage/navbar.jsp"/>
</form>


<div class="container ">
    <div class="row mt-5 pt-5">
        <div class="col-1"></div>
        <h2><fmt:message key="add_new_room_jsp.add_room"/></h2>
        <div class="col-5"></div>
    </div>
    <div class="row mt-2">
        <div class="col-1"></div>
        <div class="col-6"><fmt:message key="add_new_room_jsp.class_of_the_room"/><br>
            <select name="class_of_room" class="custom-select" required>
                <option value="" selected disabled hidden><fmt:message
                        key="room_jsp.choose_class_of_the_room"/></option>
                <option value="${ClassOfTheRoom.ECONOMY.name()}"><fmt:message key="class_of_the_room.economy"/></option>
                <option value="${ClassOfTheRoom.STANDARD.name()}"><fmt:message
                        key="class_of_the_room.standard"/></option>
                <option value="${ClassOfTheRoom.SUPERIOR.name()}"><fmt:message
                        key="class_of_the_room.superior"/></option>
                <option value="${ClassOfTheRoom.PREMIUM.name()}"><fmt:message key="class_of_the_room.premium"/></option>
            </select>
        </div>

    </div>

    <div class="row mt-2">
        <div class="col-1"></div>
        <div class="col-6">No of room
            <input name="No_of_room" class="form-control mr-sm-2 mt-2" type="number" min="1" aria-label="Search"
                   required>
        </div>
    </div>


    <hr>

    <form method="post" onsubmit='redirect();return false;' enctype="multipart/form-data">

        <div class="row mt-4">
            <div class="col-1"></div>
            <div class="col-6"><fmt:message key="add_new_room_jsp.additional_services"/>
                <div class="custom-file">
                    <input type="file" class="custom-file-input" name="tre" id="customFile" multiple accept="image/*,image/jpeg">
                    <label class="custom-file-label" for="customFile">Choose file</label>



                </div>
            </div>
            <div class="col-1"></div>
        </div>

        <input type="submit">
    </form>


    <div class="row mt-2 ">
        <div class="col-1 "></div>
        <div class="col-6 "></div>
        <div class="col-4 ">

            <input type="submit" class="btn btn-primary " value="<fmt:message key="add_new_room_jsp.create"/>"
                   required>

        </div>
        <div class="col-1 "></div>
    </div>

</div>


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

<script>
    // Add the following code if you want the name of the file appear on select
    $(".custom-file-input").on("change", function() {
        var fileName = $(this).val().split("\\").pop();
        $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
    });
</script>

</body>

</html>