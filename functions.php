<?php
$is_auth = rand(0, 1);
$user_name = 'Uzlova_Julia'; // ������� ����� ���� ���
$categori_mass = array(
"boards"=>"����� � ����","attachment"=>"���������", "boots"=>"�������", 
"clothing"=>"������", "tools"=>"�����������", "other"=>"������");
$items_massive = array(
    array("LotName" => "2014 Rossignol District Snowboard", "LotCategori" => "����� � ����", "LoTPrice" => 10999, "LotImage" => "img/lot-1.jpg"), 
    array("LotName" => "DC Ply Mens 2016/2017 Snowboard", "LotCategori" => "����� � ����", "LoTPrice" => 159999, "LotImage" => "img/lot-2.jpg"),
    array("LotName" => "��������� Union Contact Pro 2015 ���� ������ L/XL", "LotCategori" => "���������", "LoTPrice" => 8000, "LotImage" => "img/lot-3.jpg"),
    array("LotName" => "������� ��� ��������� DC Mutiny Charocal", "LotCategori" =>  "�������", "LoTPrice" => 10999, "LotImage" => "img/lot-4.jpg"),
    array("LotName" => "������ ��� ��������� DC Mutiny Charocal", "LotCategori" =>   "������", "LoTPrice" => 7500, "LotImage" => "img/lot-5.jpg"),
    array("LotName" => "����� Oakley Canopy", "LotCategori" =>"������", "LoTPrice" => 5400, "LotImage" => "img/lot-6.jpg")
);
function num_formation($num,$ruble)
{
    $num = ceil($num);
    if($num<1000)
        $z = $num;
    else
        $z = number_format($num,0,""," ");

    if($ruble==true)
         $z .='<b class="rub">�</b>';

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