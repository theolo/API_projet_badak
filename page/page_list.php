<?php
require '../config/cors.php';
require '../config/database.php';
require '../objects/page.php';

if ((isset($_GET['id_projet'])) && ((int)$_GET['id_projet'] != 0)){
    $id_projet = (int)$_GET['id_projet'];

    $database = new Database();
    $db = $database->getConnection();

    $pages = new pageFt($db);
    try {
        $result = ["pages" => []];
        $result["pages"] = $pages->getList($id_projet);
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