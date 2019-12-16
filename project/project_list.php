<?php
require '../config/cors.php';
require '../config/database.php';
require '../objects/project.php';

if ((isset($_GET['id_user'])) && ((int)$_GET['id_user'] !== 0)){
    $id_user = $_GET['id_user'];

    $database = new Database();
    $db = $database->getConnection();

    $projects = new projectFt($db);
    try {
        $result = ["projets" => []];
        $result["projets"] = $projects->getList($id_user);
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