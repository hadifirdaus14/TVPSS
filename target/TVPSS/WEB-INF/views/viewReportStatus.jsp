<!DOCTYPE html>
<html>
<head>
    <title>Report Status Details</title>
</head>
<body>
    <h1>Report Status Details</h1>

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

    <a href="/schoolPic/reportStatus">Back to Report Status</a>
</body>
</html>
