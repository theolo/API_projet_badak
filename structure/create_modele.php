<?php
require '../config/cors.php';
include_once '../config/database.php';
include_once '../objects/structure.php';

$database = new Database();
$db = $database->getConnection();

$structure = new structureFt($db);

$data = json_decode(file_get_contents("php://input"));

$structure->nom = $data->nom;

if(
    !empty($structure->nom) &&
    $structure->createModele()
){
    http_response_code(200);
    echo json_encode(array("message" => "Modèle créé."
));
}else{
    http_response_code(400);
    echo json_encode(array("message" => "Impossible de créer le modèle."
));
}
?>