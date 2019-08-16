<?php require_once('connection.php'); ?>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="../css/style.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <title>Add your product</title>
</head>
<body>



<h1 class="text-center">Add your product</h1>
<form action="addproductsuccess.php" name="addproduct" class="form-page" id="addform" method="post">
  <div class="form-group">
    <label for="ProductName">Product Name</label>
    <input class="form-control" required name="ProductName" id="ProductName" type="text" placeholder="Enter Product Name">
  </div>
  <div class="form-group">
    <label for="ProductDescription">Product Description</label>
    <input type="text" required class="form-control" name="ProductDescription" id="ProductDescription" placeholder="Enter Description">
  </div>
  <div class="form-group">
    <label for="ProductInStorage">Products in Storage</label>
    <input type="number" required class="form-control" name="ProductInStorage" id="ProductInStorage" placeholder="Enter quantity of products in storage">
  </div>
  <div class="form-group">
    <label for="Price_Per_Unit">Price per unit</label>
    <input type="number" step="0.01" required class="form-control" name="Price_Per_Unit" id="Price_Per_Unit" placeholder="Enter Price of 1 unit">
  </div>
  <div class="form-group">
    <label for="categorydropdown">Select Product Category</label>
    <?php
      $sql= "SELECT Category FROM Category";
      $result = mysqli_query($dbconnect, $sql);
      echo "<select class='form-control' name='categorydropdown' id='categorydropdown'>";
      while ($row = mysqli_fetch_array($result)) {
        echo "<option value='" . $row['Category'] . "' name='" . $row['Category'] .   "'>" . $row['Category'] . "</option>";
      }
      echo "</select>";
    ?>
  </div>
  <div class="form-group">
    <label for="supplierdrowdown">Supplier</label>
    <?php
      $sql= "SELECT Company FROM ProductSupplier";
      $result = mysqli_query($dbconnect, $sql);
      echo "<select class='form-control' name='supplierdropdown' id='supplierdropdown'>";
      while ($row = mysqli_fetch_array($result)) {
        echo "<option value='" . $row['Company']  . "' name='" . $row['Company'] .   "'>" . $row['Company'] . "</option>";
      }
      echo "</select>";
    ?>
  </div>
  <button type="submit" name="submitproduct" class="btn btn-primary "> Add Product</button>
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
