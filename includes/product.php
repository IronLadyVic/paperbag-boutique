<?php
require_once("connection.php");
require_once("producttype.php");

class Product{

	private $iProductID;
	private $iSellerID;
	private $iBuyerID;
	private $iTypeID;
	private $sItemName;
	private $sDescription;
	private $sSize;
	private $sLabel;
	private $fPrice;
	private $sPhotoPath;
	private $iActive;
	private $bExisting;


	public function __construct(){
		$this->iProductID = 0;
		$this->iSellerID = 0;
		$this->iBuyerID = 0;
		$this->iTypeID = 0;
		$this->sItemName = "";
		$this->sDescription = "";
		$this->sSize = "";
		$this->sLabel = "";
		$this->fPrice = "";
		$this->sPhotoPath = "";
		$this->iActive = "";
		$this->bExisting = false;
	
	}

	public function load($iProductID){

		//open connection
		$oConnection = new Connection();
		//execute query from database
		$sSQL = "SELECT ProductID, SellerID, BuyerID, TypeID, ItemName, Description, Size, Label, Price, PhotoPath, Active 
		FROM tbproduct
		WHERE ProductID = ".$iProductID;
		// echo $sSQL;

		$oResult = $oConnection->query($sSQL);
		//extract data from Query Result
		$aProduct = $oConnection->fetch_array($oResult);


		$this->iProductID = $aProduct['ProductID'];
		$this->iSellerID = $aProduct['SellerID'];
		$this->iBuyerID = $aProduct['BuyerID'];
		$this->iTypeID = $aProduct['TypeID'];
		$this->sItemName = $aProduct['ItemName'];
		$this->sDescription =$aProduct['Description'];
		$this->sSize = $aProduct['Size'];
		$this->sLabel = $aProduct['Label'];
		$this->fPrice = $aProduct['Price'];
		$this->sPhotoPath =$aProduct['PhotoPath'];
		$this->iActive =$aProduct['Active'];


		$oConnection->close_connection();
		
		$this->bExisting = true;
	}

	public function save(){
		//open connection
		$oConnection = new Connection();

		if($this->bExisting == false){
		//execute query from database and insert data into....
		$sSQL = "INSERT INTO tbproduct(SellerID, BuyerID, TypeID, ItemName, Description, Size, Label, Price, PhotoPath, Active) 
		VALUES (
			'".$this->iSellerID."',
			'".$this->iBuyerID."',
			'".$this->iTypeID."',
			'".$this->sItemName."',
			'".$this->sDescription."',
			'".$this->sSize."',
			'".$this->sLabel."',
			'".$this->fPrice."',
			'".$this->sPhotoPath."',
			'".$this->iActive."')";
		//if the query runs, the result is ture and the save function will insert into id. if not true, then the query has failed.
		$bResult = $oConnection->query($sSQL);
		if($bResult == true){
			$this->iProductID = $oConnection->get_insert_id();
		}
		else{
			die($sSQL."Failed query");
		}
	}
		else{
		$sSQL = "UPDATE tbproduct 
		SET SellerID='".$this->iSellerID."', TypeID='".$this->iTypeID."',
			ItemName='".$this->sItemName."', Description='".$this->sDescription."',
			Size='".$this->sSize."', Label='".$this->sLabel."', Price='".$this->fPrice."',
			PhotoPath='".$this->sPhotoPath."', Active='".$this->iActive."'
			WHERE tbproduct.ProductID=".$this->iProductID;
		
			$bResult = $oConnection->query($sSQL);

		if($bResult == false){
			die($sSQL."Failed to update Product");	
			}
		}
	//close connection
	$oConnection->close_connection();

}

public function __get($var){
	switch ($var) {
		case "ProductID":return $this->iProductID;break;
		case "SellerID":return $this->iSellerID;break;
		case "BuyerID":return $this->iBuyerID;break;
		case "TypeID":return $this->iTypeID;break;
		case "ItemName":return $this->sItemName;break;
		case "Description":return $this->sDescription;break;
		case "Size":return $this->sSize;break;
		case "Label":return $this->sLabel;break;
		case "Price":return $this->fPrice;break;
		case "PhotoPath":return $this->sPhotoPath;break;
		case "Active":return $this->iActive;break;
		default: die($var."Does not exsist with Product Item");
		
	}
}

public function __set($var, $value){
	switch ($var) {
		case "SellerID":
		$this->iSellerID = $value;
		break;
		case "BuyerID":
		$this->iBuyerID = $value;
		break;
		case "TypeID":
		$this->iTypeID = $value;
		break;
		case "ItemName":
		$this->sItemName = $value;
		break;
		case "Description":
		$this->sDescription = $value;
		break;
		case "Size":
		$this->sSize = $value;
		break;
		case "Label":
		$this->sLabel = $value;
		break;
		case "Price":
		$this->fPrice = $value;
		break;
		case "PhotoPath":
		$this->sPhotoPath = $value;
		break;
		case "Active":
		$this->iActive = $value;
		break;
		default: die($var."Product could not be set");
		
	}
}

}
//TESTING

// $oProduct = new Product();

// $oProduct->load(4);
// $oProduct->SellerID =3;
// $oProduct->BuyerID = 'Null';
// $oProduct->TypeID = 6;
// $oProduct->ItemName = 'Woolly jumper';
// $oProduct->Description = 'black with gold sequins all over front and back';
// $oProduct->Size = 'XS';
// $oProduct->Label= 'SassnBide';
// $oProduct->Price = 80.00;
// $oProduct->PhotoPath = 'vicsjumper.png';
// $oProduct->Active = 1;


// $oProduct ->save();

// echo "<pre>";
// print_r($oProduct);
// echo "</pre>";


?>

