<?php
require '../config/cors.php';
include_once '../config/database.php';
include_once '../objects/user.php';

$database = new Database();
$db = $database->getConnection();

$user = new userFt($db);

$data = json_decode(file_get_contents("php://input"));

$user->nom = $data->nom;
$user->prenom = $data->prenom;
$user->entreprise = $data->entreprise;
$user->email = $data->email;
$user->password = $data->password;
if($data->isAdmin === false)
    $user->admin = 0;
else
    $user->admin = TRUE;

if(
    !empty($user->nom) &&
    !empty($user->prenom) &&
    !empty($user->entreprise) &&
    !empty($user->email) &&
    !empty($user->password) &&
    $user->create()
){
    http_response_code(200);
    echo json_encode(array("message" => "User was created."
));
}else{
    http_response_code(400);
    echo json_encode(array("message" => "Unable to create user."
));
}
?>