<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String strContextPath = request.getContextPath();%>

<!DOCTYPE html>
<html>

<head>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="<%=strContextPath%>/view/style/stars.css">
    <link rel="stylesheet" href="<%=strContextPath%>/view/style/modalWindow.css">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">


    <style>
        body {
            height: 10000px;
        }
    </style>
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


<div class="container">
    <div class="row mt-5 pt-5">
        <div class="col-1"></div>
        <div class="col-10">
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner" role="listbox">
                    <div class="carousel-item active">
                        <img class="d-block w-100" src="${imgg}" data-src="holder.js/900x400?theme=social" alt="900x400" data-holder-rendered="true" style="width: 900px; height: 400px;">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%22900%22%20height%3D%22400%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20900%20400%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_1772f63dfed%20text%20%7B%20fill%3A%23C2F200%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A45pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_1772f63dfed%22%3E%3Crect%20width%3D%22900%22%20height%3D%22400%22%20fill%3D%22%23434A52%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%22333.203125%22%20y%3D%22220.1%22%3E900x400%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E"
                             data-src="holder.js/900x400?theme=industrial" alt="900x400" data-holder-rendered="true" style="width: 900px; height: 400px;">
                    </div>
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

    <div class="row   mt-5">

        <div class="col-4 ml-5 pl-4">

            <h1>${room.classOfRoom}</h1>
            <h3>${room.roomNumber}</h3>
            <p class="ml-3">
                ${room.countOfClient}
                <c:forEach begin="1" end="${room.countOfClient}" varStatus="loop">
                    <img src="<%=strContextPath%>/resources/rooms_icon/user.png">
                </c:forEach>
            </p>
            ${room.description}



            <br>
            <br> <strong>Додаткові послуги і зручності</strong>

            <p> ${room.additionalServices}</p>
        </div>

        <div class="col-7 ">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="card">

                            <div class="card-body">
                                <h4 class="card-title">Найпопулярніші зручності</h4>

                                <ul>
                                    <li>${room.areaOfRoom} <img src="<%=strContextPath%>/resources/rooms_icon/plan.png"></li>
                                    <c:forEach items="${best_facilities}" var="best_facility">
                                        <li>${best_facility.text} <img src="<%=strContextPath%>/${best_facility.path}"></li>
                                    </c:forEach>
                                </ul>


                            </div>
                        </div>
                    </div>
                </div>

                <div class="row mt-1">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Maps</h4>
                                <p class="card-text">
                                    Adress:
                                </p>


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


                                <p>
                                    <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                                        Link with href
                                    </a>

                                </p>

                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </div>



    </div>


    <div class="row">
        <div class="col-12">


            <div class="card card-body">
                <div class="collapse" id="collapseExample">
                    <div class="row">
                        <div class="col-8"></div>
                        <div class="col-4">

                            <button class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-lg">
                                Large modal
                            </button>

                        </div>
                    </div>


                    <hr>

                </div>
            </div>



        </div>
    </div>






</div>

<form onsubmit='redirect();return false;' method="post">
<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="container mt-5 mb-5">

                <div class="row">
                    <div class="col-2"></div>
                    <div class="col-3 mt-3">
                        <h4>Comfortable</h4>
                    </div>
                    <div class="col-7">
                        <div class="container">
                            <div class="row">
                                <div class="col-12">
                                    <div class="container d-flex justify-content-center mt-200">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <div class="stars">
                                                    <input class="star star-5" id="comfortable_star-5" type="radio" name="comfortable_star" value="5" />
                                                    <label class="star star-5" for="comfortable_star-5"></label>

                                                    <input class="star star-4" id="comfortable_star-4" type="radio" name="comfortable_star" value="4" />
                                                    <label class="star star-4" for="comfortable_star-4"></label>

                                                    <input class="star star-3" id="comfortable_star-3" type="radio" name="comfortable_star" value="3"/>
                                                    <label class="star star-3" for="comfortable_star-3"></label>

                                                    <input class="star star-2" id="comfortable_star-2" type="radio" name="comfortable_star" value="2"/>
                                                    <label class="star star-2" for="comfortable_star-2"></label>

                                                    <input class="star star-1" id="comfortable_star-1" type="radio" name="comfortable_star" value="1"/>
                                                    <label class="star star-1" for="comfortable_star-1"></label>

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
                <div class="row">
                    <div class="col-2"></div>
                    <div class="col-3 mt-3">
                        <h4>Fortunes</h4>
                    </div>
                    <div class="col-7">
                        <div class="container">
                            <div class="row">
                                <div class="col-12">
                                    <div class="container d-flex justify-content-center mt-200">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="stars">

                                                    <input class="star star-5" id="fortunes_star-5" type="radio" name="fortunes_star" value="5" />
                                                    <label class="star star-5" for="fortunes_star-5"></label>

                                                    <input class="star star-4" id="fortunes_star-4" type="radio" name="fortunes_star" value="4" />
                                                    <label class="star star-4" for="fortunes_star-4"></label>

                                                    <input class="star star-3" id="fortunes_star-3" type="radio" name="fortunes_star" value="3"/>
                                                    <label class="star star-3" for="fortunes_star-3"></label>

                                                    <input class="star star-2" id="fortunes_star-2" type="radio" name="fortunes_star" value="2"/>
                                                    <label class="star star-2" for="fortunes_star-2"></label>

                                                    <input class="star star-1" id="fortunes_star-1" type="radio" name="fortunes_star" value="1"/>
                                                    <label class="star star-1" for="fortunes_star-1"></label>

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
                <div class="row">
                    <div class="col-2"></div>
                    <div class="col-3 mt-3">
                        <h4>SoundProof</h4>
                    </div>
                    <div class="col-7">
                        <div class="container">
                            <div class="row">
                                <div class="col-12">
                                    <div class="container d-flex justify-content-center">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="stars">

                                                    <input class="star star-5" id="soundproof_star-5" type="radio" name="soundproof_star" value="5" />
                                                    <label class="star star-5" for="soundproof_star-5"></label>

                                                    <input class="star star-4" id="soundproof_star-4" type="radio" name="soundproof_star" value="4" />
                                                    <label class="star star-4" for="soundproof_star-4"></label>

                                                    <input class="star star-3" id="soundproof_star-3" type="radio" name="soundproof_star" value="3"/>
                                                    <label class="star star-3" for="soundproof_star-3"></label>

                                                    <input class="star star-2" id="soundproof_star-2" type="radio" name="soundproof_star" value="2"/>
                                                    <label class="star star-2" for="soundproof_star-2"></label>

                                                    <input class="star star-1" id="soundproof_star-1" type="radio" name="soundproof_star" value="1"/>
                                                    <label class="star star-1" for="soundproof_star-1"></label>

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
                <div class="row">
                    <div class="col-2"></div>
                    <div class="col-3 mt-3">
                        <h4>Service</h4>
                    </div>
                    <div class="col-7">
                        <div class="container">
                            <div class="row">
                                <div class="col-12">
                                    <div class="container d-flex justify-content-center">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="stars">

                                                    <input class="star star-5" id="service_star-5" type="radio" name="service_star" value="5" />
                                                    <label class="star star-5" for="service_star-5"></label>

                                                    <input class="star star-4" id="service_star-4" type="radio" name="service_star" value="4" />
                                                    <label class="star star-4" for="service_star-4"></label>

                                                    <input class="star star-3" id="service_star-3" type="radio" name="service_star" value="3"/>
                                                    <label class="star star-3" for="service_star-3"></label>

                                                    <input class="star star-2" id="service_star-2" type="radio" name="service_star" value="2"/>
                                                    <label class="star star-2" for="service_star-2"></label>

                                                    <input class="star star-1" id="service_star-1" type="radio" name="service_star" value="1"/>
                                                    <label class="star star-1" for="service_star-1"></label>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="row mt-2 ml-2 mr-2">
                    <div class="col-12">
                        <textarea class="form-control animated" cols="50" id="new-review" name="comment" placeholder="Enter your review here..." rows="5" style=" resize: none;"></textarea>
                    </div>
                </div>

                <div class="row mt-3">
                    <div class="col-10"></div>
                    <div class="col-2"><input type="submit" class="btn btn-primary" value="Send"></div>
                </div>

            </div>
        </div>
    </div>
</div>
</form>

<script src="https://kit.fontawesome.com/d155946f1a.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/holder/2.9.7/holder.min.js" integrity="sha512-O6R6IBONpEcZVYJAmSC+20vdsM07uFuGjFf0n/Zthm8sOFW+lAq/OK1WOL8vk93GBDxtMIy6ocbj6lduyeLuqQ==" crossorigin="anonymous"></script>




</body>

</html>