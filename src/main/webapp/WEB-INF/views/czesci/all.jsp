<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="../tableHeader.jsp" %>

<div id="page-wrapper" style="min-height: 474px;">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Elementy</h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <i class="fa fa-table fa-fw"></i> Elementy
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <table width="100%" class="table table-hover" id="dataTables-example">
                        <thead>
                        <tr>
                            <td>Id</td>
                            <td>Data</td>
                            <td>Nazwa</td>
                            <td>Ilosc</td>
                            <td>Uzytkownik</td>
                            <td>Typ czesci</td>
                            <th>Delete/Edit</th>
                            <th>Zmiana ilości</th>
                        </tr>
                        </thead>
                        <c:forEach items="${czesci}" var="czesci">
                            <tr>
                                <td>${czesci.id}</td>
                                <td>${czesci.data}</td>
                                <td>${czesci.nazwa}</td>
                                <td>${czesci.ilosc}</td>
                                <td>${czesci.user.name}</td>
                                <td>${czesci.typCzesci.typ}</td>
                                <td>
                                    <a href="/czesci/delete/${czesci.id}">Delete</a>
                                    <span> / </span>
                                    <a href="/czesci/edit/${czesci.id}">Edit</a>
                                </td>
                                <td><a href="/czesci/zmiana/${czesci.id}">Zmiana ilosci</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-12 -->
    </div>
</div>
<!-- /#page-wrapper -->

<%@include file="../tableFooter.jsp" %>
