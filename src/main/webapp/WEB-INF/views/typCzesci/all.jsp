<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="../tableHeader.jsp" %>

<div id="page-wrapper" style="min-height: 474px;">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Typy elementow</h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <i class="fa fa-table fa-fw"></i> Typy elementow
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
                        <c:forEach items="${typyCzesci}" var="type">
                            <tr>
                                <td>${type.id}</td>
                                <td>${type.typ}</td>
                                <td>
                                    <a href="/typCzesci/delete/${type.id}">Delete</a>
                                    <span> / </span>
                                    <a href="/typCzesci/edit/${type.id}">Edit</a>
                                    <div class="passingID" data-id="${type.id}">
                                      <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Modal</button>
                                    </div>
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
				<input  type="hidden" id="ida" name="id"/>
				<label for="name" id="name">Name</label>
				<input   type="text" id="namea" name="name"/>

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
  	$(".passingID").click(function () {        //hidden z formularza aby id pozstał bez zmian
  	    var ids = $(this).attr('data-id');
  	    $("#ida").val( ids );
  	});
  	
  	$('#btnSaveEdit').click(function () {	// wysłanie danych do controllera
  		         
  		var id = $('#ida').val();
  	  	var name = $('#namea').val();

// 	  	var formData  = $("#user").serialize();
  	  		
		$.ajax({
			type : "POST",
			url : "/user/edit",
//			contentType : 'application/json',
//			data : JSON.stringify(data),
//			dataType: 'json',
			data : {
				id : id,
				name : name
				}
		})
	      .always(function() { $('#myModal').modal('hide'); 
	      window.location.reload()		// przeladuje strone
	      }	)	
  	});
 	
  	</script>

<%@include file="../tableFooter.jsp" %>
