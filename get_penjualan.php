<?php
include 'koneksi.php';

$inputJSON = file_get_contents('php://input');
$input = json_decode($inputJSON, TRUE);
$response = array();

if (isset($input['id_penjualan'])) {

    $id_penjualan = $input['id_penjualan'];

    $q = mysqli_query($con, "SELECT id_cupang,notelp_pembeli,nama_pembeli,harga_penjualan, alamat_pembeli FROM penjualan WHERE id_penjualan='$id_penjualan'");
    $r = mysqli_fetch_array($q);
    $q2 = mysqli_query($con, "select nama_cupang, gambar_cupang from cupang where id_cupang='" . $r['id_cupang'] . "'");
    $r2 = mysqli_fetch_array($q2);

    $response["status"] = 0;
    $response["message"] = "Get penjualan berhasil";
    $response["nama_cupang"] = $r2['nama_cupang'];
    $response["gambar_cupang"] = $r2['gambar_cupang'];
    $response["notelp_pembeli"] = $r['notelp_pembeli'];
    $response["nama_pembeli"] = $r['nama_pembeli'];
    $response["harga_penjualan"] = $r['harga_penjualan'];
    $response["alamat_pembeli"] = $r['alamat_pembeli'];
} else {
    $response["status"] = 2;
    $response["message"] = "Parameter ada yang kosong";
}
echo json_encode($response);
