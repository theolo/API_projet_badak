<?php
require '../config/cors.php';
include_once '../config/database.php';
include_once '../objects/page.php';

$database = new Database();
$db = $database->getConnection();

$page = new pageFt($db);

$data = json_decode(file_get_contents("php://input"));

$page->nom = $data->nom;
$page->description = $data->description;
$page->titre = $data->titre;
$page->h1 = $data->h1;
$page->url = $data->url;
$page->id_projet = $data->id_projet;
$page->id_modele = $data->id_modele;

if(
    !empty($page->nom) &&
    $page->create()
){
    http_response_code(200);
    echo json_encode(array("message" => "Page créée."
));
}else{
    http_response_code(400);
    echo json_encode(array("message" => "Unable to create project."
));
}
?>