<?php
header('Access-Control-Allow-Origin: http://localhost:3000');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS');
header('Access-Control-Allow-Headers: X-Requested-With');
header("Access-Control-Max-Age: 3600");
header("Content-Type: application/json; charset=UTF-8");

class user {
    public $id, $nom, $prenom, $entreprise, $email, $password, $admin;

    public function __construct($id, $nom, $prenom, $entreprise, $email, $password, $admin) {
        $this->id = $id;
        $this->nom = $nom;
        $this->prenom = $prenom;
        $this->entreprise = $entreprise;
        $this->email = $email;
        $this->password = $password;
        $this->admin = $admin;
    }
}

class userFt {
    private $conn;
    private $table_name = "utilisateur";

    public $id;
    public $nom;
    public $prenom;
    public $entreprise;
    public $email;
    public $password;
    public $admin;

    public function __construct($db){
        $this->conn = $db;
    }

    public function getList() {
        $query = "SELECT id, nom, prenom, entreprise, email, password, admin
                FROM " . $this->table_name . "
                WHERE admin = 0";
        $stmt = $this->conn->prepare( $query );    
        $stmt->execute();
        $user_arr = [];
        // var_dump($stmt->fetchAll());
        foreach($stmt->fetchAll() as $val) {
            $user_arr[] = new User($val["id"], 
                                    $val["nom"], 
                                    $val["prenom"], 
                                    $val["entreprise"], 
                                    $val["email"], 
                                    $val["password"], 
                                    $val["admin"]);
        }
        return $user_arr;
    }

    function create(){
        $query = "INSERT INTO " . $this->table_name . "
                SET
                    nom = :nom,
                    admin = :admin,
                    prenom = :prenom,
                    entreprise = :entreprise,
                    email = :email,
                    password = :password";

        $stmt = $this->conn->prepare($query);
        
        $this->nom=htmlspecialchars(strip_tags($this->nom));
        $this->prenom=htmlspecialchars(strip_tags($this->prenom));
        $this->entreprise=htmlspecialchars(strip_tags($this->entreprise));
        $this->email=htmlspecialchars(strip_tags($this->email));
        $this->password=htmlspecialchars(strip_tags($this->password));

        $stmt->bindParam(':nom', $this->nom);
        $stmt->bindParam(':admin', $this->admin);
        $stmt->bindParam(':prenom', $this->prenom);
        $stmt->bindParam(':entreprise', $this->entreprise);
        $stmt->bindParam(':email', $this->email);

        $password_hash = password_hash($this->password, PASSWORD_BCRYPT);
        $stmt->bindParam(':password', $password_hash);

        if($stmt->execute()){
            return true;
        }
        return false;
    }

    function emailExists(){
        $query = "SELECT id, nom, prenom, entreprise, password, admin
                FROM " . $this->table_name . "
                WHERE email = ?
                LIMIT 0,1";
    
        $stmt = $this->conn->prepare( $query );
    
        $this->email=htmlspecialchars(strip_tags($this->email));
    
        $stmt->bindParam(1, $this->email);
        $stmt->execute();
        $num = $stmt->rowCount();

        if($num=1){
            $row = $stmt->fetch(PDO::FETCH_ASSOC);
    
            $this->id = $row['id'];
            $this->nom = $row['nom'];
            $this->prenom = $row['prenom'];
            $this->entreprise = $row['entreprise'];
            $this->password = $row['password'];
            $this->admin = $row['admin'];

            return true;
        }
        return false;
    }

    public function update(){
        $password_set=!empty($this->password) ? ", password = :password" : "";
    
        $query = "UPDATE " . $this->table_name . "
                SET
                    nom = :nom,
                    prenom = :prenom,
                    entreprise = :entreprise,
                    email = :email,
                    admin = :admin
                    {$password_set}
                WHERE id = :id";
    
        $stmt = $this->conn->prepare($query);
    
        $this->nom=htmlspecialchars(strip_tags($this->nom));
        $this->prenom=htmlspecialchars(strip_tags($this->prenom));
        $this->entreprise=htmlspecialchars(strip_tags($this->entreprise));
        $this->email=htmlspecialchars(strip_tags($this->email));
    
        $stmt->bindParam(':nom', $this->nom);
        $stmt->bindParam(':prenom', $this->prenom);
        $stmt->bindParam(':entreprise', $this->entreprise);
        $stmt->bindParam(':email', $this->email);
        $stmt->bindParam(':admin', $this->admin);
    
        if(!empty($this->password)){
            $this->password=htmlspecialchars(strip_tags($this->password));
            $password_hash = password_hash($this->password, PASSWORD_BCRYPT);
            $stmt->bindParam(':password', $password_hash);
        }

        $stmt->bindParam(':id', $this->id);
    
        if($stmt->execute()){
            return true;
        }
        return false;
    }
}

