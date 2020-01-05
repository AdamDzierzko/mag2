<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="../tableHeader.jsp" %>

<div id="page-wrapper" style="min-height: 474px;">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Typy produktu</h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <i class="fa fa-table fa-fw"></i> Typy produktu
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <table width="100%" class="table table-hover" id="dataTables-example">
                        <thead>
                        <tr>
                            <td>Id</td>
                            <td>Name</td>
                            <th>Delete/Edit</th>
                        </tr>
                        </thead>
                        <c:forEach items="${typyProduktu}" var="type">
                            <tr>
                                <td>${type.id}</td>
                                <td>${type.typ}</td>
                                <td>
                                    <a href="/typProduktu/delete/${type.id}">Delete</a>
                                    <span> / </span>
                                    <a href="/typProduktu/edit/${type.id}">Edit</a>
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


