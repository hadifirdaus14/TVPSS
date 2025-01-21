<!DOCTYPE html>
<html>
<head>
    <title>Report Status</title>
</head>
<body>
    <h1>Your Reports Status</h1>

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
                        <a href="/schoolPic/viewReportStatus/${report.id}">View Details</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <a href="/schoolPic/submitReport">Submit a New Report</a>
</body>
</html>
