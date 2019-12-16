<?php
require '../config/cors.php';


require '../config/database.php';
require '../objects/page.php';

if ((isset($_GET['id_modele'])) && ((int)$_GET['id_modele'] !== 0)){
    $id_modele = $_GET['id_modele'];

    $database = new Database();
    $db = $database->getConnection();

    $page = new pageFt($db);
    try {
        $result = ["page_blocs" => []];
        $result["page_blocs"] = $page->getBlocs($id_modele);
        echo json_encode($result);
    }
    catch (PDOExecption $e) {
        echo json_encode(["Error" => "PDO error : " . $e->getMessage()]);
    }
    catch (Execption $e) {
        echo json_encode(["Error" => "Unknown error : " . $e->getMessage()]);
    }
}