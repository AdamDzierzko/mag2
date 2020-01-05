<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="../formHeader.jsp" %>

<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Edytuj element</h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <i class="fa fa-edit fa-fw"></i> Edytuj element
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-6">

                            <form:form method="post" modelAttribute="czesci">

                                <div class="form-group">
                                    <label>zmiana ilosci elementu ${czesci.nazwa} </label>
                                    <input name="z" type="text" class="form-control"/>
                                    <input name="i" type="hidden" class="form-control" value="${czesci.id}"/>
                                </div>

                                <div class="form-group">
                                    <for:label path="user">Uzytkownik</for:label>
                                    <form:select itemLabel="name" path="user" cssClass="form-control" items="${users}"/>
                                </div>

                                <div class="form-group">
                                    <form:hidden path="id"/>
                                    <form:hidden path="nazwa" value="${czesci.nazwa}"/>
                                    <form:hidden path="ilosc" value="${czesci.ilosc}"/>
                                    <form:hidden path="typCzesci" value="${czesci.typCzesci.id}"/>

                                </div>
                                <button type="submit" class="btn btn-default">Submit</button>
                            </form:form>

                        </div>
                    </div>
                    <!-- /.row (nested) -->
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-12 -->
    </div>
</div>

<%@include file="../formFooter.jsp" %>
