package com.pll.employee.directory.mvc;

import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.portlet.bridges.mvc.BaseMVCActionCommand;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCActionCommand;
import com.liferay.portal.kernel.util.ParamUtil;
import com.pll.employee.directory.constants.PllEmployeeDirectoryPortletKeys;
import com.pll.employee.directory.model.EmployeeDirectory;
import com.pll.employee.directory.service.EmployeeDirectoryLocalServiceUtil;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;

import org.osgi.service.component.annotations.Component;



@Component(
		immediate = true,
		property = {
			
				"javax.portlet.name=" + PllEmployeeDirectoryPortletKeys.PLLEMPLOYEEDIRECTORY,
			"mvc.command.name=/UpdateEmployeeDirectoryUrl",
			
		},
		service = MVCActionCommand.class
)


public class EmployeeDirectoryUpdateAction extends BaseMVCActionCommand {
	Log logger=LogFactoryUtil.getLog(EmployeeDirectoryUpdateAction.class);
	
	@Override
	protected void doProcessAction(ActionRequest actionRequest, ActionResponse actionResponse) throws Exception {
		// TODO Auto-generated method stub
		logger.info("Entered to EmployeeDirectoryUpdateAction>>>>>>>>>");
		
		long employeeId=ParamUtil.getLong(actionRequest, "empId");
		String mobileNo = ParamUtil.getString(actionRequest, "mobileNo");
		String alternateNo = ParamUtil.getString(actionRequest, "alternateNo");
		String residenceNo = ParamUtil.getString(actionRequest, "residenceNo");

		String faxNo=ParamUtil.getString(actionRequest, "faxNo");
		
		logger.info("emp id ==="+employeeId);
				
				
		EmployeeDirectory fetchEmployeeDirectory = EmployeeDirectoryLocalServiceUtil.fetchEmployeeDirectory(employeeId);
		fetchEmployeeDirectory.setMobileNumber(mobileNo);
		fetchEmployeeDirectory.setAlternateNumber(alternateNo);
		fetchEmployeeDirectory.setResidenceNumber(residenceNo);
		fetchEmployeeDirectory.setFaxNumber(faxNo);
		EmployeeDirectoryLocalServiceUtil.updateEmployeeDirectory(fetchEmployeeDirectory);
		
		logger.info("mobileNo"+mobileNo+"alternateNo"+alternateNo+"residenceNo"+residenceNo+"faxNo"+faxNo);
	}

}
