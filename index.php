<?php
	require_once("functions.php");
$including_of_index=include_template('index.php', 
array('categori_mass'=> $categori_mass,'items_massive'=>$items_massive,'hours' => $hours,'minutes'=>$minutes));
print(include_template('layout.php', ['index_file'=>$including_of_index,'name_of_title'=>$name_of_title,'categori_mass'=>$categori_mass,'is_auth' => $is_auth, 'user_name' => $user_name]));
?> 
