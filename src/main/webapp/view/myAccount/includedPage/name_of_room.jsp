<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<c:if test="${param.count_of_clients==1 }">
    <h3 class="mt-0"> Single room</h3>
</c:if>

<c:if test="${param.count_of_clients==2}">
    <h3 class="mt-0"> Double room</h3>
</c:if>


<c:if test="${param.count_of_clients==3}">
    <h3 class="mt-0"> Triple room</h3>
</c:if>

<c:if test="${param.count_of_clients==4}">
    <h3 class="mt-0"> Quadruple room</h3>
</c:if>

<c:if test="${param.count_of_clients==5}">
    <h3 class="mt-0"> Studio apartment</h3>
</c:if>

