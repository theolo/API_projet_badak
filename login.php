<?php
require 'config/cors.php';
require 'config/database.php';
require 'objects/user.php';

$database = new Database();
$db = $database->getConnection();

$userft = new userFt($db);

$data = json_decode(file_get_contents("php://input"));

$userft->email = $data->email;
$email_exists = $userft->emailExists();

if($email_exists && password_verify($data->password, $userft->password)){
    http_response_code(200);
    echo json_encode(array("message" => "Successful login.",
        "user" => ["id" => $userft->id,
                    "nom" => $userft->nom,
                    "prenom" => $userft->prenom,
                    "entreprise" => $userft->entreprise,
                    "email" => $userft->email,
                    "admin" => $userft->admin
                    ]
));
}else{
    http_response_code(401);
    echo json_encode(array("message" => "Login failed."));
}
?>