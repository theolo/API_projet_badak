<?php
require '../config/cors.php';
include '../config/database.php';
include '../objects/page.php';

$database = new Database();
$db = $database->getConnection();

$page = new pageFt($db);

$data = json_decode(file_get_contents("php://input"));

try {
    if($page->updateTopPage($data->id_page, $data->titre, $data->h1, $data->url)){
        http_response_code(200);
        echo json_encode(
                array("message" => "Top page as been updated."));
    }
    else{
        http_response_code(401);
        echo json_encode(array("message" => "Unable to update Top page."));
    }
}catch (Exception $e){
    http_response_code(401);
    echo json_encode(array(
        "message" => "Access denied.",
        "error" => $e->getMessage()
    ));
}
?>