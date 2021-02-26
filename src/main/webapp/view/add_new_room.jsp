<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ include file="myAccount/directive/taglib.jspf" %>

<% String strContextPath = request.getContextPath();%>
<%@ page import="hotel.enums.ClassOfTheRoom" %>

<%@ page import="hotel.util.PopularFacilitiesToEntity" %>
<%@ page import="java.util.List" %>

<% List<PopularFacilitiesToEntity.RowOfPopularFacilitiesToEntity> rowOfPopularFacilitiesToEntityList =
        hotel.util.PopularFacilitiesToEntity.getListOfAmenitiesOfRoom();%>



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

<form onsubmit='redirect();return false;' method="post" enctype="multipart/form-data">
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
                    <option value="" selected disabled hidden><fmt:message key="room_jsp.choose_class_of_the_room"/></option>
                    <option value="${ClassOfTheRoom.ECONOMY.name()}"><fmt:message key="class_of_the_room.economy"/></option>
                    <option value="${ClassOfTheRoom.STANDARD.name()}"><fmt:message key="class_of_the_room.standard"/></option>
                    <option value="${ClassOfTheRoom.SUPERIOR.name()}"><fmt:message key="class_of_the_room.superior"/></option>
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


        <div class="row mt-3">
            <div class="col-1"></div>
            <div class="col-6"><fmt:message key="add_new_room_jsp.count_of_clients"/>

                <select name="count_of_client" class="custom-select">

                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>
            </div>
            <div class="col-1"></div>
        </div>


        <div class="row mt-2">
            <div class="col-1"></div>
            <div class="col-6"><fmt:message key="add_new_room_jsp.price"/>
                <input name="price_per_night" class="form-control mr-sm-2 mt-2" type="number" aria-label="Search"
                       min="1" required>
            </div>
            <div class="col-1"></div>
        </div>


        <div class="row mt-2">
            <div class="col-1"></div>
            <div class="col-6"><fmt:message key="add_new_room_jsp.area_of_the_room"/>
                <input name="area_of_room" class="form-control mr-sm-2 mt-2" type="number" aria-label="Search" min="5"
                       required>
            </div>
            <div class="col-1"></div>
        </div>

        <div class="row mt-4">
            <div class="col-1"></div>
            <div class="col-6"><fmt:message key="add_new_room_jsp.description"/>
                <span class="badge badge-secondary" data-toggle="tooltip" data-placement="top"
                      title="Tooltip on top">?</span>
                <textarea name="description" class="form-control" rows="3" style=" resize: none;" required
                          minlength="200" maxlength="500"></textarea>

            </div>
            <div class="col-1"></div>
        </div>

        <hr>
        <div class="row mt-4">
            <div class="col-1"></div>
            <h4><fmt:message key="add_new_room_jsp.facilities_and_amenities"/></h4>
            <div class="col-5"></div>
        </div>

        <div class="row mt-4">
            <div class="col-1"></div>
            <div class="col-10">
                <fmt:message key="add_new_room_jsp.best_amenities"/>
                <div class="container mt-2">

                    <c:forEach items="<%=rowOfPopularFacilitiesToEntityList%>" var="amenity_of_room">


                        <div class="row">
                            <div class="col-4">
                                <div class="custom-control custom-checkbox">

                                    <input name="case" type="checkbox" class="custom-control-input"
                                           id="${amenity_of_room.firstCol.id}"
                                           value="${amenity_of_room.firstCol.enumName}">
                                    <label class="custom-control-label" for="${amenity_of_room.firstCol.id}">
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
                                        <label class="custom-control-label" for="${amenity_of_room.secondCol.id}">
                                            <fmt:message key="amenities.${amenity_of_room.secondCol.resourceName}"/>
                                            <img src="<%=strContextPath%>/${amenity_of_room.secondCol.path}"></label>
                                    </div>
                                </div>
                            </c:if>


                            <c:if test="${not empty amenity_of_room.thirdCol}">
                                <div class="col-4">
                                    <div class="custom-control custom-checkbox">
                                        <input name="case" type="checkbox" class="custom-control-input"
                                               id="${amenity_of_room.thirdCol.id}"
                                               value="${amenity_of_room.thirdCol.enumName}">
                                        <label class="custom-control-label" for="${amenity_of_room.thirdCol.id}">
                                            <fmt:message key="amenities.${amenity_of_room.thirdCol.resourceName}"/>

                                            <img src="<%=strContextPath%>/${amenity_of_room.thirdCol.path}"></label>
                                    </div>
                                </div>
                            </c:if>

                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>



        <div class="row mt-4">
            <div class="col-1"></div>
            <div class="col-6"><fmt:message key="add_new_room_jsp.additional_services"/>
                <span class="badge badge-secondary" data-toggle="tooltip" data-placement="top"
                      title="Tooltip on top">?</span>
                <textarea name="additional_services" class="form-control" rows="4" style=" resize: none;" required
                          minlength="100" maxlength="300"></textarea>

            </div>
            <div class="col-1"></div>
        </div>


        <hr>
        <div class="row mt-4">
            <div class="col-1"></div>
            <h4>Фото</h4>
            <div class="col-5"></div>
        </div>

        <div class="row mt-4">
            <div class="col-1"></div>
            <div class="col-6">Головне фото
                <div class="custom-file">
                    <input type="file" class="custom-file-input" name="main_photo" id="customFile" required accept="image/*,image/jpeg">
                    <label class="custom-file-label" for="customFile">Choose file</label>
                </div>

            </div>
            <div class="col-1"></div>
        </div>

        <div class="row mt-2">
            <div class="col-1"></div>
            <div class="col-6">Додаткові фото
                <div class="custom-file">
                    <input type="file" class="custom-file-input" name="photos" id="customFilek" required multiple accept="image/*,image/jpeg">
                    <label class="custom-file-label" for="customFile">Choose file</label>
                </div>

            </div>
            <div class="col-1"></div>
        </div>


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

<script src="../js/filter.js"></script>
<script>
    // Add the following code if you want the name of the file appear on select
    $(".custom-file-input").on("change", function() {
        var fileName = $(this).val().split("\\").pop();
        $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
    });
</script>

</body>

</html>