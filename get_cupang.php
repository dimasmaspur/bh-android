<?php
include 'koneksi.php';

$inputJSON = file_get_contents('php://input');
$input = json_decode($inputJSON, TRUE);
$response = array();

if (isset($input['id_cupang'])) {

    $id_cupang = $input['id_cupang'];

    $q = mysqli_query($con, "SELECT id_cupang,nama_cupang,harga_cupang, gambar_cupang FROM cupang WHERE id_cupang='$id_cupang'");
    $r = mysqli_fetch_array($q);

    $response["status"] = 0;
    $response["message"] = "Get cupang berhasil";
    $response["id_cupang"] = $r['id_cupang'];
    $response["nama_cupang"] = $r['nama_cupang'];
    $response["harga_cupang"] = $r['harga_cupang'];
    $response["gambar_cupang"] = $r['gambar_cupang'];
} else {
    $response["status"] = 2;
    $response["message"] = "Parameter ada yang kosong";
}
echo json_encode($response);
