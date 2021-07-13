<?php
include 'koneksi.php';

$inputJSON = file_get_contents('php://input');
$input = json_decode($inputJSON, TRUE);
$response = array();

if (isset($input['id_user'])) {
    $id_user = $input['id_user'];
    $q = mysqli_query($con, "SELECT id_penjualan,id_cupang,nama_pembeli,notelp_pembeli, alamat_pembeli,harga_penjualan, approve FROM penjualan WHERE id_user='$id_user' ORDER BY id_penjualan DESC");

    if (mysqli_num_rows($q) == 0) {
        $response["status"] = 1;
        $response["message"] = "Tidak ada Data";
    } else {
        $response["penjualan"] = array();
        while ($r = mysqli_fetch_array($q)) {
            $penjualan = array();
            if (is_null($r['id_cupang'])) {
                $penjualan["nama_cupang"] = 'cupang tidak ada';
            } else {
                $q2 = mysqli_query($con, "select nama_cupang, gambar_cupang from cupang where id_cupang='" . $r['id_cupang'] . "'");
                $r2 = mysqli_fetch_array($q2);
                $penjualan["nama_cupang"] = $r2['nama_cupang'];
                $penjualan["gambar_cupang"] = $r2['gambar_cupang'];
            }
            $penjualan["id_penjualan"] = $r['id_penjualan'];
            $penjualan["nama_pembeli"] = $r['nama_pembeli'];
            $penjualan["notelp_pembeli"] = $r['notelp_pembeli'];
            $penjualan["alamat_pembeli"] = $r['alamat_pembeli'];
            $penjualan["harga_penjualan"] = $r['harga_penjualan'];
            $penjualan["approve"] = $r['approve'];
            array_push($response["penjualan"], $penjualan);
        }
        $response["status"] = 0;
        $response["message"] = "Get list penjualan berhasil";
    }
} else {
    $response["status"] = 2;
    $response["message"] = "Parameter ada yang kosong";
}

echo json_encode($response);
