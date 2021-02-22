<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>



<fmt:setLocale value="ua"/>
<fmt:setBundle basename="resources"/>

<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="container mt-5 mb-5">

                <div class="row">
                    <div class="col-2"></div>
                    <div class="col-3 mt-3">
                        <h4><fmt:message key="room_jsp.comfortable"/></h4>
                    </div>
                    <div class="col-7">
                        <div class="container">
                            <div class="row">
                                <div class="col-12">
                                    <div class="container d-flex justify-content-center mt-200">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <div class="stars">
                                                    <input class="star star-5" id="comfortable_star-5" type="radio"
                                                           name="comfortable_star" value="5"/>
                                                    <label class="star star-5" for="comfortable_star-5"></label>

                                                    <input class="star star-4" id="comfortable_star-4" type="radio"
                                                           name="comfortable_star" value="4"/>
                                                    <label class="star star-4" for="comfortable_star-4"></label>

                                                    <input class="star star-3" id="comfortable_star-3" type="radio"
                                                           name="comfortable_star" value="3"/>
                                                    <label class="star star-3" for="comfortable_star-3"></label>

                                                    <input class="star star-2" id="comfortable_star-2" type="radio"
                                                           name="comfortable_star" value="2"/>
                                                    <label class="star star-2" for="comfortable_star-2"></label>

                                                    <input class="star star-1" id="comfortable_star-1" type="radio"
                                                           name="comfortable_star" value="1"/>
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
                        <h4><fmt:message key="room_jsp.fortunes"/></h4>
                    </div>
                    <div class="col-7">
                        <div class="container">
                            <div class="row">
                                <div class="col-12">
                                    <div class="container d-flex justify-content-center mt-200">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="stars">

                                                    <input class="star star-5" id="fortunes_star-5" type="radio"
                                                           name="fortunes_star" value="5"/>
                                                    <label class="star star-5" for="fortunes_star-5"></label>

                                                    <input class="star star-4" id="fortunes_star-4" type="radio"
                                                           name="fortunes_star" value="4"/>
                                                    <label class="star star-4" for="fortunes_star-4"></label>

                                                    <input class="star star-3" id="fortunes_star-3" type="radio"
                                                           name="fortunes_star" value="3"/>
                                                    <label class="star star-3" for="fortunes_star-3"></label>

                                                    <input class="star star-2" id="fortunes_star-2" type="radio"
                                                           name="fortunes_star" value="2"/>
                                                    <label class="star star-2" for="fortunes_star-2"></label>

                                                    <input class="star star-1" id="fortunes_star-1" type="radio"
                                                           name="fortunes_star" value="1"/>
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
                        <h4><fmt:message key="room_jsp.soundproof"/></h4>
                    </div>
                    <div class="col-7">
                        <div class="container">
                            <div class="row">
                                <div class="col-12">
                                    <div class="container d-flex justify-content-center">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="stars">

                                                    <input class="star star-5" id="soundproof_star-5" type="radio"
                                                           name="soundproof_star" value="5"/>
                                                    <label class="star star-5" for="soundproof_star-5"></label>

                                                    <input class="star star-4" id="soundproof_star-4" type="radio"
                                                           name="soundproof_star" value="4"/>
                                                    <label class="star star-4" for="soundproof_star-4"></label>

                                                    <input class="star star-3" id="soundproof_star-3" type="radio"
                                                           name="soundproof_star" value="3"/>
                                                    <label class="star star-3" for="soundproof_star-3"></label>

                                                    <input class="star star-2" id="soundproof_star-2" type="radio"
                                                           name="soundproof_star" value="2"/>
                                                    <label class="star star-2" for="soundproof_star-2"></label>

                                                    <input class="star star-1" id="soundproof_star-1" type="radio"
                                                           name="soundproof_star" value="1"/>
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
                        <h4><fmt:message key="room_jsp.service"/></h4>
                    </div>
                    <div class="col-7">
                        <div class="container">
                            <div class="row">
                                <div class="col-12">
                                    <div class="container d-flex justify-content-center">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="stars">

                                                    <input class="star star-5" id="service_star-5" type="radio"
                                                           name="service_star" value="5"/>
                                                    <label class="star star-5" for="service_star-5"></label>

                                                    <input class="star star-4" id="service_star-4" type="radio"
                                                           name="service_star" value="4"/>
                                                    <label class="star star-4" for="service_star-4"></label>

                                                    <input class="star star-3" id="service_star-3" type="radio"
                                                           name="service_star" value="3"/>
                                                    <label class="star star-3" for="service_star-3"></label>

                                                    <input class="star star-2" id="service_star-2" type="radio"
                                                           name="service_star" value="2"/>
                                                    <label class="star star-2" for="service_star-2"></label>

                                                    <input class="star star-1" id="service_star-1" type="radio"
                                                           name="service_star" value="1"/>
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
                            <textarea class="form-control animated" cols="50" id="new-review" name="comment"
                                      placeholder="<fmt:message key="room_jsp.enter_review"/>" rows="5"
                                      style=" resize: none;" required></textarea>
                    </div>
                </div>

                <div class="row mt-3">
                    <div class="col-10"></div>
                    <div class="col-2"><input type="submit" class="btn btn-primary" value="<fmt:message key="room_jsp.send"/>"
                                              name="create_review"></div>
                </div>

            </div>
        </div>
    </div>
</div>
