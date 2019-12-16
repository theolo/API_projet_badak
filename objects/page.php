<?php
require '../config/cors.php';


class page {
    public $id;
    public $nom;
    public $description;
    public $titre;
    public $h1;
    public $url;
    public $id_projet;
    public $id_modele;

    public function __construct($id, $nom, $description, $titre, $h1, $url, $id_projet, $id_modele) {
        $this->id = $id;
        $this->nom = $nom;
        $this->description = $description;
        $this->titre = $titre;
        $this->h1 = $h1;
        $this->url =$url;
        $this->id_projet = $id_projet;
        $this->id_modele = $id_modele;
    }
}

class pageFt {
    private $conn;
    private $table_name = "page";

    public $id;
    public $nom;
    public $description;
    public $titre;
    public $h1;
    public $url;
    public $id_projet;
    public $id_modele;

    public function __construct($db){
        $this->conn = $db;
    }
    /**
     * 
     */
    public function getList(int $id_projet):array {
        $query = "SELECT id, nom, description, titre, h1, url, id_projet, id_modele
                FROM " . $this->table_name . "
                WHERE id_projet = ?";

        $stmt = $this->conn->prepare( $query );    
        $stmt->bindParam(1, $id_projet);
        $stmt->execute();
        $page_arr = [];
        foreach($stmt->fetchAll() as $val) {
            $page_arr[] = new page($val["id"], $val["nom"], $val["description"], $val["titre"], 
                                    $val['h1'], $val['url'], $val['id_projet'], $val['id_modele']);
        }
        return $page_arr;
    }
    public function getBlocs($id_modele) {
        $query = "SELECT `bloc`.`id` AS bloc_id, `bloc`.`ordre` AS bloc_order, `bloc`.`nom` AS bloc_nom, `bloc`.`id_modele` AS bloc_modele,
                            `modele`.`id` AS modele_id, `modele`.`nom` AS modele_nom
                            FROM `bloc` 
                                LEFT JOIN `modele` ON `bloc`.`id_modele` = `modele`.`id` 
                                WHERE `modele`.`id` = ? ORDER BY bloc_order";
        $stmt = $this->conn->prepare( $query );    
        $stmt->bindParam(1, $id_modele);
        $stmt->execute();
        $bloc_arr = [];
        // var_dump($stmt->fetchAll());
        foreach($stmt->fetchAll() as $val) {
            $bloc = new stdClass();
            $bloc->bloc_id = $val["bloc_id"];
            $bloc->bloc_order = $val["bloc_order"];
            $bloc_arr[] = $bloc;
        }
        return $bloc_arr;
    }
    public function getFieldsGroups($id_bloc) {
        $query = "SELECT `ensemble_champ`.`id`, `ensemble_champ`.`ordre`, `ensemble_champ`.`id_bloc`, `type_ensemble`.`type`
                        FROM `ensemble_champ` 
                            LEFT JOIN `type_ensemble` ON `ensemble_champ`.`id_type_ensemble` = `type_ensemble`.`id`
                            WHERE `ensemble_champ`.`id_bloc` = ?
                            ORDER BY ordre ASC";
        $stmt = $this->conn->prepare( $query );    
        $stmt->bindParam(1, $id_bloc);
        $stmt->execute();
        $fieldsgroups_arr = [];
        // var_dump($stmt->fetchAll());
        foreach($stmt->fetchAll() as $val) {
            $fieldsgroup = new stdClass();
            $fieldsgroup->fieldsgroup_id = $val["id"];
            $fieldsgroup->fieldsgroup_ordre = $val["ordre"];
            $fieldsgroup->fieldsgroup_type = $val["type"];
            $fieldsgroup->fieldsgroup_bloc = $val["id_bloc"];
            $fieldsgroups_arr[] = $fieldsgroup;
        }
        return $fieldsgroups_arr;
    }
    public function getFields($id_group) {
        $query = "SELECT `champ`.`id`, `champ`.`nom`, `champ`.`ordre`, `champ`.`id_ensemble`, `type_champ`.`type`
                        FROM `champ` 
                        LEFT JOIN `type_champ` ON `champ`.`id_type` = `type_champ`.`id` 
                        WHERE `champ`.`id_ensemble` = ?
                        ORDER BY `champ`.`ordre`;";
        $stmt = $this->conn->prepare( $query );    
        $stmt->bindParam(1, $id_group);
        $stmt->execute();
        $fields_arr = [];
        // var_dump($stmt->fetchAll());
        foreach($stmt->fetchAll() as $val) {
            $field = new stdClass();
            $field->field_id = $val["id"];
            $field->field_name = $val["nom"];
            $field->field_order = $val["ordre"];
            $field->field_type = $val["type"];
            $field->field_content = $val["contenu"];
            $field->field_group = $val["id_ensemble"];
            $fields_arr[] = $field;
        }
        return $fields_arr;
    }
    public function getContent($id_field, $id_page) {
        $query = "SELECT contenu
                    FROM contenu
                    WHERE id_champ = ? AND id_page = ?";
        $stmt = $this->conn->prepare( $query );
        $stmt->bindParam(1, $id_field);
        $stmt->bindParam(2, $id_page);
        $stmt->execute();
        return $stmt->fetchColumn();
    }
    public function updatePageFields($field_id, $page_id, $content) {    
        $query = "INSERT INTO contenu (id_champ, id_page, contenu)
                    VALUES (?, ?, ?)
                    ON DUPLICATE KEY UPDATE
                        contenu=?";
    
        $stmt = $this->conn->prepare($query);
        $hsc_content = htmlspecialchars(strip_tags($content));
        $stmt->bindParam(1, $field_id);
        $stmt->bindParam(2, $page_id);
        $stmt->bindParam(3, $hsc_content);
        $stmt->bindParam(4, $hsc_content);

        if($stmt->execute()){
            return true;
        }
        return false;
    }
    public function updateTopPage($id_page, $titre, $h1, $url) {    
        $query = "UPDATE " . $this->table_name . "
                SET
                    titre = ?,
                    h1 = ?,
                    url = ?
                WHERE id = ?";
    
        $stmt = $this->conn->prepare($query);
        $hsc_titre = htmlspecialchars(strip_tags($titre));
        $hsc_h1 = htmlspecialchars(strip_tags($h1));
        $hsc_url = htmlspecialchars(strip_tags($url));
        $stmt->bindParam(1, $hsc_titre);
        $stmt->bindParam(2, $hsc_h1);
        $stmt->bindParam(3, $hsc_url);
        $stmt->bindParam(4, $id_page);
        
        if($stmt->execute()){
            return true;
        }
        return false;
    }
    public function create(){
        $query = "INSERT INTO " . $this->table_name . " (nom, description, titre, h1, url, id_projet, id_modele)
                VALUES (?, ?, ?, ?, ?, ?, ?)";

        $stmt = $this->conn->prepare($query);
        
        $this->nom=htmlspecialchars(strip_tags($this->nom));
        $this->description=htmlspecialchars(strip_tags($this->description));
        $this->id_user=htmlspecialchars(strip_tags($this->id_user));
        $this->titre=htmlspecialchars(strip_tags($this->titre));
        $this->h1=htmlspecialchars(strip_tags($this->h1));
        $this->url=htmlspecialchars(strip_tags($this->url));
        $this->id_projet=htmlspecialchars(strip_tags($this->id_projet));
        $this->id_modele=htmlspecialchars(strip_tags($this->id_modele));

        $stmt->bindParam(1, $this->nom);
        $stmt->bindParam(2, $this->description);
        $stmt->bindParam(3, $this->titre);
        $stmt->bindParam(4, $this->h1);
        $stmt->bindParam(5, $this->url);
        $stmt->bindParam(6, $this->id_projet);
        $stmt->bindParam(7, $this->id_modele);
        

        if($stmt->execute()){
            return true;
        }
        return false;
    }
}
?>