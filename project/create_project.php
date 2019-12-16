<?php
require '../config/cors.php';
include_once '../config/database.php';
include_once '../objects/project.php';

$database = new Database();
$db = $database->getConnection();

$project = new projectFt($db);

$data = json_decode(file_get_contents("php://input"));

$project->nom = $data->nom;
$project->description = $data->description;
$project->id_user = $data->id_user;

if(
    !empty($project->nom) &&
    !empty($project->id_user) &&
    $project->create()
){
    http_response_code(200);
    echo json_encode(array("message" => "Projet créé."
));
}else{
    http_response_code(400);
    echo json_encode(array("message" => "Unable to create project."
));
}
?>