<?php
// Establish database connection
$servername = "localhost";
$username = "root"; // Default XAMPP username
$password = ""; // Default XAMPP password is empty
$dbname = "college";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Check if form is submitted for saving data
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['submit'])) {
    // Retrieve form data and insert into database
    $gate_pass_no = $_POST['gate_pass_no'];
    $serial_no = $_POST['serial_no'];
    $description = $_POST['description'];
    $vehicle_no = $_POST['vehicle_no'];
    $quantity = $_POST['quantity'];
    $accompanying_persons = $_POST['accompanying_persons'];
    $issuing_department = $_POST['issuing_department'];
    $issued_to_whom = $_POST['issued_to_whom'];
    $issued_to_where = $_POST['issued_to_where'];
    $purpose = $_POST['purpose'];
    $time_out = $_POST['time_out'];
    $security_check = $_POST['security_check'];
    $remarks = $_POST['remarks'];
    $returnable = $_POST['returnable'];
    $issuing_official = $_POST['issuing_official'];
    $superior_officer = $_POST['superior_officer'];
    $project_coordinator = $_POST['project_coordinator'];

    // File upload for PDF
    $pdf_file = $_FILES['pdf_file']['name'];
    $target_dir_pdf = "pdfs/";
    $target_file_pdf = $target_dir_pdf . basename($_FILES["pdf_file"]["name"]);
    move_uploaded_file($_FILES["pdf_file"]["tmp_name"], $target_file_pdf);

    // Insert data into gate_pass table
    $sql = "INSERT INTO gate_pass (gate_pass_no, serial_no, description, vehicle_no, quantity, accompanying_persons, issuing_department, issued_to_whom, issued_to_where, purpose, time_out, security_check, remarks, returnable, issuing_official, superior_officer, project_coordinator, pdf_file)
    VALUES ('$gate_pass_no', '$serial_no', '$description', '$vehicle_no', '$quantity', '$accompanying_persons', '$issuing_department', '$issued_to_whom', '$issued_to_where', '$purpose', '$time_out', '$security_check', '$remarks', '$returnable', '$issuing_official', '$superior_officer', '$project_coordinator', '$pdf_file')";

    if ($conn->query($sql) === TRUE) {
        echo "New record created successfully";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}

// Check if gate pass number is provided for searching
if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['gate_pass_no'])) {
    // Retrieve gate pass number from the URL query string
    $gate_pass_no = $_GET['gate_pass_no'];

    // Prepare SQL statement to search for gate pass details by gate pass number
    $sql = "SELECT * FROM gate_pass WHERE gate_pass_no = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $gate_pass_no);
    $stmt->execute();
    $result = $stmt->get_result();

    // Check if any results were found
    if ($result->num_rows > 0) {
        // Display results in a table format
        echo "<h2>Gate Pass Details</h2>";
        echo "<table border='1'>";
        echo "<tr><th>Gate Pass No</th><th>Serial No</th><th>Description</th><th>Vehicle No</th><th>Qty (MT)</th><th>Accompanying Persons</th><th>Issuing Department</th><th>Issued To Whom</th><th>Issued To Where</th><th>Purpose</th><th>Time Out</th><th>Security Check</th><th>Remarks</th><th>Returnable</th><th>Issuing Official</th><th>Superior Officer</th><th>Project Coordinator</th><th>PDF File</th></tr>";
        while ($row = $result->fetch_assoc()) {
            echo "<tr>";
            echo "<td>".$row['gate_pass_no']."</td>";
            echo "<td>".$row['serial_no']."</td>";
            echo "<td>".$row['description']."</td>";
            echo "<td>".$row['vehicle_no']."</td>";
            echo "<td>".$row['quantity']."</td>";
            echo "<td>".$row['accompanying_persons']."</td>";
            echo "<td>".$row['issuing_department']."</td>";
            echo "<td>".$row['issued_to_whom']."</td>";
            echo "<td>".$row['issued_to_where']."</td>";
            echo "<td>".$row['purpose']."</td>";
            echo "<td>".$row['time_out']."</td>";
            echo "<td>".$row['security_check']."</td>";
            echo "<td>".$row['remarks']."</td>";
            echo "<td>".$row['returnable']."</td>";
            echo "<td>".$row['issuing_official']."</td>";
            echo "<td>".$row['superior_officer']."</td>";
            echo "<td>".$row['project_coordinator']."</td>";
            // View PDF link
            echo "<td><a href='view_pdf.php?pdf=".$row['pdf_file']."' target='_blank'>View PDF</a></td>";
            echo "</tr>";
        }
        echo "</table>";
    } else {
        echo "No records found.";
    }

    // Close statement and connection
    $stmt->close();
}

// Close database connection
$conn->close();
?>
