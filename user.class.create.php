<?php 
require_once("../config_global.php");
	
class User {
    private $connection;
	
	function __construct($connection){
        $this->connection = $connection;
		}

	function createUser($username, $password){

		$response = new StdClass();
		
        $stmt = $this->connection->prepare("SELECT id FROM users WHERE username=?");
		echo($this->connection->error);
		$stmt->bind_param("s", $username);
		$stmt->bind_result($id);
		$stmt->execute();
		if($stmt->fetch()){
			
			$error = new StdClass();
			$error->id = 0;
			$error->message = "Email on juba kasutusel";
			$response->error = $error;
			
			return $response;
			
		}
		$stmt->close();
        $stmt = $this->connection->prepare("INSERT INTO users (username, password) VALUES (?,?)");
        $stmt->bind_param("ss", $username, $password);
		
        if($stmt->execute()){
			
			$success = new StdClass();
			$success->message = "Kasutaja edukalt loodud";
			
			$response->success = $success;
			
			
		} else {
			echo($stmt->error);
			$error = new StdClass();
			$error->id = 1;
			$error->message = "Hiireke l�ks katki";
			$response->error = $error;
			
		}
        $stmt->close();
        return $response;
    }
		
}	
?>