<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String strContextPath = request.getContextPath();%>
<!DOCTYPE html>
<html>

<head>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="<%=strContextPath%>/view/style/modalWindow.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">


</head>

<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">Hotel</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
        </ul>

        <form class="form-inline my-2 my-lg-0">


            <div class="dropdown">
                <button class="btn btn-secondary dropdown-toggle ml-4" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="bi bi-globe2"></i> Language
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenu1">
                    <a class="dropdown-item" href="#!">English</a>
                    <a class="dropdown-item" href="#!">Ukranian</a>
                </div>
            </div>

            <button type="submit" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                <i class="bi bi-person-circle"></i> Sign in
            </button>


            <!-- Modal HTML -->
            <div id="myModal" class="modal fade">
                <div class="modal-dialog modal-login">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Member Login</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <form action="/examples/actions/confirmation.php" method="post">
                                <div class="form-group">
                                    <i class="fa fa-user"></i>
                                    <input type="text" class="form-control mt-4 ml-auto mr-auto" placeholder="Username" required="required">
                                </div>
                                <div class="form-group">
                                    <i class="fa fa-lock"></i>
                                    <input type="password" class="form-control mt-2 ml-auto mr-auto" placeholder="Password" required="required">
                                </div>
                                <div class="form-group">
                                    <input type="submit" class="btn btn-primary btn-block btn-lg mt-4" value="Login">
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <a href="#">Forgot Password?</a>
                        </div>
                    </div>
                </div>
            </div>

        </form>
    </div>
</nav>

<form onsubmit='redirect();return false;' method="post">

    <div class="container">


        <div class="row mt-5 pt-5">
            <div class="col-10"></div>
            <div class="col-2">
                <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Sorting
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenu1">
                        <input type="submit" name="sorted_by_price" class="dropdown-item"  value="By price">
                        <input type="submit" name="sorted_by_price_reverse" class="dropdown-item"  value="By reverce">
                        <input type="submit" name="sorted_by_count_of_clients" class="dropdown-item"  value="By count of">
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
                <p>
                    <a class="btn btn-link collapsed" data-toggle="collapse" href="#collapse1" aria-expanded="false" aria-controls="collapseExample">
                        Link with href
                    </a>
                </p>

                <div class="collapse mb-2 " id="collapse1" style="">
                    <div class="card card-body border-0">
                        <label for="priceRangeNumber">
                            <div class="form-group">
                                <input type="number" class="form-control" id="priceRangeNumber" placeholder="Example input"
                                       name="price">
                            </div>
                        </label>
                        <input type="range" class="custom-range" id="priceRange" min="2" max="1000000" step="1">
                    </div>

                </div>
                <hr>


                <p>
                    <a class="btn btn-primary collapsed" data-toggle="collapse" href="#collapse3" aria-expanded="false" aria-controls="collapseExample">
                        Link with hsref
                    </a>
                </p>
                <div class="collapse mb-2" id="collapse3" style="">
                    <div class="card card-body">
                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident.
                    </div>
                </div>
                <hr>

                <p>
                    <a class="btn btn-link collapsed" data-toggle="collapse" href="#collapse2" aria-expanded="false" aria-controls="collapseExample">
                        Link with href
                    </a>
                </p>

                <div class="collapse mb-2" id="collapse2" style="">
                    <div class="card card-body border-0">
                        Count of users

                        <div class="custom-control custom-checkbox">
                            <input value="1" name="count_of_clients" type="checkbox" class="custom-control-input" id="customCheck1">
                            <label class="custom-control-label" for="customCheck1">1
                                <img src="<%=strContextPath%>/resources/rooms_icon/user.png">
                            </label>
                        </div>

                        <div class="custom-control custom-checkbox">
                            <input value="2" name="count_of_clients" type="checkbox" class="custom-control-input" id="customCheck2">
                            <label class="custom-control-label" for="customCheck2">2
                                <img src="<%=strContextPath%>/resources/rooms_icon/user.png">
                                <img src="<%=strContextPath%>/resources/rooms_icon/user.png">
                            </label>
                        </div>

                        <div class="custom-control custom-checkbox">
                            <input value="3" name="count_of_clients" type="checkbox" class="custom-control-input" id="customCheck3">
                            <label class="custom-control-label" for="customCheck3">3
                                <img src="<%=strContextPath%>/resources/rooms_icon/user.png">
                                <img src="<%=strContextPath%>/resources/rooms_icon/user.png">
                                <img src="<%=strContextPath%>/resources/rooms_icon/user.png">
                            </label>
                        </div>

                        <div class="custom-control custom-checkbox">
                            <input value="4" name="count_of_clients" type="checkbox" class="custom-control-input" id="customCheck4">
                            <label class="custom-control-label" for="customCheck4">4
                                <img src="<%=strContextPath%>/resources/rooms_icon/user.png" >
                                <img src="<%=strContextPath%>/resources/rooms_icon/user.png">
                                <img src="<%=strContextPath%>/resources/rooms_icon/user.png">
                                <img src="<%=strContextPath%>/resources/rooms_icon/user.png">
                            </label>
                        </div>

                        <div class="custom-control custom-checkbox">
                            <input value="5" name="count_of_clients" type="checkbox" class="custom-control-input" id="customCheck5">
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
                    <input type="submit" class="btn btn-primary" value="Primary" name="filter_submit">
                </p>
            </div>



            <div class="col-9 pl-4">

                <c:forEach items="${rooms}" var="room">
                    <div class="media">
                        <img class="d-flex mr-3" data-src="holder.js/200x200?theme=sky" alt="Generic placeholder image">
                        <div class="media-body">


                            <h3 class="mt-0">${room.classOfRoom}</h3>


                            <div class="container">
                                <div class="row">

                                    <div class="col-5">
                                        <div class="container">
                                            <div class="row mt-4">
                                                <div class="col-12"></div>
                                                    ${room.countOfClient}
                                                <c:forEach begin="1" end="${room.countOfClient}" varStatus="loop">
                                                    <img src="<%=strContextPath%>/resources/rooms_icon/user.png">
                                                </c:forEach>

                                            </div>

                                            <div class="row mt-5 ">
                                                <div class="col-8">
                                                    <p>
                                                        <a class="btn btn-link" data-parent="#collapse-group" data-toggle="collapse" href="#reviewCollapse" aria-expanded="false" aria-controls="collapseExample">
                                                            <span class="badge badge-primary">7,7</span> Good <i class="bi bi-chevron-down"></i>
                                                        </a>

                                                    </p>
                                                </div>
                                            </div>


                                        </div>
                                    </div>


                                    <div class="col-7 ">
                                        <div class="card">
                                            <div class="card-body">
                                                <p class="card-text">
                                                        ${room.description}
                                                </p>
                                                <p><strong>Price :${room.price}.</strong></p>
                                                <p><strong>State :${room.price}.</strong></p>
                                                <a href="${pageContext.request.contextPath}/room?id=${room.id}" class="btn btn-primary">SEE</a>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="collapse" id="reviewCollapse">
                                <div class="card card-body mt-2 ">
                                    <div class="container ">
                                        <div class="row">
                                            <div class="col-3 ">Location</div>
                                            <div class="col-5 mt-2 mr-0">

                                                <div class="progress">
                                                    <div class="progress-bar" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                                </div>
                                            </div>
                                            <div class="col-4">
                                                Good(7.7/10)
                                            </div>
                                        </div>


                                        <div class="row mt-2">
                                            <div class="col-3 pr-1"> Room</div>
                                            <div class="col-5 mt-2">
                                                <div class="progress">
                                                    <div class="progress-bar" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                                </div>
                                            </div>
                                            <div class="col-4">
                                                Very good(9.7/10)
                                            </div>
                                        </div>


                                        <div class="row mt-2">
                                            <div class="col-3 pr-1"> Service</div>
                                            <div class="col-5 mt-2">
                                                <div class="progress">
                                                    <div class="progress-bar" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                                </div>
                                            </div>
                                            <div class="col-4">
                                                Fair(9.7/10)
                                            </div>
                                        </div>


                                        <div class="row mt-2">
                                            <div class="col-3 pr-1"> Value for money</div>
                                            <div class="col-5 mt-2">
                                                <div class="progress">
                                                    <div class="progress-bar" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                                </div>
                                            </div>
                                            <div class="col-4">
                                                Excellent(9.7/10)
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
</form>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/holder/2.9.7/holder.min.js" integrity="sha512-O6R6IBONpEcZVYJAmSC+20vdsM07uFuGjFf0n/Zthm8sOFW+lAq/OK1WOL8vk93GBDxtMIy6ocbj6lduyeLuqQ==" crossorigin="anonymous"></script>
<script src="<%=strContextPath%>/view/js/filter.js"></script>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBIwzALxUPNbatRBj3Xi1Uhp0fFzwWNBkE&callback=initMap&libraries=&v=weekly" defer></script>
</body>

</html>