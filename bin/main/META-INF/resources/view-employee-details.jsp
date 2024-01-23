<%@page import="javax.portlet.RenderRequest"%>
<%@page import="com.liferay.portal.kernel.json.JSONObject"%>
<%@ include file="/init.jsp" %>

 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
 <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<% 

JSONObject jsonObject= (JSONObject)request.getAttribute("employeeDetails");
%>


<div class="">
    <div class="row">
   <div class="col-md-6 offset-3">
<div class="plng-accordion-cards">
  <div class="card">
     <div class="card-header d-flex justify-content-between">
            <h6 class="mb-0"><i class="bi bi-person-fill mr-1"></i>Employee Details</h6>
            <div>
                <a class="text-decoration-none back-btn" href="/employee-directory">
                    <i class="bi bi-arrow-left-circle-fill text-white"></i> Back
                </a>
            </div>
        </div>
  
  
             <div class="card-body">
             
                    <div class="row">

        <div class="col-md-12 text-center">
                        	<div class="" style="display: flex;justify-content: center;align-items: center;">
							    <img src="<%= jsonObject.getString("imageUrl")%>" class="img-thumbnail" alt="..." style="max-width: 200px; height: auto;">
							</div>
                            <h5 class="mt-2 text-center" style="color: #393184"><strong><%= jsonObject.getString("employeeName")%></strong></h5>
                        </div>
                        
                    <div class="row p-5">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-6">
                                      <label>Employee Id</label>
                                    <p><%= jsonObject.getString("employeeID")%></p>
                                </div>
                                <div class="col-md-6">
                                   <label>Extention Number</label>
                                    <p><%= jsonObject.getString("extnNo")%></p>
                                </div>
                            </div>
                            <div class="row">
                                
                                <div class="col-md-6">
                                    <label>Designation</label>
									<p><%= jsonObject.getString("designation")%></p>
                                </div>
                                 <div class="col-md-6">
                                    <label>Mobile Number</label>
									<p><%= jsonObject.getString("mobileNo")%></p>
                                </div>
                                
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Email Address</label>
                                    <p><%= jsonObject.getString("emailAddress")%></p>
                                </div>
                                <div class="col-md-6">
                                    <label>Fax</label>
                                    <p><%= jsonObject.getString("faxNo")%></p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Blood Group</label>
                                    <p><%= jsonObject.getString("bloodGroup")%></p>
                                </div>
                                   <div class="col-md-6">
                                    <label>Location</label>
                                    <p><%= jsonObject.getString("location")%></p>
                                </div>
                            </div>
                        </div>
                   </div>
			 
			 </div>
  
  </div>

</div>
</div></div></div></div>
















