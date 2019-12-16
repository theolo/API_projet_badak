<?php
require '../config/cors.php';


require '../config/database.php';
require '../objects/page.php';

if ((isset($_GET['id_field'])) && ((int)$_GET['id_field'] !== 0) && (isset($_GET['id_page'])) && ((int)$_GET['id_page'] !== 0)){
    $id_field = $_GET['id_field'];
    $id_page = $_GET['id_page'];

    $database = new Database();
    $db = $database->getConnection();

    $page = new pageFt($db);
    try {
        $result = ["content" => []];
        $result["content"] = $page->getContent($id_field, $id_page);
        echo json_encode($result);
    }
    catch (PDOExecption $e) {
        echo json_encode(["Error" => "PDO error : " . $e->getMessage()]);
    }
    catch (Execption $e) {
        echo json_encode(["Error" => "Unknown error : " . $e->getMessage()]);
    }
}