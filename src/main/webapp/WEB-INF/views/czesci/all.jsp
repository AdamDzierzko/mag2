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
//		alert('naciśnięty')
/*			var a = 5;
		var b = "ad"
		var data = {}
		data["id"] = a
		data["name"] = b
		*/
		
		$.ajax({
			url : '/czesci/gettime',
			type: "post",
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
                                    <div class="passingID" data-id="${czesci.id}">
                                      <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Modal</button>
                                    </div>
                                </td>
                                <td><a href="/czesci/zmiana/${czesci.id}">Zmiana ilosci</a>
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

// *****************************************************
// podłączenie repo z spring do github i tworzenie lokalnego repository 

// integracja z maven
// konieczny form z taglib
// skonfigurać z maven 
// configure -> convert to maven project
// form z c: rozbudowany skierowanie do entity
// import z 
// https://www.youtube.com/watch?v=-PiXr5Emtd0
// https://www.youtube.com/watch?v=-PiXr5Emtd0
// pobranie jdk 1.8 - 231
// path %MAVEN_HOME%\bin
// java home C:\Program Files\Java\jdk1.8.0_171
// catalina home C:\servers\apache-tomcat-8.0.52
// maven home C:\Software\maven
// path C:\Program Files\Java\jdk1.8.0_171 C:\Program Files\Java\jdk1.8.0_144\bin
// repository https://github.com/AdamDzierzko/mag2.git
// magazyn[master] - c:\magazyn\.git
// tworzenie lokalnego repo
// git init
// git add . 
// git commit -m "first commit"
// git remote add origin https://github.com/AdamDzierzko/mag2.git
// git push -u origin master
// aaa
// 

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
<!--      <c:forEach items="${czesci}" var="czesci">     -->
			<form id="czesci">
				<input  type="hidden" id="ida" name="id" />			
				<label for="nazwa" id="nazwa">Nazwa</label>
				<input   type="text" id="nazwac" name="nazwa"/>
				<br>
  				
				<label for="iloscc" id="iloscc">Ilosc</label>
				<input type="text" id="iloscc" name="ilosc"/>
				<br>
<!-- 				
				<label for="userc" id="userc">Uzytkownik</label>
				<input type="text" id="userc" name="userc"/>
<!--    		<select itemLabel="name" cssClass="form-control" items="${users}"></select>  -->
				<br>
<!-- 				
				<label for="typCzescic" id="typCzescic">Typ czesci</label>
				<input type="text" id="typCzescic" name="typCzescic"/>
				<br>
				-->
				
<!--  		   	<select itemLabel="typ" path="typCzesci" cssClass="form-control" items="${typCzesci}"/>  -->    			
    			
			 </form> 
 <!-- 		</c:forEach>    -->
					
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
  	  	var nazwa = $('#nazwac').val();
   	  	var ilosc = $('#iloscc').val();
//		var user = $('#userc').val();
//		var typCzesci = $('#typCzescic').val();
  	  	
		alert("aaaaaaaaaaaa")
// 	  	var formData  = $("#user").serialize();
  	  		
		$.ajax({
			type : "POST",
			url : "/czesci/edit",
//			contentType : 'application/json',
//			data : JSON.stringify(data),
//			dataType: 'json',
			data : {
				id : id,
				nazwa : nazwa
				ilosc : ilosc
//				user : user
//				typCzesci : typCzesci
				}
		})
	      .always(function() { $('#myModal').modal('hide'); 
	      window.location.reload()		// przeladuje strone
	      }	)	
  	});

  	</script>

<%@include file="../tableFooter.jsp" %>
