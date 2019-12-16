<?php
require '../config/cors.php';


require '../config/database.php';
require '../objects/page.php';

if ((isset($_GET['id_bloc'])) && ((int)$_GET['id_bloc'] !== 0)){
    $id_bloc = $_GET['id_bloc'];

    $database = new Database();
    $db = $database->getConnection();

    $page = new pageFt($db);
    try {
        $result = ["bloc_fieldsgroups" => []];
        $result["bloc_fieldsgroups"] = $page->getFieldsGroups($id_bloc);
        echo json_encode($result);
    }
    catch (PDOExecption $e) {
        echo json_encode(["Error" => "PDO error : " . $e->getMessage()]);
    }
    catch (Execption $e) {
        echo json_encode(["Error" => "Unknown error : " . $e->getMessage()]);
    }
}