<!DOCTYPE html>
<html>
<head>
    <title>Manage Reports</title>
</head>
<body>
    <h1>Manage Reports</h1>

    <table border="1">
        <thead>
            <tr>
                <th>Report ID</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="report" items="${reports}">
                <tr>
                    <td>${report.id}</td>
                    <td>${report.status}</td>
                    <td>
                        <a href="/admin/viewReport/${report.id}">View</a> | 
                        <a href="/admin/updateReportStatus/${report.id}/accepted">Accept</a> | 
                        <a href="/admin/updateReportStatus/${report.id}/rejected">Reject</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
