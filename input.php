<?php
include_once "banco.php";

class Incluir{
  public function inserir(){
    $obj = new Banco();
    $pdo = $obj->connect();
    if($pdo != null){
      $nomes = ["routes", "shapes", "stops"];
      $arq1 = file("arquivos/".$nomes[0].".txt");
      $arq2 = file("arquivos/".$nomes[1].".txt");
      $arq3 = file("arquivos/".$nomes[2].".txt");

      //$titulos = [explode(",", $arq1[0]), explode(",", $arq2[0]), explode(",", $arq3[0])];
      array_shift($arq1);
      array_shift($arq2);
      array_shift($arq3);
      $arq =[$arq1, $arq2, $arq3];
      // $i = 0;
      // $len = 0;
      // foreach ($titulos as $linha) {
      //   $sql = "CREATE TABLE $nomes[$i]{";
      //   foreach ($linha as $valor) {
      //     if($len+1 == count($linha)){
      //       $sql .= $valor." VARCHAR(60)";
      //     }else{
      //       $sql .= $valor." VARCHAR(60),";
      //     }
      //   }
      //   $sql .= "}";
      //   $len = 0;
      //   $i += 1;
      //   $pdo->exec($sql);
        //   }
        foreach ($arq as $linha) {
          foreach ($linha as $value) {
            foreach ($ as $value) {

            }
          }
        }
         }
      }
    }
 ?>
