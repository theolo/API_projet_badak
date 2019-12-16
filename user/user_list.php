<?php
require '../config/cors.php';
require '../config/database.php';
require '../objects/user.php';

$database = new Database();
$db = $database->getConnection();

$userft = new userFt($db);
try {
    $result = ["users" => []];
    $result["users"] = $userft->getList();
    echo json_encode($result);
}
catch (PDOExecption $e) {
    echo json_encode(["Error" => "PDO error : " . $e->getMessage()]);
}
catch (Execption $e) {
    echo json_encode(["Error" => "Unknown error : " . $e->getMessage()]);
}


?>