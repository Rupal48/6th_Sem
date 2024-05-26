<html>

<head>
    <title>Read Data from TXT File</title>
    <style>
        table {
            width: 50%;
            margin: auto;
            border-collapse: collapse;
        }

        table,
        th,
        td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }
    </style>
</head>

<body>

    <?php
$file = "data.txt"; // Path to your TXT file

// Check if the file exists
if(file_exists($file)) {
    // Read the entire file into a string
    $data = file_get_contents($file);

    // Explode the string into an array using ":" as the delimiter
    $info = explode(":", $data);

    // Trim any whitespace from the values
    $name = trim($info[0]);
    $password = trim($info[1]);
    $email = trim($info[2]);

    // Initialize HTML table
    echo "<table>";
    echo "<tr><th>Name</th><th>Password</th><th>Email</th></tr>";

    // Output table row with the data
    echo "<tr><td>$name</td><td>$password</td><td>$email</td></tr>";

    // Close the table
    echo "</table>";
} else {
    echo "File not found!";
}
?>

</body>

</html>