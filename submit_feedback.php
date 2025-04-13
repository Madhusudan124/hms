<?php
include 'db_connect.php';  // Use correct path

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = $_POST['name'];
    $email = $_POST['email'];
    $message = $_POST['message'];

    $stmt = mysqli_prepare($conn, "INSERT INTO feedback (name, email, message, date) VALUES (?, ?, ?, NOW())");
    mysqli_stmt_bind_param($stmt, "sss", $name, $email, $message);
    mysqli_stmt_execute($stmt);

    if (mysqli_stmt_affected_rows($stmt) > 0) {
        echo "Feedback submitted successfully.";
    } else {
        echo "Failed to submit feedback.";
    }

    mysqli_stmt_close($stmt);
}
?>
