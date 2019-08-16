<?php require_once('connection.php'); ?>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="../css/style.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<body>
  <h1 class="text-center">Product View</h1>
  <?php

    $sql= "SELECT * FROM Product";
    echo "<table border='2'>
      <tr>
        <th>Product Name</th>
        <th>Product Description</th>
        <th>Product Price</th>
      </tr>";
    $result = mysqli_query($dbconnect, $sql);
    while($row = mysqli_fetch_array($result))
    {
      echo "<tr>";
      echo "<td>" . $row['Product'] . "</td>";
      echo "<td>" . $row['Description'] . "</td>";
      echo "<td>" . $row['Price_Per_Unit'] . "</td>";
      echo "</tr>";
    }
    echo "</table>";
  mysqli_close($dbconnect);
  ?>
  <a href='../index.php' class='btn btn-primary'>Home</a>
</body>
</html>
