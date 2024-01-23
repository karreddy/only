package com.pll.employee.directory.mvc;

import com.liferay.portal.kernel.json.JSONFactoryUtil;
import com.liferay.portal.kernel.json.JSONObject;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.model.User;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCRenderCommand;
import com.liferay.portal.kernel.theme.ThemeDisplay;
import com.liferay.portal.kernel.util.WebKeys;
import com.pll.employee.directory.constants.PllEmployeeDirectoryPortletKeys;
import com.pll.employee.directory.model.EmployeeDirectory;
import com.pll.employee.directory.service.EmployeeDirectoryLocalServiceUtil;

import java.util.List;

import javax.portlet.PortletException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.osgi.service.component.annotations.Component;



@Component(immediate = true, property = { "javax.portlet.name=" + PllEmployeeDirectoryPortletKeys.PLLEMPLOYEEDIRECTORY,
		"mvc.command.name=EmployeeDirectoryRenderrURL"
				}, service = MVCRenderCommand.class)

public class EmployeeDirectoryUpdateRender implements MVCRenderCommand {
	private static final Log _log = LogFactoryUtil.getLog(EmployeeDirectoryUpdateRender.class);
	@Override
	public String render(RenderRequest renderRequest, RenderResponse renderResponse) throws PortletException {
		
		_log.info("Update render  >>>>>>>>>>");
		
		  ThemeDisplay themeDisplay = (ThemeDisplay) renderRequest.getAttribute(WebKeys.THEME_DISPLAY); 
		   User user=themeDisplay.getUser();
		  long userId=user.getUserId();
		    JSONObject employeeDetails = JSONFactoryUtil.createJSONObject();
		  List<EmployeeDirectory> employeeslist=  EmployeeDirectoryLocalServiceUtil.getEmployeeDirectories(-1, -1);
		  for(EmployeeDirectory empDetails:employeeslist){
			  if(empDetails.getUserId()==userId){
				  
				  employeeDetails.put("empId",empDetails.getEmployeeId());
				  employeeDetails.put("empName",empDetails.getEmployeeName());
			  }
		  }
        _log.info(employeeDetails);
		  renderRequest.setAttribute("employeeDetails", employeeDetails);
		return "/update-employee-directory.jsp";
	}

}
