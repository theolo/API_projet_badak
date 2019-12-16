<?php
require '../config/cors.php';


class project {
    public $id;
    public $nom;
    public $description;
    public $id_user;

    public function __construct($id, $nom, $description, $id_user) {
        $this->id = $id;
        $this->nom = $nom;
        $this->description = $description;
        $this->id_user = $id_user;
    }
}

class projectFt {
    private $conn;
    private $table_name = "projet";

    public $id;
    public $nom;
    public $description;
    public $id_user;

    public function __construct($db){
        $this->conn = $db;
    }

    public function getList($id_user) {
        $query = "SELECT id, nom, description, id_user
                FROM " . $this->table_name . "
                WHERE id_user = ?";

        $stmt = $this->conn->prepare( $query );    
        $stmt->bindParam(1, $id_user);
        $stmt->execute();
        $project_arr = [];
        // var_dump($stmt->fetchAll());
        foreach($stmt->fetchAll() as $val) {
            $project_arr[] = new project($val["id"], $val["nom"], $val["description"], $val["id_user"]);
        }
        return $project_arr;
    }

    function create(){
        $query = "INSERT INTO " . $this->table_name . " (nom, description, id_user)
                VALUES (?, ?, ?)";

        $stmt = $this->conn->prepare($query);
        
        $this->nom=htmlspecialchars(strip_tags($this->nom));
        $this->description=htmlspecialchars(strip_tags($this->description));
        $this->id_user=htmlspecialchars(strip_tags($this->id_user));

        $stmt->bindParam(1, $this->nom);
        $stmt->bindParam(2, $this->description);
        $stmt->bindParam(3, $this->id_user);

        if($stmt->execute()){
            return true;
        }
        return false;
    }
}
?>