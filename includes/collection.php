<?php
require_once("connection.php"); //connection to database
require_once("producttype.php"); //product types or categories of products


class Collection{

 	public function getAllProductTypes(){
 		//defined a variable to store in an empty array.
 		$aTypes = array();
 		//make connection
 		$oConnection = new Connection();

 		$sSQL = "SELECT TypeID
 				FROM producttype";

 				$oResult = $oConnection->query($sSQL);

 				while($aRow=$oConnection->fetch_array($oResult)) { //loop through each row in the producttypes. with each loop the current row of data is stored into $aRow.
 					$oProductType = new ProductType(); //store the ProductType in an object.
 					$oProductType->load($aRow['TypeID']); //run the load function in ProductType and pass through the result of the database query.
 					$aTypes[] = $oProductType; //adding the producttype for this typeid to the array.
 				}

 				$oConnection->close_connection();

 		return $aTypes; //when getallproducttypes are called, it returns back a list of ProductType.
 	}
	



}
//TESTING

// $oProductTypes = new Collection;

// $aProductTypes = $oProductTypes->getAllProductTypes();

// echo "<pre>";
// print_r($aProductTypes);
// echo "</pre>";

?>