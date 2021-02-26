<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%----%>
<%--Pleasant--%>
<%----%>
<%--Wonderful--%>


<c:if test="${param.total_ratting>=0.0 && param.total_ratting<1.0}">
    Bad<span class="badge badge-primary">${param.total_ratting}</span>
</c:if>

<c:if test="${param.total_ratting>=1.0 && param.total_ratting<2.0}">
    Pleasant<span class="badge badge-primary">${param.total_ratting}</span>
</c:if>

<c:if test="${param.total_ratting>=2.0 && param.total_ratting<3.0}">
    Good <span class="badge badge-primary">${param.total_ratting}</span>
</c:if>

<c:if test="${param.total_ratting>=4.0 && param.total_ratting<=5.0}">
    Wonderful<span class="badge badge-primary">${param.total_ratting}</span>
</c:if>

