<?php
require '../config/cors.php';
include '../config/database.php';
include '../objects/user.php';

$database = new Database();
$db = $database->getConnection();

$user = new userFt($db);

$data = json_decode(file_get_contents("php://input"));

try {
    $decoded = JWT::decode($jwt, $key, array('HS256'));
    $user->nom = $data->nom;
    $user->prenom = $data->prenom;
    $user->entreprise = $data->entreprise;
    $user->email = $data->email;
    $user->password = $data->password;
    $user->admin = $data->admin;
    $user->id = $decoded->data->id;
    if($user->update()){
        http_response_code(200);
        echo json_encode(
                array("message" => "User was updated."));
    }
    else{
        http_response_code(401);
        echo json_encode(array("message" => "Unable to update user."));
    }
}catch (Exception $e){
    http_response_code(401);
    echo json_encode(array(
        "message" => "Access denied.",
        "error" => $e->getMessage()
    ));
}
?>