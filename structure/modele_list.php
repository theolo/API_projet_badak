<?php
require '../config/cors.php';
require '../config/database.php';
require '../objects/structure.php';

if ((isset($_GET['admin'])) && ((int)$_GET['admin'] === 1)){
    $database = new Database();
    $db = $database->getConnection();

    $structure = new structureFt($db);
    try {
        $result = ["modeles" => []];
        $result["modeles"] = $structure->getModeleList();
        echo json_encode($result);
    }
    catch (PDOExecption $e) {
        echo json_encode(["Error" => "PDO error : " . $e->getMessage()]);
    }
    catch (Execption $e) {
        echo json_encode(["Error" => "Unknown error : " . $e->getMessage()]);
    }
}

?>