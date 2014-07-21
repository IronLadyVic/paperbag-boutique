<?php
class View{
	
	public function renderNavigation($oProductType){
		$sHTML = '<div id="right-navigation-shop">';
	$sHTML = '<nav id="shop-links">';
	$sHTML .='<ul>';
	for($i=0; $i<count($oProductType); $i++ ){
		
	}
	$sHTML .='<p><strong>shop</strong></p>	';	
	$sHTML .='<li><a href="#">jackets</a></li>';
	$sHTML .='<li><a href="#">tops</a></li>';
	$sHTML .='<li><a href="#">tees</a></li>';
	$sHTML .='<li><a href="#">pants</a></li>';
	$sHTML .='<li><a href="#">shorts</a></li>';
	$sHTML .='<li><a href="#">knitwear</a></li>';
	$sHTML .='<li><a href="#">dresses</a></li>';
	$sHTML .='<li><a href="#">skirts</a></li>';
	$sHTML .='</ul>';
	$sHTML .='</nav>';
	$sHTML .='</div>';
		return $sHTML;
	}
}
?>