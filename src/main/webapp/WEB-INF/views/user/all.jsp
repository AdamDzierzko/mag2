<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<script src="https://code.jquery.com/jquery-3.0.0.js"></script>
<script src="https://code.jquery.com/jquery-migrate-3.1.0.js"></script>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="../tableHeader.jsp" %>

<script type="text/javascript">

	$(document).ready(function() {
		//alert("good")
		$('#id_get_time').click(function() {
//			alert('naciśnięty')
			$.ajax({
				url : '/user/gettime',
				success : function (data) {
					$("#id_time").html(data);
					}
				});
			});
		});
</script>
<div id="page-wrapper" style="min-height: 474px;">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Użytkownicy</h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <i class="fa fa-table fa-fw"></i> Użytkownicy
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <table width="100%" class="table table-hover" id="dataTables-example">
                        <thead>
                        <tr>
                            <th>Id</th>
                            <th>Name</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${users}" var="user">
                            <tr>
                                <td>${user.id}</td>
                                <td>${user.name}</td>
                                <td>
                                    <a href="/user/delete/${user.id}">Delete</a>
                                    <span> / </span>
                                    <a href="/user/edit/${user.id}">Editaaaa</a>
                                    <div class="passingID" data-id="${user.id}">
                                      <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Modal</button>
                                    </div>
                                </td>
                            </tr>
                            </c:forEach>                     
                        
                        </tbody>
                    </table>
                    <button id="id_get_time"> Get date</button>
                    <p id="id_time"></p>
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-12 -->
    </div>
</div>
<!-- /#page-wrapper -->

<button id="id_get_time"> Get date</button>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="exampleModalLongTitle"><i class="fa fa-edit fa-fw"></i> Zmień nazwę użytkownika </h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
			<form id="user">
				<input type="hidden" id="ida" name="id" value='11'>
				<label for="name" id="name">Name</label>
				<input type="text" id="namea" name="name">

			 </form> 
			
			<div id="ajax-errors" class="alert alert-danger" role="alert" style="display: none">Nie działa</div>
			
			
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> 
        <button type="button" class="btn btn-primary" id="btnSaveEdit">Save changes</button>
  
        </div>
      </div>
    </div>
  </div>
</div>

  	<script>
  	$(".passingID").click(function () {
  	    var ids = $(this).attr('data-id');
  	    $("#ida").val( ids );
  	});
  	
  	$('#btnSaveEdit').click(function () {
  		         
  		var id = $('#ida').val();
  	  	var name = $('#namea').val();
  	  	
 //   	alert(name + ' ' + id);

		$.ajax({
			url : "/user/gettime",
			success : function (data) {
//				$("#id_time").html(data);
				alert(data)
				}
			});
    	
  	});
  	
  	</script>

<%@include file="../tableFooter.jsp" %>
