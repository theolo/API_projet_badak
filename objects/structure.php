<?php
require '../config/cors.php';


class structure {
    public $id;
    public $nom;
    

    public function __construct($id, $nom) {
        $this->id = $id;
        $this->nom = $nom;
    }
}

class structureFt {
    private $conn;
    private $table_name = "modele";

    public $id;
    public $nom;

    public function __construct($db){
        $this->conn = $db;
    }

    public function getModeleList() {
        $query = "SELECT id, nom
                FROM " . $this->table_name;

        $stmt = $this->conn->prepare( $query );    
        $stmt->execute();
        $modele_arr = [];
        foreach($stmt->fetchAll() as $val) {
            $modele_arr[] = new structure($val["id"], $val["nom"]);
        }
        return $modele_arr;
    }

    public function createModele() {
        $query = "INSERT INTO " . $this->table_name . " (nom)
                VALUES (?)";

        $stmt = $this->conn->prepare($query);
        
        $this->nom=htmlspecialchars(strip_tags($this->nom));

        $stmt->bindParam(1, $this->nom);

        if($stmt->execute()){
            return true;
        }
        return false;
    }
}
?>