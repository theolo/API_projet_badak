<?php
require '../config/cors.php';


require '../config/database.php';
require '../objects/page.php';

if ((isset($_GET['id_group'])) && ((int)$_GET['id_group'] !== 0)){
    $id_group = $_GET['id_group'];

    $database = new Database();
    $db = $database->getConnection();

    $page = new pageFt($db);
    try {
        $result = ["group_fields" => []];
        $result["group_fields"] = $page->getFields($id_group);
        echo json_encode($result);
    }
    catch (PDOExecption $e) {
        echo json_encode(["Error" => "PDO error : " . $e->getMessage()]);
    }
    catch (Execption $e) {
        echo json_encode(["Error" => "Unknown error : " . $e->getMessage()]);
    }
}