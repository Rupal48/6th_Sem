<!-- register.php -->
<!DOCTYPE html>
<html>
<head>
<title>User Registration</title>
</head>
<body>
<h2>User Registration Form</h2>
<form action="register_process.php" method="post">
<label for="name">Name:</label><br>
<input type="text" id="name" name="name" required><br><br>
 
<label for="address">Address:</label><br>
<input type="text" id="address" name="address" required><br><br>
 
<label for="email">Email:</label><br>
<input type="email" id="email" name="email" required><br><br>
 
<label for="mobile">Mobile Number:</label><br>
<input type="text" id="mobile" name="mobile" required><br><br>
 
<input type="submit" value="Submit">
</form>
</body> </html>
register_process.php:
<?php
// Establishing connection to MySQL database
$servername = "localhost";
$username = "root"; // Your MySQL username
$password = ""; // Your MySQL password
$dbname = "exp10wt"; // Your MySQL database name

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
 
// Check connection if ($conn->connect_error) { die("Connection failed: " . $conn->connect_error);
}
 
// Fetching user input from register.php
$name = $_POST['name'];
$address = $_POST['address'];
$email = $_POST['email'];
$mobile = $_POST['mobile'];
 
// Inserting data into MySQL table
$sql = "INSERT INTO users (name, address, email, mobile) VALUES ('$name', '$address', '$email', '$mobile')";
 
if ($conn->query($sql) === TRUE) {      	echo "New record created successfully";
} else {    	echo "Error: " . $sql . "<br>" . $conn-
>error;
}
 
// Close MySQL connection
$conn->close();
?>
 
display.php:
<!DOCTYPE html>
<html>
<head>
<title>User List</title>
<style>
table {
border-collapse:                 	collapse; width: 100%;
}
th, td {
border: 1px solid #dddddd; text-align: left;
padding: 8px;
}
</style>
</head>
<body>

<h2>User List</h2>
<table>
<tr>
<th>Name</th>
<th>Address</th>
<th>Email</th>
<th>Mobile</th>
</tr>
<?php
// Establishing connection to MySQL database
$servername = "localhost";
$username = "root"; // Your MySQL username
$password = ""; // Your MySQL password
$dbname = "exp10wt"; // Your MySQL database name
 
// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
 
// Check connection      	if ($conn->connect_error) { die("Connection failed: " . $conn->connect_error);
}
 
// Fetching data from MySQL table
$sql = "SELECT * FROM users";
$result = $conn->query($sql);
 
if ($result->num_rows > 0) {          	// Output data of each row                                        	while($row =
$result->fetch_assoc()) {
echo "<tr><td>".$row["name"]."</td><td>".$row["address"]."</td><td>".$row["email"]."</td><t d>".$row["mobile"]."</td></tr>";
}
} else {
echo "0 results";
}
 
// Close MySQL connection
$conn->close();
?>
</table>
</body>
</html>
