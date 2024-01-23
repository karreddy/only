package com.pll.employee.directory.mvc;

import com.liferay.portal.kernel.json.JSONArray;
import com.liferay.portal.kernel.json.JSONFactoryUtil;
import com.liferay.portal.kernel.json.JSONObject;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.portlet.bridges.mvc.BaseMVCResourceCommand;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCResourceCommand;
import com.liferay.portal.kernel.util.Validator;
import com.pll.employee.directory.constants.PllEmployeeDirectoryPortletKeys;
import com.pll.employee.directory.model.EmployeeDirectory;
import com.pll.employee.directory.service.EmployeeDirectoryLocalServiceUtil;

import java.io.PrintWriter;
import java.util.List;

import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.osgi.service.component.annotations.Component;


@Component(
		immediate = true,
		property = {
			"javax.portlet.name=" +  PllEmployeeDirectoryPortletKeys.PLLEMPLOYEEDIRECTORY,
			"mvc.command.name=fetchEmpDirectoryMvcResource" 
		
		},
		service = MVCResourceCommand.class
	)
public class FetchEmpDirectoryMVCResource extends BaseMVCResourceCommand  {
	private static final Log _log = LogFactoryUtil.getLog(FetchEmpDirectoryMVCResource.class);
	@Override
	protected void doServeResource(ResourceRequest resourceRequest, ResourceResponse resourceResponse)
			throws Exception {
		_log.info("calling FetchEmployee directory MVCResource :::::::::::::");
		
		
		PrintWriter pw = resourceResponse.getWriter();
		
		JSONArray jsonArray=JSONFactoryUtil.createJSONArray();
		List<EmployeeDirectory> EmployeeDirectoryList =EmployeeDirectoryLocalServiceUtil.getEmployeeDirectories(-1, -1);

		if(Validator.isNotNull(EmployeeDirectoryList) && EmployeeDirectoryList.size()>0) {
			for(EmployeeDirectory empdetails:EmployeeDirectoryList) {
				JSONObject jsonObject=JSONFactoryUtil.createJSONObject();
				jsonObject.put("empId", empdetails.getEmployeeId());
				jsonObject.put("empName", empdetails.getEmployeeName());
				jsonObject.put("designation", empdetails.getDesignation());
				jsonObject.put("extensionNo", empdetails.getExtentionNumber());
				jsonObject.put("mobNo", empdetails.getMobileNumber());
				jsonObject.put("altrNo", empdetails.getAlternateNumber());
				jsonObject.put("faxNo", empdetails.getFaxNumber());
				jsonObject.put("location",empdetails.getLocation() );
				jsonObject.put("bldGroup", empdetails.getBloodGroup());
				
			
				jsonArray.put(jsonObject);
		
			}
		}	
		
		
		pw.print(jsonArray);
		pw.flush();
		pw.close();
		
		
	}
	

	

}
