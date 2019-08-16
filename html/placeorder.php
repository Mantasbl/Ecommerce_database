<?php require_once('connection.php'); ?>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="../css/style.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <title>Place An Order</title>
</head>
<body>
<h1 class="text-center">Add your product</h1>
<form action="placeordersuccess.php" name="placeorder" class="form-page" id="addform" method="post">
  <div class="form-group">
    <label for="productdropdown">Your Order</label>
    <?php
      $sql= "SELECT Product FROM Product";
      $result = mysqli_query($dbconnect, $sql);
      echo "<select class='form-control' name='productdropdown' id='productdropdown'>";
      while ($row = mysqli_fetch_array($result)) {
        echo "<option value='" . $row['Product'] . "' name='" . $row['Product'] .   "'>" . $row['Product'] . "</option>";
      }
      echo "</select>";
    ?>
  </div>
  <div class="form-group">
    <label for="FirstName">First Name</label>
    <input class="form-control" required name="firstname" id="firstname" type="text" placeholder="Enter Your First name">
  </div>
  <div class="form-group">
    <label for="LastName">Last Name</label>
    <input type="text" required class="form-control" name="LastName" id="LastName" placeholder="Enter your Last name">
  </div>
  <div class="form-group">
    <label for="mobile">Mobile</label>
    <input type="text" required class="form-control" name="mobile" id="mobile" placeholder="Enter mobile number">
  </div>
  <div class="form-group">
    <label for="Email">Email</label>
    <input type="text" required class="form-control" name="Email" id="Email" placeholder="Enter your Email">
  </div>
  <div class="form-group">
    <label for="paymenttypedropdown">Select Payment Type</label>
    <?php
      $sql= "SELECT PaymentType FROM PaymentType";
      $result = mysqli_query($dbconnect, $sql);
      echo "<select class='form-control' name='paymenttypedropdown' id='paymenttypedropdown'>";
      while ($row = mysqli_fetch_array($result)) {
        echo "<option value='" . $row['PaymentType'] . "' name='" . $row['PaymentType'] .   "'>" . $row['PaymentType'] . "</option>";
      }
      echo "</select>";
    ?>
  </div>
  <div class="form-group">
    <label for="deliverydropdown">Select Delivery Method</label>
    <?php
      $sql= "SELECT DeliveryMethod FROM DeliveryMethod";
      $result = mysqli_query($dbconnect, $sql);
      echo "<select class='form-control' name='deliverydropdown' id='deliverydropdown'>";
      while ($row = mysqli_fetch_array($result)) {
        echo "<option value='" . $row['DeliveryMethod'] . "' name='" . $row['DeliveryMethod'] .   "'>" . $row['DeliveryMethod'] . "</option>";
      }
      echo "</select>";
    ?>
  </div>
  <h1 class="text-center">Your Address</h1>
  <div class="form-group">
    <label for="orderaddress">Your Address</label>
    <input type="text" required class="form-control" name="orderaddress" id="orderaddress" placeholder="Enter Your Address">
  </div>
  <div class="form-group">
    <label for="ordertown">Town</label>
    <input type="text" class="form-control" name="ordertown" id="ordertown" placeholder="Your Town">
  </div>
  <div class="form-group">
    <label for="ordercounty">County</label>
    <input type="text" class="form-control" name="ordercounty" id="ordercounty" placeholder="Your County">
  </div>
  <div class="form-group">
    <label for="orderpostcode">Your Postcode</label>
    <input type="text" required class="form-control" name="orderpostcode" id="orderpostcode" placeholder="Enter Your Postcode">
  </div>


  <button type="submit" name="submitorder" class="btn btn-primary "> SubmitOrder</button>
  <a href='../index.php' class='btn btn-primary'>Home</a>
</form>


<?php mysqli_close($dbconnect); ?>
</body>
<script src="../js/script.js"></script>
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
</html>
