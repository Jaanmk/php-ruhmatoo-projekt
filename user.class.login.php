<?php 
require_once("../config_global.php");
	
class userLogin {
    private $connection;
	
	function __construct($connection){
        $this->connection = $connection;
		}

	function loginUser($username, $password){

		$response = new StdClass();
		
        $stmt = $this->connection->prepare("SELECT id FROM users WHERE username=?");
		echo($this->connection->error);
		$stmt->bind_param("s", $username);
		$stmt->execute();
		if(!$stmt->fetch()){
			
			$error = new StdClass();
			$error->id = 0;
			$error->message = "Tundmatu kasutaja!";
			$response->error = $error;
			
			return $response;
			
		}
		$stmt->close();
        $stmt = $this->connection->prepare("SELECT id, username FROM users WHERE username = ? AND password = ? ");
		echo($this->connection->error);
        $stmt->bind_param("ss", $username, $password);
		$stmt->bind_result($id_from_db, $username_from_db);
        if($stmt->execute()){
			
			$success = new StdClass();
			$success->message = "Edukalt sisse logitud!!!";
			
			$user = new StdClass();
			$user->id = $id_from_db;
			$user->username = $username_from_db;
			
			$success->user = $user;
			
			$response->success = $success;
			
			
		} else {
			echo($stmt->error);
			$error = new StdClass();
			$error->id = 1;
			$error->message = "Meie hampstritel jooksev server on ülekoormatud palun oodake.";
			$response->error = $error;
			
		}
        $stmt->close();
        return $response;
    }
		
}	
?>