package com.pll.employee.directory.mvc;

import com.liferay.document.library.kernel.model.DLFileEntry;
import com.liferay.document.library.kernel.service.DLFileEntryLocalServiceUtil;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.json.JSONFactoryUtil;
import com.liferay.portal.kernel.json.JSONObject;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.model.User;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCRenderCommand;
import com.liferay.portal.kernel.service.UserLocalServiceUtil;
import com.liferay.portal.kernel.util.ParamUtil;
import com.pll.employee.directory.constants.PllEmployeeDirectoryPortletKeys;
import com.pll.employee.directory.model.EmployeeDirectory;
import com.pll.employee.directory.service.EmployeeDirectoryLocalServiceUtil;

import javax.portlet.PortletException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.osgi.service.component.annotations.Component;



@Component(immediate = true, property = { "javax.portlet.name=" + PllEmployeeDirectoryPortletKeys.PLLEMPLOYEEDIRECTORY,
		"mvc.command.name=renderEmployeeDirectoryURL"
				}, service = MVCRenderCommand.class)
public class EmployeeDirectoryViewDetailsRender implements MVCRenderCommand {
	private static final Log _log = LogFactoryUtil.getLog(EmployeeDirectoryViewDetailsRender.class);
	@Override
	public String render(RenderRequest renderRequest, RenderResponse renderResponse) throws PortletException {
		
		
		
		long employeeId = ParamUtil.getLong(renderRequest, "empId");
		
		_log.info("Employee Id="+employeeId);
		
		EmployeeDirectory fetchEmployeeDirectory = EmployeeDirectoryLocalServiceUtil.fetchEmployeeDirectory(employeeId);
		
		User fetchUser = UserLocalServiceUtil.fetchUser(fetchEmployeeDirectory.getUserId());
		
		
		JSONObject employeeDetails = JSONFactoryUtil.createJSONObject();
		
		employeeDetails.put("employeeID", fetchEmployeeDirectory.getEmployeeId());
		employeeDetails.put("employeeName", fetchEmployeeDirectory.getEmployeeName());
		employeeDetails.put("designation", fetchEmployeeDirectory.getDesignation());
		employeeDetails.put("extnNo", fetchEmployeeDirectory.getExtentionNumber());
		employeeDetails.put("mobileNo", fetchEmployeeDirectory.getMobileNumber());
		employeeDetails.put("altrMobileNo", fetchEmployeeDirectory.getAlternateNumber());
		employeeDetails.put("directNo", fetchEmployeeDirectory.getDirectNumber());
		employeeDetails.put("residenceNo", fetchEmployeeDirectory.getResidenceNumber());
		employeeDetails.put("faxNo", fetchEmployeeDirectory.getFaxNumber());
		employeeDetails.put("bloodGroup", fetchEmployeeDirectory.getBloodGroup());
		employeeDetails.put("location", fetchEmployeeDirectory.getLocation());
		employeeDetails.put("location", fetchEmployeeDirectory.getLocation());
		employeeDetails.put("emailAddress", fetchUser.getEmailAddress());
			DLFileEntry image;
		String	imageUrl ="";
		try {
			image = DLFileEntryLocalServiceUtil.getFileEntry(fetchEmployeeDirectory.getFileEntryId());
			
			imageUrl	= "/documents/" + image.getGroupId() + "/" + image.getFolderId() + "/" + image.getTitle() + "/"
						+ image.getUuid();
				
		} catch (PortalException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		employeeDetails.put("imageUrl", imageUrl);
		_log.info(employeeDetails);
		
		 renderRequest.setAttribute("employeeDetails", employeeDetails);
		return "/view-employee-details.jsp";
	}

}
