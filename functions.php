<?php
$is_auth = rand(0, 1);
$user_name = 'Uzlova_Julia'; // укажите здесь ваше имя
$categori_mass = array(
"boards"=>"Доски и лыжи","attachment"=>"Крепления", "boots"=>"Ботинки", 
"clothing"=>"Одежда", "tools"=>"Инструменты", "other"=>"Разное");
$items_massive = array(
    array("LotName" => "2014 Rossignol District Snowboard", "LotCategori" => "Доски и лыжи", "LoTPrice" => 10999, "LotImage" => "img/lot-1.jpg"), 
    array("LotName" => "DC Ply Mens 2016/2017 Snowboard", "LotCategori" => "Доски и лыжи", "LoTPrice" => 159999, "LotImage" => "img/lot-2.jpg"),
    array("LotName" => "Крепления Union Contact Pro 2015 года размер L/XL", "LotCategori" => "Крепления", "LoTPrice" => 8000, "LotImage" => "img/lot-3.jpg"),
    array("LotName" => "Ботинки для сноуборда DC Mutiny Charocal", "LotCategori" =>  "Ботинки", "LoTPrice" => 10999, "LotImage" => "img/lot-4.jpg"),
    array("LotName" => "Куртка для сноуборда DC Mutiny Charocal", "LotCategori" =>   "Одежда", "LoTPrice" => 7500, "LotImage" => "img/lot-5.jpg"),
    array("LotName" => "Маска Oakley Canopy", "LotCategori" =>"Разное", "LoTPrice" => 5400, "LotImage" => "img/lot-6.jpg")
);
function num_formation($num,$ruble)
{
    $num = ceil($num);
    if($num<1000)
        $z = $num;
    else
        $z = number_format($num,0,""," ");

    if($ruble==true)
         $z .='<b class="rub">р</b>';

        return $z;
}   
function include_template($file_name, $file_data) 
{
    $file_name = "templates/$file_name";

    $result = "Error";
    if (!file_exists($file_name)) {
    return $result;
    }

    ob_start();
    extract($file_data);
    require($file_name);
    $result = ob_get_clean();
    return $result;
}
function GetTimeFromFunction()
{ 
date_default_timezone_set('Europe/Moscow');
$dateNow = strtotime("now");
$dateTommorow = strtotime("tomorrow");
$diff = $dateTommorow - $dateNow; 
$hours = floor($diff/(3600));
$minutes = floor(($diff-$hours*(3600))/60); 
if($hours<10)
$hours = "0".$hours;
if($minutes<10)
$minutes = "0".$minutes;
return sprintf("%0s:%0s",$hours,$minutes);
}
?>