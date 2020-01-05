<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="../tableHeader.jsp" %>

<div id="page-wrapper" style="min-height: 474px;">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Produkty</h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <i class="fa fa-table fa-fw"></i> Tabela produkty
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <table width="100%" class="table table-hover" id="dataTables-example">
                        <thead>
                        <tr>
                            <th>Id</th>
                            <th>Nazwa</th>
                            <th>Numer seryjny</th>
                            <th>Data</th>
                            <th>Uzytkownik</th>
                            <th>Stan produktu</th>
                            <th>Typ produktu</th>
                            <th>Delete/Edit</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${products}" var="product">
                            <tr>
                                <td>${product.id}</td>
                                <td>${product.nazwa}</td>
                                <td>${product.numerSeryjny}</td>
                                <td>${product.data}</td>
                                <td>${product.user.name}</td>
                                <td>${product.stanProduktu.stan}</td>
                                <td>${product.typProduktu.typ}</td>
                                <td>
                                    <a href="/produkt/delete/${product.id}">Delete</a>
                                    <span> / </span>
                                    <a href="/produkt/edit/${product.id}">Edit</a>
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


