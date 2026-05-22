<!DOCTYPE html>
<html>
<head>
    <title>Create Job</title>
</head>
<body>

<h1>Add Job</h1>

<form action="/jobs/store" method="POST">
    @csrf

    <input type="text" name="title" placeholder="Job Title">
    <br><br>

    <textarea name="description" placeholder="Description"></textarea>
    <br><br>

    <input type="text" name="company" placeholder="Company">
    <br><br>

    <input type="text" name="location" placeholder="Location">
    <br><br>

    <input type="number" name="salary" placeholder="Salary">
    <br><br>

    <button type="submit">
        Save
    </button>

</form>

</body>
</html>