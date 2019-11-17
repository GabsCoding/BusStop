<?php
class Banco{
  public function connect(){
    $dsn = "mysql:host=localhost;dbname=bus";
    try {
    $pdo = new PDO($dsn, "root","");
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
      return $pdo;
    } catch (PDOException $e) {
      echo($e->getMessage());
    }
  }
  public function desconnect(){
      $pdo = null;
  }
}
?>
