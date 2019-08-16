<?php require_once('connection.php'); ?>

<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="../css/style.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <title>Product Add</title>
</head>
<body>
  <?php

      $sql = "INSERT INTO Product VALUES
      (NULL, '$_POST[ProductName]', '$_POST[ProductDescription]', '$_POST[Price_Per_Unit]')";
      mysqli_query($dbconnect, $sql);

      $sql = "INSERT INTO ProductInStorage VALUES
       (NULL, (SELECT ProductSupplierID FROM ProductSupplier WHERE Company = '$_POST[supplierdropdown]'),
       (SELECT ProductID FROM Product WHERE Product = '$_POST[ProductName]'), '$_POST[ProductInStorage]' )";
       mysqli_query($dbconnect, $sql);

      $sql = "INSERT INTO ProductCategory VALUES ((SELECT CategoryID FROM Category WHERE Category = '$_POST[categorydropdown]'),
      (SELECT ProductID FROM Product WHERE Product = '$_POST[ProductName]'))";
      mysqli_query($dbconnect, $sql);

      echo "<h1>You have successfully Added a Product</h1>";
      echo "<a href='../index.php' class='btn btn-primary'>Home</a>";
  ?>

</body>
</html>
