<?php
include 'koneksi.php';

$inputJSON = file_get_contents('php://input');
$input = json_decode($inputJSON, TRUE);
$response = array();

$q = mysqli_query($con, "SELECT id_cupang,nama_cupang,harga_cupang, gambar_cupang FROM cupang ORDER BY id_cupang DESC");

$response["cupang"] = array();
while ($r = mysqli_fetch_array($q)) {
    $cupang = array();
    $cupang["id_cupang"] = $r['id_cupang'];
    $cupang["nama_cupang"] = $r['nama_cupang'];
    $cupang["harga_cupang"] = $r['harga_cupang'];
    $cupang["gambar_cupang"] = $r['gambar_cupang'];
    array_push($response["cupang"], $cupang);
}
$response["status"] = 0;
$response["message"] = "Get list cupang berhasil";

echo json_encode($response);
