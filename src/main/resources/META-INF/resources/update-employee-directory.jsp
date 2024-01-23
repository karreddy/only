<%@ include file="/init.jsp" %>

<%@page import="com.liferay.portal.kernel.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<portlet:actionURL var="UpdateEmployeeDirectory" name="/UpdateEmployeeDirectoryUrl"/>
<body>
<% 

JSONObject jsonObject= (JSONObject)request.getAttribute("employeeDetails");
%>
	
	
	
	
	
	<div class="">
    <div class="row">
   <div class="col-md-4 offset-4">
<div class="plng-accordion-cards">
  <div class="card">
     <div class="card-header d-flex justify-content-between">
            <h6 class="mb-0">Edit Your Details</h6>
            <div>
                <a class="text-decoration-none back-btn" href="/employee-directory">
                    <i class="bi bi-arrow-left-circle-fill text-white"></i> Back
                </a>
            </div>
        </div>
  
  
             <div class="card-body">
             
             
             <form  action="${UpdateEmployeeDirectory}&empId=<%= jsonObject.getString("empId")%>" method="post"  enctype="multipart/form-data"  >
    
    <div class="row">
      <div class="col-md-12 mb-3">
        <label for="employeeNo" class="form-label">Employee No</label>
        <input type="text" class="form-control" id="employeeNo" value=<%= jsonObject.getString("empId")%> disabled>
      </div>
      <div class="col-md-12 mb-3">
        <label for="employeeName" class="form-label">Employee Name</label>
        <input type="text" class="form-control" id="employeeName" value=<%= jsonObject.getString("empName")%> disabled>
      </div>
      </div>
      
      
    <div class="row">
      <div class="col-md-12 mb-3">
        <label for="mobileNo" class="form-label">Mobile No</label>
        <input type="text" class="form-control" id="mobileNo" name="mobileNo">
        <span id="mobNo_error" style="color: red;"></span>
      </div>
       <div class="col-md-12 mb-3">
        <label for="alternateNo" class="form-label">Alternate No</label>
        <input type="text" class="form-control" id="alternateNo" name="alternateNo">
         <span id="altrNo_error" style="color: red;"></span>
      </div>
      </div>
      
     <div class="row">
      <div class="col-md-12 mb-3">
        <label for="residenceNo" class="form-label">Residence No</label>
        <input type="text" class="form-control" id="residenceNo" name="residenceNo">
        <span id="resdNo_error" style="color: red;"></span>
      </div>
       <div class="col-md-12 mb-3">
        <label for="faxNo" class="form-label">Fax No</label>
        <input type="text" class="form-control" id="faxNo" name="faxNo">
        
      </div>
      </div>
      <button type="submit" class="plng-btn mt-3"><i class="bi bi-send-fill mr-3"></i>Update</button>
    </form>
                
            
			 </div>
  
  </div>

</div>
</div>
	
	<script>
	
	
    const mobileNo = document.getElementById('mobileNo');
    const mobNo_error = document.getElementById('mobNo_error');
    const updateButton = document.querySelector('button[type="submit"]');

 
    mobileNo.addEventListener('input', function() {
        const inputValue = this.value;
        if (!/^\d{10}$/.test(inputValue)) {
        	mobNo_error.textContent = "Please enter a valid 10-digit mobile number.";
        	 updateButton.setAttribute('disabled', 'true');
        } else {
        	mobNo_error.textContent = "";
        	 updateButton.removeAttribute('disabled');
        }
    });
    
    
    const alternateNo = document.getElementById('alternateNo');
    const altrNo_error = document.getElementById('altrNo_error');
    
    
    alternateNo.addEventListener('input', function() {
        const inputValue = this.value;
        if (!/^\d{10}$/.test(inputValue)) {
        	altrNo_error.textContent = "Please enter a valid 10-digit Number.";
        	 updateButton.setAttribute('disabled', 'true');
        } else {
        	altrNo_error.textContent = "";
        	 updateButton.removeAttribute('disabled');
        }
    });
    
    const residenceNo = document.getElementById('residenceNo');
    const resdNo_error = document.getElementById('resdNo_error');
    
    
    residenceNo.addEventListener('input', function() {
        const inputValue = this.value;
        if (!/^\d{10}$/.test(inputValue)) {
        	resdNo_error.textContent = "Please enter a valid 10-digit Number.";
        	 updateButton.setAttribute('disabled', 'true');
        } else {
        	resdNo_error.textContent = "";
        	 updateButton.removeAttribute('disabled');
        }
    });
    

</script>