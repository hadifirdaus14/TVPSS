<!DOCTYPE html>
<html>
<head>
    <title>View Report</title>
</head>
<body>
    <h1>View Report Details</h1>
    <table border="1">
        <tr>
            <td><strong>Report ID:</strong></td>
            <td>${report.id}</td>
        </tr>
        <tr>
            <td><strong>Status:</strong></td>
            <td>${report.status}</td>
        </tr>
        <tr>
            <td><strong>Content:</strong></td>
            <td>${report.content}</td>
        </tr>
    </table>

    <a href="/admin/manageReports">Back to Manage Reports</a>
</body>
</html>
