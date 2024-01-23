<%@page import="java.util.List"%>
<%@page import="com.pll.employee.directory.model.EmployeeDirectory"%>
<%@page import="com.pll.employee.directory.service.EmployeeDirectoryLocalServiceUtil"%>
<%@ include file="/init.jsp" %>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
 
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">

<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>

<portlet:resourceURL id="fetchEmpDirectoryMvcResource" var="fetchEmpDirectoryURL"></portlet:resourceURL>
   <portlet:renderURL var="EmployeeDirectoryURL">
	<portlet:param name="mvcRenderCommandName" value="renderEmployeeDirectoryURL"/>
</portlet:renderURL>
 <portlet:renderURL var="EmployeeDirectoryRenderURL">
	<portlet:param name="mvcRenderCommandName" value="EmployeeDirectoryRenderrURL"/>
</portlet:renderURL>


<div class="plng-accordion-cards">
    <div class="card">
        <div class="card-header">
            <h6 class="mb-0">
                <i class="bi bi-journal-text mr-2"></i>Employee Directory
            </h6>
        </div>
        <div class="card-body">
        <div class="row my-auto">
        <div class="col-md-3">
         <select class="form-control" id="locationFilter">
        <option value="">Filter by Location</option>
        <option value="Delhi">Delhi</option>
        <option value="Dahej">Dahej</option>
        <option value="Kochi">Kochi</option>
      </select>
        </div>
         <div class="col-md-3">
        <input type="text" class="form-control" id="bloodGroupFilter" placeholder="Filter by Blood Group">
        </div>
         <div class="col-md-3 my-auto">
        <a href="${EmployeeDirectoryRenderURL}" class="plng-btn" >
						<i class="bi bi-pencil-square  mr-3"></i>Update Your Details</a>
        </div>
        </div>
			<div class="row mb-4">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 table-responsive p-3">
					<table id="employee-directory-list" class="table" aria-describedby="table-info"></table>
				</div>
			 </div>   
        </div>
    </div>
</div>

<script>
$(document).ready(function() {

	$.ajax({
		url: '${fetchEmpDirectoryURL}',
		type:'get',
		dataType:'json',
		success: function(data){
			console.log("data : ",data);
			requestEmployeeDirectory(data, "#employee-directory-list");
		}
	});
	
	
    $('#locationFilter').on('change', function() {
        var locationFilter = $(this).val();
        console.log("locationFilter :",locationFilter);
        var table = $('#employee-directory-list').DataTable();
                if (table) {
                table.column(7).search(locationFilter).draw(); 
                }
    });

    $('#bloodGroupFilter').on('input', function() {
        var bloodGroupFilter = $(this).val();
        console.log("bloodGroupFilter :",bloodGroupFilter);
        var table = $('#employee-directory-list').DataTable();
        if (table) {
        table.column(8).search(bloodGroupFilter).draw();
        }
    });


	
}); 

function requestEmployeeDirectory(data, id){
	var table = $(id).DataTable({
		"scrollX": true,
        "paging" : true,
		  "searching" : true,
		  "destroy" : true,
		  "dom":'lBfrtio',
		  "hover": true,
		  language: {
			  "search": "Search",
		    },
	    
		    "aaData": data,
		  	"aoColumns" :
		      [
		    	  {
					    "mData" : null,
					    "sTitle": '<span></i>Employee Id</span>',
					    "defaultContent": "",					    
					    "render" : function(data, type, meta){
					    	var empId=meta.empId;
					    	console.log("empId:::::::::::"+empId)
					    	if(empId!=undefined && empId!=null && empId!=''){
					    		return '<span>'+empId+'</span>';
					    	}else{
					    		return '<span>N/A</span>';
					    	}
					    }
					},
					{
					    "mData" : null,
					    "sTitle": '<span></i>Employee Name </span>',
					    "defaultContent": "",					    
					    "render" : function(data, type, meta){
					    	var empName=meta.empName;
					    	console.log("empName:::::::::::"+empName)
					    	if(empName!=undefined && empName!=null && empName!=''){
					    		return '<span>'+empName+'</span>';
					    	}else{
					    		return '<span>N/A</span>';
					    	}
					    }
					},
					{
					    "mData" : null,
					    "sTitle": '<span></i>Designation </span>',
					    "defaultContent": "",					    
					    "render" : function(data, type, meta){
					    	var designation=meta.designation;
					    	console.log("designation:::::::::::"+designation)
					    	if(designation!=undefined && designation!=null && designation!=''){
					    		return '<span>'+designation+'</span>';
					    	}else{
					    		return '<span>N/A</span>';
					    	}
					    }
					},
				{
					    "mData" : null,
					    "sTitle": '<span></i>Extension Number</span>',
					    "defaultContent": "",					    
					    "render" : function(data, type, meta){
					    	var extensionNo=meta.extensionNo;
					    	console.log("extensionNo:::::::::::"+extensionNo)
					    	if(extensionNo!=undefined && extensionNo!=null && extensionNo!=''){
					    		return '<span>'+extensionNo+'</span>';
					    	}else{
					    		return '<span>N/A</span>';
					    	}
					    }
					},
				

					{
					    "mData" : null,
					    "sTitle": '<span>Mobile Number</span>',
					    "defaultContent": "",					    
					    "render" : function(data, type, meta){
					    	var mobNo=meta.mobNo;
					    	if(mobNo!=undefined && mobNo!=null && mobNo!=''){
					    		return '<span>'+mobNo+'</span>';
					    	}else{
					    		return '<span>N/A</span>';
					    	}
					    }
					},
						{
					    "mData" : null,
					    "sTitle": '<span>Alternate Number</span>',
					    "defaultContent": "",					    
					    "render" : function(data, type, meta){
					    	var altrNo=meta.altrNo;
					    	if(altrNo!=undefined && altrNo!=null && altrNo!=''){
					    		return '<span>'+altrNo+'</span>';
					    	}else{
					    		return '<span>N/A</span>';
					    	}
					    }
					},
						{
					    "mData" : null,
					    "sTitle": '<span>Fax Number</span>',
					    "defaultContent": "",					    
					    "render" : function(data, type, meta){
					    	var faxNo=meta.faxNo;
					    	if(faxNo!=undefined && faxNo!=null && faxNo!=''){
					    		return '<span>'+faxNo+'</span>';
					    	}else{
					    		return '<span>N/A</span>';
					    	}
					    }
					},
						{
					    "mData" : null,
					    "sTitle": '<span>Location</span>',
					    "defaultContent": "",					    
					    "render" : function(data, type, meta){
					    	var location=meta.location;
					    	if(location!=undefined && location!=null && location!=''){
					    		return '<span>'+location+'</span>';
					    	}else{
					    		return '<span>N/A</span>';
					    	}
					    }
					},
						{
					    "mData" : null,
					    "sTitle": '<span>Blood Group</span>',
					    "defaultContent": "",					    
					    "render" : function(data, type, meta){
					    	var bldGroup=meta.bldGroup;
					    	if(bldGroup!=undefined && bldGroup!=null && bldGroup!=''){
					    		return '<span>'+bldGroup+'</span>';
					    	}else{
					    		return '<span>N/A</span>';
					    	}
					    }
					},
					{
					    "mData" : null,
					    "sTitle": '<span>View</span>',
					    "defaultContent": "",					    
					    "render" : function(data, type, meta){
					        var empId = meta.empId;
					        if(empId != undefined && empId != null && empId != ''){
					            var viewUrl = '${EmployeeDirectoryURL}&empId=' + empId;
					            return '<a href="' + viewUrl + '" class="plng-btn"><i class="bi bi-eye-fill"></i></a>';
					        } else {
					            return '<span>N/A</span>';
					        }
					    }
					},
	        ],
	        "fnDrawCallback": function(oSettings) {
	        
	        	
	        },
	        "fnRowCallback": function(row, data, iDisplayIndex, iDisplayIndexFull) {
	        	
	        	
	        }
	   });
}

</script>
