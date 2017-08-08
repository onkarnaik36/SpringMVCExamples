<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Employee Management Screen</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.modal-dialog
{
width:480px;
}
modal {
    overflow-y: auto;
}

.modal-open {
    overflow: auto;
}

.modal-open[style] {
    padding-right: 0px !important;
}
</style>
</head>
<body>
<div class="container">
  <h2>User Form</h2>
  <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal">Add User</button>
  <br>
  <br>
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">User Data</h4>
        </div>
        <div class="modal-body">
          <form:form action="saveEmployee" method="post" modelAttribute="employee" id="userForm">
			  <div class="form-group">
			    <label for="email">Name</label>
			   	<form:input path="name" name="name" class="form-control"/>
			  </div>
			  <div class="form-group">
			    <label for="email">Email:</label>
			    <form:input path="email" name="email" class="form-control"/>
			  </div>
			    <div class="form-group">
			    <label for="email">Address:</label>
			 	 <form:input path="address" name="address" class="form-control" />
			  </div>
			   <div class="form-group">
			    <label for="email">Telephone:</label>
			 	 <form:input path="telephone" name="telephone" class="form-control"/>
			  </div>
			  <button type="submit" class="btn btn-default save-button">Save</button>
			</form:form> 
        </div>
      </div>
    </div>
  </div>
    <div class="modal fade" id="editDetail" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Edit User Data</h4>
        </div>
        <div class="modal-body">
          <form:form action="saveEmployee" method="post" modelAttribute="employee" id="editUserForm">
          	  <form:input type="hidden" name="userid" path="id" id="editId"/>
 			  <div class="form-group">
			    <label for="email">Name</label>
			   	<form:input path="name" name="name" class="form-control" id="editName"/>
			  </div>
			  <div class="form-group">
			    <label for="email">Email:</label>
			    <form:input path="email" name="email" class="form-control" id="editEmail"/>
			  </div>
			    <div class="form-group">
			    <label for="email">Address:</label>
			 	 <form:input path="address" name="address" class="form-control" id="editAddress"/>
			  </div>
			   <div class="form-group">
			    <label for="email">Telephone:</label>
			 	 <form:input path="telephone" name="telephone" class="form-control" id="editTelephone"/>
			  </div>
			  <button type="submit" class="btn btn-default update-button" id="editUser">Update</button>
			</form:form> 
        </div>
      </div>
    </div>
  </div>
	<div align="center">
		<table cellspacing="0" id="countrytable" class="table table-bordered"> 
		    <tr> 
		    <th>Id</th>
		    <th>Name</th>
			<th>Email</th>
			<th>Address</th>
			<th>Telephone</th>
			<th>Action</th>
		    </tr> 
		    <tbody>
		    
		    </tbody>
		</table>
	</div>
  <div class="modal fade" id="successModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
	       <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        <div class="modal-body msgbody">
	        </div>
      </div>
    </div>
  </div>
</div>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
    <script src="http://bootboxjs.com/bootbox.js"></script>
	 <script>
	  $(document).ready(function(){
	  $(".success-Alert").hide();
	  listUser();
	  $("#userForm").submit(function(event){
		 $(".save-button").attr("disabled","disabled");
	    event.preventDefault(); //prevent default action
	    var post_url =$("#userForm").attr("action"); //get form action url
	    var request_method = $("#userForm").attr("method"); //get form GET/POST method
	    var form_data = $("#userForm").serialize(); //Encode form elements for submission
	    $.ajax({
		    url: 'saveEmployee',
		    type: request_method,
		    data: form_data,
		    success: function( data, textStatus, jQxhr )
		    {
			   /*  $("#myModal").modal('toggle');
			    $("#successModal").modal('show').fadeIn(3000); */
				$("#myModal").modal('toggle');
			    $(".msgbody").empty();
			    $(".msgbody").append("<p class='alert alert-info text-center'>Data Saved Successfully.</p>");
			    $("#successModal").modal("show");
		    	listUser(); 
		    },
		    error: function( jqXhr, textStatus, errorThrown ){
		        console.log( errorThrown );
		    }
		});
	});
	  $("#editUser").click(function(event){
			 $(".edit-button").attr("disabled","disabled");
		    event.preventDefault(); //prevent default action
		    var post_url =$("#editUserForm").attr("action"); //get form action url
		    var request_method = $("#editUserForm").attr("method"); //get form GET/POST method
		    var form_data = $("#editUserForm").serialize(); //Encode form elements for submission
		    $.ajax({
			    url: 'editEmployee',
			    type: request_method,
			    data: form_data,
			    success: function( data, textStatus, jQxhr )
			    {
					$("#editDetail").modal('toggle');
					$(".msgbody").empty();
				   	$(".msgbody").append("<p class='alert alert-info text-center'>Data Updated Successfully.</p>");
				    $("#successModal").modal("show");
			    	listUser();     
			    },
			    error: function( jqXhr, textStatus, errorThrown ){
			        console.log( errorThrown );
			    }
			});
		});
  });
  function confirmDelete(id)
  {
	   bootbox.confirm("Are you sure want to delete?", function(result) 
				{
					if(result)
						{
						 $.ajax({
						        url: 'deleteEmployee',
						        type: 'GET',
						        data: {"id": id},
						        success: function(data,textStatus, jQxhr)
						        	{
										listUser();
							        },
							        error: function(data,textStatus, jQxhr)
						        	{
										listUser();
							        }
						    });
						} 
			    });
  }
  function editDetails(id)
  {
			$.ajax({
			url: 'editEmployee',
			type: 'GET',
		    data: {"id": id},
			success: function(data,textStatus, jQxhr)
			{
			$("#editId").val(data.id);
			$("#editName").val(data.name);
			$("#editEmail").val(data.email);
			$("#editAddress").val(data.address);
			$("#editTelephone").val(data.telephone);
			$("#editDetail").modal("toggle");
			},
			/* error: function(data,textStatus, jQxhr)
			{
				listUser();
			} */
			});
  }
  function listUser()
  {
      $('#countrytable tr:not(:first)').remove();
	  $.get('listUsers',function(json) {
           var tr;
           for (var i = 0; i < json.length; i++) {
                var rows = $("<tr><td>" + json[i].id + "</td><td>" + json[i].name + "</td><td>" + json[i].email + "</td><td>" + json[i].address + "</td><td>" + json[i].telephone + "</td><td><button class='btn btn-danger btn-xs btn-delete' onclick='confirmDelete("+json[i].id+");' value="+json[i].id+" type='submit'><i class='fa fa-trash' aria-hidden='true'></i> Delete</button>&nbsp;&nbsp;<button class='btn btn-danger btn-xs btn-delete' onclick='editDetails("+json[i].id+");' type='submit'><i class='fa fa-pencil-square-o' aria-hidden='true'></i> Edit</button></td></tr>");
        	   rows.hide();
        	    $('#countrytable tr:last-child').after(rows);
        	    rows.fadeIn("8000").addClass('normal');
           }
       });
  }
</script>  
</body>
</html>