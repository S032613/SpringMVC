<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Page</title>


<link rel="stylesheet"
	href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css" />
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<style>

.navbar {
	overflow: hidden;
	background-color: #333;
	font-family: Arial, Helvetica, sans-serif;
	text-align: right;
}

.navbar a {
	float: left;
	font-size: 22px;
	font-weight: bold;
	color: white;
	text-align: right;
	padding: 15px 18px;
	text-decoration: none;
}
.button{
display: inline-block;
	padding: 10px 20px;
	font-size: 17px;
	font-weight: bold;
	text-align: right;
	border-radius: 5px;
   cursor: pointer;
}

.container{
    background-color:#ADD8E6 ;
  padding: 15px 18px;
}

</style>
</head>
<body style = "background-image:url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBm1LZW8clZL7-bqiUAs9qO3dFF8aMZmmT-w&usqp=CAU');">

	<nav class="navbar navbar-expand-lg navbar-light bg-primary">
   <!-- Added a container for proper alignment -->
			<div class="navbar-expand-lg navbar-light bg-primary">
				<a class="navbar-brand" href="#">Registration Page</a>
			</div>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">


				<!-- Button trigger modal -->
				<button type="button" class="btn btn-success" data-toggle="modal"
					data-target="#registration_modal">Sign In</button>

				<button type="button" class="btn btn-primary" data-toggle="modal" data-target='#signout_modal'>
				Sign Out</button>
			</div>

		
	</nav>

	<div class="container">
		<table id="registration_table"
			class="table table-striped  table-primary table-bordered">
			<thead>
				<tr>
					<th>Name</th>
					<th>Email</th>
					<th>Phone</th>
					<th>City</th>
					<th>Action</th>
					
				</tr>


			</thead>
		</table>

	</div>






	<div class="modal fade" id="registration_modal" tabindex="-1"
		role="dialog" aria-labelledby="registerModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">

					<h4 class="modal-title" id="exampleModalLabel">User Login</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container-fluid" id="addlogbooks">

						<form id="addlogbook" name="newuserform" onsubmit="return false;">
							<input type="hidden" id="filter" value="">
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">

										<label for="log_title" class="text-dark">Name</label> <input
											type="text" required name="name" id="name"
											class="form-control">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="log_title" class="text-dark">Email</label> <input
											type="email" required name="email" id="email"
											class="form-control">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="log_title" class="text-dark">Phone</label> <input
											type="tel" required name="phone" id="phone"
											class="form-control">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="log_title" class="text-dark">City</label> <input
											type="text" required name="city" id="city"
											class="form-control">
									</div>
								</div>
							</div>
						</form>
					</div>



				</div>
			</div>

			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
				<button type="submit" class="btn btn-primary"
					onclick="userpage1.upsertData();">Register</button>
			</div>
		</div>
	</div>




	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"
		integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<!-- Latest compiled JavaScript -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

	<script
		src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"
		integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA=="-->
                  crossorigin="anonymous" referrerpolicy="no-referrer"></script>

	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>



	<script>
	var tbl=null;
		var userpage1 = {
				 initTable : function() {
                     tbl = $('#registration_table')
                                     .DataTable(
                                                     {
                                           
                                                               "ajax" : {
                                                                     "url" : "showdetails",
                                                                     
                                                                     beforeSend: function(){
                                                                         $("#loading").show();    
                                                                     },
                                                                     complete: function(data){
                                                                         $("#loading").hide();
                                                                         
                                                                     },
                                                                     dataSrc: ''
                                                                     },
                                                                     
                                                                     
                                                             columns: [
                                                                             
                                                                                           {
                                                                                           data: "name"
                                                                                               },
                                                                                               {
                                                                                           data: "email"
                                                                                           },
                                                                                           {
                                                                                             data: "phone"
                                                                                           },
                                                                                           {
                                                                                             data: "city"
                                                                                           },
                                                                                           
                                                                               
                                                                                           {

                                                                                                   data: null,
                                                                                                   className: "center",
                                                                                                   "fnCreatedCell": function(
                                                                                                           nTd, sData,
                                                                                                           oData,
                                                                                                           iRow, iCol) {
                                                                                                           $(nTd)
                                                                                                                   .html(
                                                                                                                               "<a title='update message' style='margin-right:18px' href='javascript:void(0);' onClick='userpage1.showupdateuser(\""
                                                                                                                           + oData.id
                                                                                                                           + "\")' i class='fa fa-edit tblicon'></a>    <a title='Delete message' style='color: #CE2A0F;'  href='javascript:void(0);' onClick='userpage1.deleteuser(\""
                              + oData.id
                              + "\",\""

                              + "\")' i class='fa fa-trash tblicon'> </a>");

                                                                                                   }
                                                                                           }]

                                                                               
                                                     });
             },
             
             
				
			upsertData : function() {
				var username = $("#name").val();
				var useremail = $("#email").val();
				var userphone = $("#phone").val();
				var usercity = $("#city").val();

				var param = {
					"name" : username,
					"email" : useremail,
					"phone" : userphone,
					"city" : usercity,
				}

				$.ajax({
					headers : {
						'Accept' : 'application/json',
						'Content-Type' : 'application/json'
					},
					data : JSON.stringify(param),
					url : 'insertexceldata',
					method : 'POST',
					// 	            beforeSend: function() {
					// 	                $("#loading").show();

					statusCode : {
						200 : function(data) {
							Swal.fire(
                                    'Nailed it!',
                                    'You clicked the button!',
                                    'successfully done'
                                 );
                                 $('#registration_modal').modal('hide');
                     },

						201 : function(data) {
							$.notify({
								message : data.responseText
							}, {
								type : 'success'
							});
						},
						500 : function(data) {
							$.notify({
								message : data.responseJSON.message
							}, {
								type : 'danger'
							});
						}
					}

				});
			}
			}
			
		
             
		$(document).ready(function() {
			
			 userpage1.initTable();
			
		});
 </script>



	<div class="modal fade" id="update_modal" tabindex="-1"
		role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">

					<h4 class="modal-title" id="userModalLabel">Edit Page</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container-fluid" id="updatelogbooks">

						<form id="updatelogbook" name="newuserform" onsubmit="return false;">
							<input type="hidden" id="filter" value="">
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">

										<label for="log_title" class="text-dark">Name</label> <input
											type="text" required name="name" id="editname"
											class="form-control">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="log_title" class="text-dark">Email</label> <input
											type="email" required name="email" id="editemail"
											class="form-control">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="log_title" class="text-dark">Phone</label> <input
											type="tel" required name="phone" id="editphone"
											class="form-control">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="log_title" class="text-dark">City</label> <input
											type="text" required name="editcity" id="city"
											class="form-control">
									</div>
								</div>
							</div>
						</form>
					</div>



				</div>
			</div>

			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
				<button type="submit" class="btn btn-alert"
					onclick="userpage1.upsertData();">Update</button>
			</div>
		</div>
	</div>
<script type="text/javascript">

$(document).on('submit', '$updateUserModal', function (event){
event.preventDefault();
})

		updateData : function() {
				var userrename = $("#updatename").val();
				var userreemail = $("#updateemai").val();
				var userrephone = $("#updatephone").val();
				var usecity = $("#updatecity").val();

				var param = {
					"updatename" : userupdatename,
					"updateemai" : userupdateemail,
					"updatephone" : userupdatephone,
					"updatecity" : userupdatecity
					,
				}	


 </script>

		 </body>
		 </html>
		
		 
 





