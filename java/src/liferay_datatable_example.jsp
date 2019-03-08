<%@page import="com.liferay.portal.model.User"%>
<%@page import="java.util.List"%>
<%@page import="com.liferay.portal.service.UserLocalServiceUtil"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.16/js/dataTables.jqueryui.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/dataTables.jqueryui.min.css" />

<%
    List<User> userList = UserLocalServiceUtil.getUsers(0, UserLocalServiceUtil.getUsersCount());
    request.setAttribute("userList", userList);
%>

<body>
<table id="example" class="table table-bordered table-striped" style="width:100%">
    <thead>
    <tr>
        <th>User ID</th>
        <th>Company ID</th>
        <th>Email Address</th>
        <th>First Name</th>
        <th>Last Name</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${userList}" var="user">
        <tr>
            <td>${user.userId}</td>
            <td>${user.companyId}</td>
            <td>${user.emailAddress}</td>
            <td>${user.firstName}</td>
            <td>${user.lastName}</td>
        </tr>
    </c:forEach>

    </tbody>
</table>

<script>
	$(function(){
		$("#example").dataTable({
			"iDisplayLength":25, // default page size
			"aLengthMenu": [
				[25, 100, 200, -1],   // per page record options
				[25, 100, 200, "All"]
			],
			"bLengthChange": true, //Customizable page size
			"bSort": false, // for Soring
			"bFilter": true, //search box
			"aaSorting": [],
			"aoColumns": [{// Columns width
				"sWidth": "15%"
			}, {
				"sWidth": "15%"
			}, {
				"sWidth": "30%"
			}, {
				"sWidth": "20%"
			},{
				"sWidth": "20%"
			}],
			"bAutoWidth": false,
			"oLanguage": {
				"sSearch": "Search: ",
				"sEmptyTable": "<div class='portlet-msg-alert'>No User Found</div>" // default message for no data
			},
			"sPaginationType": "full_numbers"
		});
	})
</script>
</body>
