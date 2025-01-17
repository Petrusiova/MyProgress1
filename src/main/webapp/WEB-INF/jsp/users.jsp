<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<html>
<jsp:include page="fragments/headTag.jsp"/>
<body>

<script src="resources/js/common.js" defer></script>
<script src="resources/js/users.js" defer></script>

<div class="container-fluid">
    <div class="row">
        <jsp:include page="fragments/bodyHeader.jsp"/>
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
            <div class="chartjs-size-monitor"
                 style="position: absolute; inset: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
                <div class="chartjs-size-monitor-expand"
                     style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
                    <div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0">
                    </div>
                </div>
                <div class="chartjs-size-monitor-shrink"
                     style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
                    <div style="position:absolute;width:200%;height:200%;left:0; top:0">
                    </div>
                </div>
            </div>
            <section>
                <h3><spring:message code="user.title"/></h3>
                <button class="btn btn-primary" onclick="add()">
                    <span class="fa fa-plus"></span>
                    <spring:message code="common.add"/>
                </button>
                <div class="table-responsive" data-color="#655f5f">
                <table class="table table-striped" id="datatable">
                    <thead>
                    <tr>
                        <th><spring:message code="user.name"/></th>
                        <th><spring:message code="user.email"/></th>
                        <th><spring:message code="user.roles"/></th>
                        <th><spring:message code="user.active"/></th>
                        <th><spring:message code="user.registered"/></th>
                        <th></th>
                        <th></th>
                    </tr>
                    </thead>
                    <c:forEach items="${users}" var="user">
                        <jsp:useBean id="user" type="myProgress.model.User"/>
                        <tr data-userEnabled="${user.enabled}">
                            <td><c:out value="${user.name}"/></td>
                            <td><a href="mailto:${user.email}">${user.email}</a></td>
                            <td>${user.roles}</td>
                            <td><input type="checkbox" <c:if test="${user.enabled}">checked</c:if>  onclick="enable($(this), ${user.id})"/></td>
                            <td><fmt:formatDate value="${user.registered}" pattern="dd-MM-yyyy"/></td>
                            <td><a><span class="fa fa-pencil"></span></a></td>
                            <td><a onclick="deleteRow(${user.id})"><span class="fa fa-remove"></span></a></td>
                        </tr>
                    </c:forEach>
                </table>
                </div>
            </section>
        </main>
    </div>
</div>
<%--всплывашка добавления юзера начало--%>
<div class="modal fade" tabindex="-1" id="editRow">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title"><spring:message code="user.add"/></h4>
                <button type="button" class="close" data-dismiss="modal"  onclick="closeNoty()">&times;</button>
            </div>
            <div class="modal-body">
                <form id="detailsForm">
                    <input type="hidden" id="id" name="id">

                    <div class="form-group">
                        <label for="name" class="col-form-label"><spring:message code="user.name"/></label>
                        <input type="text" class="form-control" id="name" name="name"
                               placeholder="<spring:message code="user.name"/>">
                    </div>

                    <div class="form-group">
                        <label for="email" class="col-form-label"><spring:message code="user.email"/></label>
                        <input type="email" class="form-control" id="email" name="email"
                               placeholder="<spring:message code="user.email"/>">
                    </div>

                    <div class="form-group">
                        <label for="password" class="col-form-label"><spring:message code="user.password"/></label>
                        <input type="password" class="form-control" id="password" name="password"
                               placeholder="<spring:message code="user.password"/>">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="closeNoty()">
                    <span class="fa fa-close"></span>
                    <spring:message code="common.cancel"/>
                </button>
                <button type="button" class="btn btn-primary" onclick="save()">
                    <span class="fa fa-check"></span>
                    <spring:message code="common.save"/>
                </button>
            </div>
        </div>
    </div>
</div>
<%--всплывашка добавления юзера заканчивается--%>
</body>
</html>