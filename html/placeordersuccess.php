<?php require_once('connection.php'); ?>

<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="../css/style.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <title>Place an Order</title>
</head>
<body>
  <?php

      $sql = "INSERT INTO Delivery VALUES (NULL, (SELECT DeliveryMethodID FROM DeliveryMethod WHERE DeliveryMethod = '$_POST[deliverydropdown]'), (SELECT DATE_ADD(now(), INTERVAL 10 DAY)), '9.99')";
      mysqli_query($dbconnect, $sql);
      echo "<h1>You have successfully Placed An Order</h1>";
      echo "<a href='../index.php' class='btn btn-primary'>Home</a>";

      $sql = "INSERT INTO Customer VALUES (NULL, '$_POST[firstname]', '$_POST[LastName]', '$_POST[mobile]', '$_POST[Email]')";
      mysqli_query($dbconnect, $sql);

      $sql = "INSERT INTO OrderBillingAddress VALUES (NULL, '$_POST[orderaddress]', '$_POST[ordertown]', '$_POST[ordercounty]', '$_POST[orderpostcode]')";
      mysqli_query($dbconnect, $sql);

      $sql = "INSERT INTO OrderDeliveryAddress VALUES (NULL, '$_POST[orderaddress]', '$_POST[ordertown]', '$_POST[ordercounty]', '$_POST[orderpostcode]')";
      mysqli_query($dbconnect, $sql);

      $sql = "INSERT INTO CustomerAddress VALUES (NULL, (SELECT OrderBillingAddressID FROM OrderBillingAddress WHERE Address = '$_POST[orderaddress]'),
        (SELECT OrderDeliveryAddressID FROM OrderDeliveryAddress WHERE Address = '$_POST[orderaddress]'),
        (SELECT CustomerID FROM Customer WHERE FirstName = '$_POST[LastName]' and Mobile = '$_POST[mobile]'),
        )";
      mysqli_query($dbconnect, $sql);

      $sql = "INSERT INTO ShopOrder VALUES (NULL, NULL,
       (SELECT PaymentTypeID WHERE PaymentType = '$_POST[paymenttypedropdown]'),
       (SELECT CustomerAddressID FROM CustomerAddress WHERE Address = '$_POST[orderaddress]' AND Postcode = '$_POST[orderpostcode]'))";
      mysqli_query($dbconnect, $sql);

  ?>

</body>
</html>
