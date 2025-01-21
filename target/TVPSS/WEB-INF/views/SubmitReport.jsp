<!DOCTYPE html>
<html>
<head>
    <title>Submit Report</title>
</head>
<body>
    <h1>Submit a New Report</h1>

    <form action="/schoolPic/submitReportAction" method="POST">
        <label for="content">Report Content:</label><br>
        <textarea name="content" id="content" rows="5" cols="30"></textarea><br><br>

        <label for="status">Status:</label><br>
        <select name="status" id="status">
            <option value="pending">Pending</option>
            <option value="accepted">Accepted</option>
            <option value="rejected">Rejected</option>
        </select><br><br>

        <input type="submit" value="Submit Report">
    </form>

    <a href="/schoolPic/reportStatus">Back to Report Status</a>
</body>
</html>
