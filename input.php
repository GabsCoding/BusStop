<?php
class Incluir{
  public function inserir(){
    $banco = new mysqli("localhost","root","", "bus"); //Conecção com o banco
    if(!$banco){ //Caso dê Erro
      die("ERRO ". $banco->error); //Para a execução
    }else{ //Caso Contrário
      $nomes = ["routes", "shapes", "stops"]; //Pega os títulos em um array

      foreach ($nomes as $nome){ //Para cada valor no array
        $arq = fopen("arquivos/$nome.txt", "r"); //Abre um arquivo para leitura

        while(($dados = fgetcsv($arq, 0, ",")) != false){ //Retorna cada linha do arquivo
            $sql = "INSERT INTO $nome VALUES";
            $sql .= "(";
            foreach ($dados as $dado){ //Para cada valor
              $sql .= $dado.","; //O valor a ser inserido
            }
            $sql = substr($sql, 0, -1); //Retira a última virgula
            $sql .= ")"; //Acrescenta o parenteses final
            $banco->query($sql); //Executa a query
        }
      }
    }
  }
}

 ?>
