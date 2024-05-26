<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
</head>

<body>
    <h2>Login Form</h2>
    <form action="login.php" method="post">
        <label for="username">Username:</label><br>
        <input type="text" id="username" name="username" required><br>
        <label for="password">Password:</label><br>
        <input type="password" id="password" name="password" required><br><br>
        <input type="submit" value="Login">
    </form>
</body>

</html>

<!-- Php code : -->
<?php
<!-- // Function to validate user credentials -->
function authenticateUser($username, $password) {
<!-- // Replace this with your actual username and password validation logic -->
$valid_users = array( 'user1' => 'password1', 'user2' => 'password2'
);
 
// Check if username exists and password matches
if (array_key_exists($username, $valid_users) && $valid_users[$username] === $password)
{
return true; // Authentication successful
} else {
return false; // Authentication failed
}
}
 
// Check if form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
// Get username and password from the form
$username = $_POST['username'];
$password = $_POST['password'];
 
// Validate user credentials
if (authenticateUser($username, $password)) {
// Authentication successful
echo "Login successful. Welcome, $username!";
// You can redirect the user to another page here
} else {
// Authentication failed
echo "Invalid username or password. Please try again.";
// You can redirect the user back to the login page here
}
}
?>